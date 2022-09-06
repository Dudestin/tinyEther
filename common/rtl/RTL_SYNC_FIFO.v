module RTL_SYNC_FIFO #(
	parameter DATA_WIDTH = 128,
	parameter FIFO_DEPTH_POWER = 8, // 14:16384, 15:32768, 16:65536  
	parameter AFULL_CNT = (1 << FIFO_DEPTH_POWER) - 4,
	parameter AEMPTY_CNT = 2
)(
	full_flag ,       // buffer write ready
	empty_flag,       // buffer read ready
	afull_flag,
	aempty_flag,	
	
	din,       // read data out

	dout,       // write data in
	wen,       // write enable
	ren,       // read enable
	clk,       // clock
	rst);      // sync reset ( h active )

	localparam integer FIFO_DEPTH =  1 << FIFO_DEPTH_POWER;
	localparam WA = FIFO_DEPTH_POWER;
	localparam WD = DATA_WIDTH;

	input wire [WD-1:0] din;
	input wire wen;
	input wire ren;
	input wire clk; 
	input wire rst; 
	output reg full_flag;
	output reg empty_flag;
	output reg aempty_flag;
	output reg afull_flag;
	output wire [WD-1:0] dout;

	// wires & regs
	reg	[WA:0] wr_ad;       // wr address
	reg [WA:0] rd_ad;       // rd address
    wire [WA:0] wd_ad_next;
	wire [WA:0] rd_ad_next;

	reg	 [WD-1:0] rtl_mem [0:FIFO_DEPTH-1];  // memory array

	// memory wr
	always @(posedge clk)
	begin
		if (wen & ~full_flag) 
			rtl_mem[wr_ad[WA-1:0]] <= din ;
	end

	// memory rd
	reg [DATA_WIDTH-1:0] dout_reg;
	assign dout = dout_reg;	 // BRAM-edition
	always @(posedge clk)
	begin
		if (rst)
			dout_reg <= {(WD){1'b0}};
		else
			dout_reg <= rtl_mem[rd_ad_next[WA-1:0]];
	end
    // assign dout = rtl_mem[rd_ad[WA-1:0]]; // D-RAM edition

	// write pointer
    wire [WA:0] wr_ad_next = wr_ad + (wen & ~full_flag);

	always  @(posedge clk)
	begin
		if (rst)
			wr_ad   <= {(WA+1){1'b0}};
		else
			wr_ad   <= wr_ad_next;
	end

	// read pointer
	assign rd_ad_next = rd_ad + (ren & ~empty_flag);
	always  @(posedge clk)
	begin
		if (rst) 
			rd_ad   <= {(WA+1){1'b0}};
		else
			rd_ad   <= rd_ad_next;
	end

    // full flag 
    always @(posedge clk)
    begin
        if (rst)
            full_flag <= 1'b0;
        else
            full_flag <= (wr_ad[WA:0] == {~rd_ad[WA], rd_ad[WA-1:0]});
    end

    // empty flag 
    reg [WA:0] wr_ad_lat;
    always @*
    begin
        empty_flag = wr_ad_lat == rd_ad;
    end

    always @(posedge clk)
    begin
        if (rst)
            wr_ad_lat <= {(WA+1){1'b0}};
        else
            wr_ad_lat  <= wr_ad;
    end

	wire [WA:0] diff_adr = {wr_ad_next[WA] ^ rd_ad_next[WA], wr_ad_next[WA-1:0]} - {1'b0, rd_ad_next[WA-1:0]};

    // also full flag
    always @(posedge clk)
    begin
        if (rst)
            afull_flag <= 1'b0;
        else
            afull_flag <= (diff_adr >= AFULL_CNT);
    end
	
    // also empty flag    
    always @(posedge clk)
    begin
        if (rst)
            aempty_flag <= 1'b1;
        else
            aempty_flag <= (diff_adr <= AEMPTY_CNT);
    end
    
endmodule
