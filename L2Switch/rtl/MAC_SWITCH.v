// MAC-Switch (Switching-Hub) using CAM Memory based MAC table

// TODO [x] : impl. reset unit process

module MAC_SWITCH #(
	// MAC table size 2^PORT_TABLE_SIZE each PORT
	parameter PORT_TABLE_ADDR_LEN = 3,
	parameter HEADER_DWIDTH = 128
	)(
		clk,
		arst_n,

		/* INPUT : Header FIFO */
		h_fifo_dout,
		h_fifo_rden,
		h_fifo_empty,

		/* INPUT : Body FIFO */
		b_fifo_dout,
		b_fifo_rden,
		b_fifo_empty,
		b_fifo_del,

		/* OUTPUT : PHY-TX FIFO */
		o_fifo_din, // common for all PHY-TX FIFO
		o_fifo_del, // common for all PHY-TX FIFO
		p0_fifo_afull,
		p0_fifo_wren,
		p1_fifo_afull,
		p1_fifo_wren,
		p2_fifo_afull,
		p2_fifo_wren,
		p3_fifo_afull,
		p3_fifo_wren,
		
		// exclusive control
		// if don't use, assign mutex_val to 4'b1111;
		mutex_req,
		mutex_val,
		
		mask_port // assume async signal, 1 means corresponding port should be blocked.
	);
	localparam MAC_TABLE_ADDR_LEN = (PORT_TABLE_ADDR_LEN + 2);
	localparam MAC_TABLE_SIZE = 2**MAC_TABLE_ADDR_LEN;

	input wire clk;
	input wire arst_n;
	// sync reset
	wire rst_n;
	sync_2ff sync_2ff_rst_n (.clk(clk), .din(arst_n), .dout(rst_n));

	// HEADER_FIFO
	input  wire [HEADER_DWIDTH-1:0] h_fifo_dout;
	reg h_fifo_rden_reg;
	output wire h_fifo_rden;
	assign h_fifo_rden = h_fifo_rden_reg;
	input  wire h_fifo_empty;

	// PAYLOAD_FIFO
	input  wire [7:0] b_fifo_dout;	
	reg b_fifo_rden_reg;
	output wire b_fifo_rden;
    //	assign b_fifo_rden = b_fifo_rden_reg;
    assign b_fifo_rden = (STATE == S_TX_PAYLOAD) & ~b_fifo_empty;
	input  wire b_fifo_empty;
	input  wire b_fifo_del; // delimiter

	// OUTPUT FIFO
	output wire [7:0] o_fifo_din;
	reg [7:0] tx_word_reg;
	assign o_fifo_din = tx_word_reg;
	output wire o_fifo_del;
	reg o_fifo_del_reg;
	assign o_fifo_del = o_fifo_del_reg;
	
	// Exclusive Control
	output reg  [3:0] mutex_req; // Index corresoponding to PHY_ID
	input  wire [3:0] mutex_val;
	
	// Control Signal, usually came from a processor, to implement STP.
	input wire [3:0] mask_port; // 0 means passage, 1 means blocking.
	wire [3:0] mask_port_synced;
	// mask_port is one-hot encoded, so can apply synchronizers.
	// this method archiv each one can work on asynchronously
	vec_sync_2ff #(.WIDTH(4)) 
		sync_mask_port(.clk(clk), .din(mask_port), .dout(mask_port_synced));

	/* fifo write enable signals */
	reg [3:0] o_fifo_wren_reg;
	output wire p0_fifo_wren;
	assign p0_fifo_wren = o_fifo_wren_reg[0];

	output wire p1_fifo_wren;
	assign p1_fifo_wren = o_fifo_wren_reg[1];

	output wire p2_fifo_wren;
	assign p2_fifo_wren = o_fifo_wren_reg[2];

	output wire p3_fifo_wren;
	assign p3_fifo_wren = o_fifo_wren_reg[3];

	/* fifo also full array */
	input  wire p0_fifo_afull;
	input  wire p1_fifo_afull;
	input  wire p2_fifo_afull;
	input  wire p3_fifo_afull;
	wire [3:0] fifo_afull_list;
	assign fifo_afull_list = {p3_fifo_afull, p2_fifo_afull, p1_fifo_afull, p0_fifo_afull};

	/* header signal assign */
	reg  [HEADER_DWIDTH-1:0] header_fetched;

	wire [0:0]  h_FRAME_VALID; // FCS is correct
	assign h_FRAME_VALID = header_fetched[115:115];	
	
	wire [0:0]  h_IS_CTRL_FRAME; // is control frame (i.e. BPDS, PAUSE), need to process on CPU.
	assign h_IS_CTRL_FRAME = header_fetched[114:114];

	wire [1:0]  h_PORT;	       // the frame came PHY
	assign h_PORT    = header_fetched[113:112];

	wire [47:0] h_DST_MAC;
	assign h_DST_MAC = header_fetched[111:64];

	wire [47:0] h_SRC_MAC;
	assign h_SRC_MAC = header_fetched[63:16];

	wire [15:0] h_TYPE;        // TYPE section of Ethernet II Frame
	assign h_TYPE    = header_fetched[15:0];	

	/* STATE MACHINE */
	reg [3:0] STATE;
	localparam S_IDLE  = 4'h0,
		S_H_FETCH      = 4'h1,
		S_SRC_SEARCH   = 4'h2,
		S_SRC_REGISTER = 4'h3,
		S_DST_SEARCH   = 4'h4,
		S_AWAIT_MUTEX  = 4'h5,
		S_TX_HEADER    = 4'h6,
		S_TX_PAYLOAD   = 4'h7,
		S_END          = 4'h8;

	/* MAC Table implemented with CAM */
	wire [MAC_TABLE_ADDR_LEN-1:0] table_write_addr;
	reg  [MAC_TABLE_ADDR_LEN-1:0] table_write_addr_reg;
	assign table_write_addr = table_write_addr_reg;	

	wire [47:0] table_write_data;
	reg  [47:0] table_write_data_reg;
	assign table_write_data = table_write_data_reg;	

	wire table_write_delete;
	reg  table_write_delete_reg;
	assign table_write_delete = table_write_delete_reg;

	wire table_write_enable;
	reg  table_write_enable_reg;
	assign table_write_enable = table_write_enable_reg;

	wire table_write_busy;

	wire [47:0] table_compare_data;
	reg  [47:0] table_compare_data_reg;
	assign table_compare_data = table_compare_data_reg;

	wire [MAC_TABLE_SIZE-1:0] table_match_many;

	wire table_match;

	cam # (
		.DATA_WIDTH(48), // MAC LENGTH
		.ADDR_WIDTH(MAC_TABLE_ADDR_LEN),  // 3(EACH PORT TABLE) + 2(PORT)
		.CAM_STYLE("SRL"), // use Shift Register Implementation.
		.SLICE_WIDTH(4)
	) MAC_cam (
		.clk(clk),
		.rst(~rst_n),

		.write_addr(table_write_addr),
		.write_data(table_write_data),
		.write_delete(table_write_delete),
		.write_enable(table_write_enable),
		.write_busy(table_write_busy),

		.compare_data(table_compare_data),
		.match_many(table_match_many),
		// .match_single(),
		// .match_addr(),
		.match(table_match)
	);

	/* one-hot code for match port */
	wire [3:0] match_port;
	reg [3:0] match_port_reg; 	
	assign match_port = table_match_many[3:0] | table_match_many[7:4] | 
		table_match_many[11:8] | table_match_many[15:12] | table_match_many[19:16] | 
		table_match_many[23:20] | table_match_many[27:24] | table_match_many[31:28];

	/* counter for each port */
	reg [PORT_TABLE_ADDR_LEN-1:0] port_cnt [0:3];

	/* general purpose counter */
	reg [4:0] cnt_reg;

	task reset_reg;
		begin
			STATE <= S_IDLE;
			h_fifo_rden_reg <= 1'b0;
			b_fifo_rden_reg <= 1'b0;
			tx_word_reg     <= 8'b0;
			o_fifo_wren_reg <= 4'b0;
			table_write_addr_reg <= 1'b0;
			table_write_data_reg <= 48'b0;
			table_write_delete_reg <= 1'b0;
			table_write_enable_reg <= 1'b0;
			table_compare_data_reg <= 1'b0;
			mutex_req      <= 4'b0;
			match_port_reg <= 4'b0;
			cnt_reg  <= 4'b0;
		end
	endtask

	always @(posedge clk)
	begin
		if (rst_n == 1'b0)
		begin
			port_cnt[0] <= {(PORT_TABLE_ADDR_LEN){1'b0}};
			port_cnt[1] <= {(PORT_TABLE_ADDR_LEN){1'b0}};
			port_cnt[2] <= {(PORT_TABLE_ADDR_LEN){1'b0}};
			port_cnt[3] <= {(PORT_TABLE_ADDR_LEN){1'b0}}; 
			reset_reg();
		end
		else
		begin
			if (STATE == S_IDLE)
			begin
				cnt_reg <= 5'b0;
				if (~h_fifo_empty/*& ~h_IS_CTRL_FRAME */) // ignore control frame
				begin
					header_fetched <= h_fifo_dout;
					STATE          <= S_H_FETCH;
				end
			end

			else if (STATE == S_H_FETCH)
			begin
				if (h_FRAME_VALID)
					STATE <= S_SRC_SEARCH;
				else
				begin // if frame is broken, discard(don't send to any FIFO) the frame
					match_port_reg <= 4'b0000;
					STATE <= S_TX_HEADER;
				end
			end

			// search SRC_MAC from MAC table to determine need to register.
			else if (STATE == S_SRC_SEARCH)
			begin
				table_compare_data_reg <= h_SRC_MAC;
				cnt_reg <= cnt_reg + 1'b1;
				/* after 2 tick (wait compare result came) */
				if (cnt_reg == 5'd2)
				begin
					if (table_match) // already registered.
						STATE <= S_DST_SEARCH;	
					else             // not registered yet.
						STATE <= S_SRC_REGISTER;
					cnt_reg <= 5'b0;
				end
			end			

			// register SRC_MAC to MAC table
			else if (STATE == S_SRC_REGISTER)
			begin
				cnt_reg <= cnt_reg + 1'b1;
				table_write_enable_reg <= 1'b0;
				if (cnt_reg == 5'b0)
				begin
					port_cnt[h_PORT]       <= port_cnt[h_PORT] + 1'b1; // increment port counter
					table_write_addr_reg   <= {port_cnt[h_PORT], h_PORT};
					table_write_data_reg   <= h_SRC_MAC;
					table_write_enable_reg <= 1'b1;
				end
				else if (~table_write_busy && cnt_reg >= 5'd2) // wait write complete (2 means module latency)
				begin
					STATE <= S_DST_SEARCH;
					cnt_reg <= 5'b0;
				end
			end

			// search DST_MAC from MAC table
			else if (STATE == S_DST_SEARCH)
			begin
				table_compare_data_reg <= h_DST_MAC;
				cnt_reg <= cnt_reg + 1'b1;
				/* after 2 tick (wait compare result came)*/
				if (cnt_reg == 5'd2)
				begin
					if (table_match) // if exists, cast the frame
						mutex_req <= match_port & ~mask_port_synced; // Acquire Mutex
					else             // if not found, broadcast the frame
						mutex_req <= 4'b1111 & ~(1 << h_PORT) & ~mask_port_synced; // Acquire Mutex		
					cnt_reg <= 5'b0;
					STATE <= S_AWAIT_MUTEX;	
				end
			end
			
			/* await aquiring corresponding PHY-FIFO's MUTEX */
			else if (STATE == S_AWAIT_MUTEX)
			begin
				if (&((mutex_req & mutex_val)|~mutex_req)) // await aquiring all need mutex 
				begin
					match_port_reg <= mutex_req & ~fifo_afull_list; // if fifo is also full, discard the frame. 
					STATE <= S_TX_HEADER;
				end
			end

			// send frame header
			else if (STATE == S_TX_HEADER)
			begin
				cnt_reg <= cnt_reg + 1'b1;
				o_fifo_wren_reg <= match_port_reg;

				case (cnt_reg)
					// send Destination MAC Address Section
					5'd0  : tx_word_reg <= h_DST_MAC[47:40];
					5'd1  : tx_word_reg <= h_DST_MAC[39:32];
					5'd2  : tx_word_reg <= h_DST_MAC[31:24];
					5'd3  : tx_word_reg <= h_DST_MAC[23:16];
					5'd4  : tx_word_reg <= h_DST_MAC[15:8];
					5'd5  : tx_word_reg <= h_DST_MAC[7:0];
					// send Source MAC Address Section
					5'd6  : tx_word_reg <= h_SRC_MAC[47:40];
					5'd7  : tx_word_reg <= h_SRC_MAC[39:32];
					5'd8  : tx_word_reg <= h_SRC_MAC[31:24];
					5'd9  : tx_word_reg <= h_SRC_MAC[23:16];
					5'd10 : tx_word_reg <= h_SRC_MAC[15:8];
					5'd11 : tx_word_reg <= h_SRC_MAC[7:0];
					// send TYPE Section
					5'd12 : tx_word_reg <= h_TYPE[15:8];
					5'd13 : 
					begin
							tx_word_reg <= h_TYPE[7:0];
							cnt_reg <= 5'b0;
							STATE   <= S_TX_PAYLOAD;
					end
					default :;
				endcase
			end

			// send frame payload	
			else if (STATE == S_TX_PAYLOAD)
			begin
				tx_word_reg <= b_fifo_dout;
				// b_fifo_rden_reg <= 1'b1;
				o_fifo_wren_reg <= match_port_reg;
				if (b_fifo_del)        // reach tail of frame
				begin
					h_fifo_rden_reg  <= 1'b1; // pop-out header from FIFO
					o_fifo_del_reg   <= 1'b1;
					STATE <= S_END;
				end
				else if (b_fifo_empty) // if fifo is empty, stole process
				begin
					// b_fifo_rden_reg <= 1'b0;
					o_fifo_wren_reg <= 4'b0;
				end
			end	

			// terminate
			else if (STATE == S_END)
			begin
				h_fifo_rden_reg <= 1'b0; // pair with L362
				o_fifo_wren_reg <= 4'b0;
				o_fifo_del_reg  <= 1'b0;
				b_fifo_rden_reg <= 1'b0;
				mutex_req       <= 4'b0; // release PHY-FIFO
				cnt_reg <= 5'b1; 
				if (cnt_reg)
				begin
					reset_reg();
					STATE <= S_IDLE;
				end
			end

			// UNDEFINED STATE
			else
			begin
				STATE <= S_END;
				mutex_req <= 4'b0;
			end
		end
	end	
endmodule
