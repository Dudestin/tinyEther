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
	output reg h_fifo_rden; // wire 
	input  wire h_fifo_empty;

	// PAYLOAD_FIFO
	input  wire [7:0] b_fifo_dout;	
	output reg  b_fifo_rden; // wire
	input  wire b_fifo_empty;
	input  wire b_fifo_del; // delimiter

	// OUTPUT FIFO
	output reg [7:0] o_fifo_din; // wire
	output reg o_fifo_del;
	
	// Exclusive Control
    output wire [3:0] mutex_req;
    reg  [3:0] mutex_req_reg; // Index corresoponding to PHY_ID
    assign mutex_req = mutex_req_reg;
	reg  [3:0] mutex_req_next;
    input  wire [3:0] mutex_val;
	
	// Control Signal, usually came from a processor, to implement STP.
	input wire [3:0] mask_port; // 0 means passage, 1 means blocking.
	wire [3:0] mask_port_synced;
	// mask_port is one-hot encoded, so can apply synchronizers.
	// this method archiv each one can work on asynchronously
	vec_sync_2ff #(.WIDTH(4)) 
		sync_mask_port(.clk(clk), .din(mask_port), .dout(mask_port_synced));

	/* fifo write enable signals */
	reg [3:0] o_fifo_wren; // wire
	output wire p0_fifo_wren;
	output wire p1_fifo_wren;
	output wire p2_fifo_wren;
	output wire p3_fifo_wren;
	assign p0_fifo_wren = o_fifo_wren[0];
	assign p1_fifo_wren = o_fifo_wren[1];
	assign p2_fifo_wren = o_fifo_wren[2];
	assign p3_fifo_wren = o_fifo_wren[3];

	/* fifo also full array */
	input  wire p0_fifo_afull;
	input  wire p1_fifo_afull;
	input  wire p2_fifo_afull;
	input  wire p3_fifo_afull;
	wire [3:0] fifo_afull_list;
	assign fifo_afull_list = {p3_fifo_afull, p2_fifo_afull, p1_fifo_afull, p0_fifo_afull};

	/* h (meta data, include mac header) signal assign */
	reg  [HEADER_DWIDTH-1:0] h_fetched_reg;
	reg  [HEADER_DWIDTH-1:0] h_fetched_next;

    /* additionally information for switching */
	wire [0:0]  h_FRAME_VALID; // FCS is correct
	wire [0:0]  h_IS_CTRL_FRAME; // is control frame (i.e. BPDS, PAUSE), need to process on CPU.
	wire [1:0]  h_PORT;	       // the frame came PHY
    /* Ethernet II Frame Section */
	wire [47:0] h_DST_MAC;
	wire [47:0] h_SRC_MAC;
	wire [15:0] h_TYPE;
	assign h_FRAME_VALID = h_fetched_reg[115:115];	
	assign h_IS_CTRL_FRAME = h_fetched_reg[114:114];
	assign h_PORT    = h_fetched_reg[113:112];
	assign h_DST_MAC = h_fetched_reg[111:64];
	assign h_SRC_MAC = h_fetched_reg[63:16];
	assign h_TYPE    = h_fetched_reg[15:0];	

	/* STATE MACHINE */
	reg [3:0] STATE_reg;
	reg [3:0] STATE_next;
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
	reg  [MAC_TABLE_ADDR_LEN-1:0] table_write_addr;
	reg  [47:0] table_write_data;
	reg  [47:0] table_compare_data;
	reg  table_write_delete; // wire
	reg  table_write_enable; // wire

	wire table_write_busy;
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
		.match(table_match)
	);

	/* one-hot code for match port */
	wire [3:0] raw_match_port;
	assign raw_match_port = table_match_many[3:0] | table_match_many[7:4] | 
		table_match_many[11:8] | table_match_many[15:12] | table_match_many[19:16] | 
		table_match_many[23:20] | table_match_many[27:24] | table_match_many[31:28];
    reg [3:0] tx_port_code_reg;
    reg [3:0] tx_port_code_next;

	/* counter for each port */
	reg [PORT_TABLE_ADDR_LEN-1:0] port_cnt_reg [0:3];
	reg [PORT_TABLE_ADDR_LEN-1:0] port_cnt_next [0:3];

	/* general purpose counter */
	reg [4:0] cnt_reg;
    reg [4:0] cnt_next;

    always @*
    begin
        /* default value */
        STATE_next = STATE_reg;
        h_fifo_rden = 1'b0; // wire
        b_fifo_rden = 1'b0; // wire
        o_fifo_din = 8'b0; // wire
        o_fifo_del = 1'b0; // wire
        o_fifo_wren = 4'b0; // wire
        mutex_req_next = mutex_req_reg;
        h_fetched_next = h_fetched_reg;
		table_write_delete = 1'b0; // wire
	    table_write_enable = 1'b0; // wire
	    table_write_addr = 5'b0;
	    table_write_data = 48'b0;
	    table_compare_data = 48'b0;
        tx_port_code_next = tx_port_code_reg;
        port_cnt_next[0] = port_cnt_reg[0];
        port_cnt_next[1] = port_cnt_reg[1];
        port_cnt_next[2] = port_cnt_reg[2];
        port_cnt_next[3] = port_cnt_reg[3];
        cnt_next = cnt_reg;

        case (STATE_reg)
			S_IDLE:
			begin
				cnt_next = 5'b0;
				if (~h_fifo_empty /*& ~h_IS_CTRL_FRAME*/) // ignore control frame
				begin
					h_fetched_next = h_fifo_dout;
					STATE_next     = S_H_FETCH;
				end
			end
        
			S_H_FETCH:
			begin
				if (h_FRAME_VALID)
					STATE_next = S_SRC_SEARCH;
				else
				begin // if frame is broken, discard(don't send to any FIFO) the frame
					tx_port_code_next = 4'b0000;
					STATE_next = S_TX_HEADER;
				end
			end

			// search SRC_MAC from MAC table to determine need to register.
			S_SRC_SEARCH:
			begin
				table_compare_data = h_SRC_MAC;
				cnt_next = cnt_reg + 1'b1;
				/* after 2 tick (wait compare result came) */
				if (cnt_reg == 5'd1)
				begin
					if (table_match) // already registered.
						STATE_next = S_DST_SEARCH;
					else             // not registered yet.
						STATE_next = S_SRC_REGISTER;
					cnt_next = 5'b0;
				end
			end			

			// register SRC_MAC to MAC table
			S_SRC_REGISTER:
			begin
                table_write_addr   = {port_cnt_reg[h_PORT], h_PORT};
                table_write_data   = h_SRC_MAC;
				table_write_enable = 1'b1;
				cnt_next = 1'b1;
                if (~table_write_busy && cnt_reg)
                begin
				    table_write_enable = 1'b0;
                    port_cnt_next[h_PORT] = port_cnt_reg[h_PORT] + 1'b1;
                    STATE_next = S_DST_SEARCH;
                    cnt_next = 5'b0;
                end
			end

			// search DST_MAC from MAC table
			S_DST_SEARCH:
			begin
				table_compare_data = h_DST_MAC;
				cnt_next = cnt_reg + 1'b1;
				/* after 2 tick (wait compare result came)*/
				if (cnt_reg == 5'd1)
				begin
					if (table_match) // if exists, cast the frame
						mutex_req_next = raw_match_port & ~mask_port_synced; // Acquire Mutex
					else             // if not found, broadcast the frame
						mutex_req_next = 4'b1111 & ~(1 << h_PORT) & ~mask_port_synced; // Acquire Mutex		
					cnt_next = 5'b0;
					STATE_next = S_AWAIT_MUTEX;	
				end
			end

			/* await aquiring corresponding PHY-FIFO's MUTEX */
			S_AWAIT_MUTEX:
			begin
				if (&((mutex_req_reg & mutex_val)|~mutex_req_reg)) // await aquiring all need mutex 
				begin
					tx_port_code_next = mutex_req_reg & ~fifo_afull_list; // if fifo is also full, discard the frame. 
					STATE_next = S_TX_HEADER;
				end
			end

			/* send frame header */
			S_TX_HEADER:
			begin
				cnt_next = cnt_reg + 1'b1;
				o_fifo_wren = tx_port_code_reg; // wire 

				case (cnt_reg)
					// send Destination MAC Address Section
					5'd0  : o_fifo_din = h_DST_MAC[47:40];
					5'd1  : o_fifo_din = h_DST_MAC[39:32];
					5'd2  : o_fifo_din = h_DST_MAC[31:24];
					5'd3  : o_fifo_din = h_DST_MAC[23:16];
					5'd4  : o_fifo_din = h_DST_MAC[15:8];
					5'd5  : o_fifo_din = h_DST_MAC[7:0];
					// send Source MAC Address Section
					5'd6  : o_fifo_din = h_SRC_MAC[47:40];
					5'd7  : o_fifo_din = h_SRC_MAC[39:32];
					5'd8  : o_fifo_din = h_SRC_MAC[31:24];
					5'd9  : o_fifo_din = h_SRC_MAC[23:16];
					5'd10 : o_fifo_din = h_SRC_MAC[15:8];
					5'd11 : o_fifo_din = h_SRC_MAC[7:0];
					// send TYPE Section
					5'd12 : o_fifo_din = h_TYPE[15:8];
					5'd13 : 
					begin
							o_fifo_din = h_TYPE[7:0];
							cnt_next   = 5'b0;
							STATE_next = S_TX_PAYLOAD;
					end
					default :;
				endcase
			end

			// send frame payload	
			S_TX_PAYLOAD:
			begin
				o_fifo_din = b_fifo_dout; // wire
				o_fifo_wren = tx_port_code_reg; // wire
				b_fifo_rden = 1'b1; // wire
				if (b_fifo_del) // reach tail of frame
				begin
					h_fifo_rden  = 1'b1; // pop-out header from FIFO
					o_fifo_del   = 1'b1;
					STATE_next = S_END;
				end
				else if (b_fifo_empty) // if fifo is empty, stole process
				begin
					b_fifo_rden = 1'b0;
					o_fifo_wren = 4'b0;
				end
			end	

			// terminate
			S_END:
			begin
				mutex_req_next = 4'b0; // release PHY-FIFO
				cnt_next       = 5'b0; 
				STATE_next     = S_IDLE;
			end

			// UNDEFINED STATE
			default:
			begin
				STATE_next = S_IDLE;
			end

        endcase
    end

	always @(posedge clk)
	begin
		if (~rst_n)
		begin
			STATE_reg <= S_IDLE;
			mutex_req_reg <= 4'b0;
            h_fetched_reg <= 128'b0;
            tx_port_code_reg <= 1'b0;
			port_cnt_reg[0] <= {(PORT_TABLE_ADDR_LEN){1'b0}};
			port_cnt_reg[1] <= {(PORT_TABLE_ADDR_LEN){1'b0}};
			port_cnt_reg[2] <= {(PORT_TABLE_ADDR_LEN){1'b0}};
			port_cnt_reg[3] <= {(PORT_TABLE_ADDR_LEN){1'b0}}; 
			cnt_reg <= 5'b0;
		end
		else
		begin
			STATE_reg <= STATE_next;
			mutex_req_reg <= mutex_req_next;
            h_fetched_reg <= h_fetched_next;
            tx_port_code_reg <= tx_port_code_next;
			port_cnt_reg[0] <= port_cnt_next[0];
			port_cnt_reg[1] <= port_cnt_next[1];
			port_cnt_reg[2] <= port_cnt_next[2];
			port_cnt_reg[3] <= port_cnt_next[3];
			cnt_reg <= cnt_next;
		end
	end	
endmodule
