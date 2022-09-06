// Synchronous FIFO, for Packet FIFO.
// assume clkw, clkr is same.
// can store 16384 words (~= 10 full-frame)
// used in BODY_FIFO implementation.

module NEW_PACKET_FIFO #(
	parameter integer AEMPTY_CNT = 1500, // IP MTU
	parameter integer AFULL_CNT = 16000  // ~= 16384 - MTU
)( 
	arst_n,
	di, clkw, we,
	do, clkr, re,
	empty_flag, aempty_flag,
	full_flag, afull_flag, 
	// my original signal
	EOD_in, EOD_out
);

	input wire [7:0] di;
	input wire clkw, we;
	input wire clkr,re;
	input wire arst_n;
	wire rst_n;
	sync_2ff rst_sync (.clk(clkw), .din(arst_n), .dout(rst_n));
	
	output wire [7:0] do;
	output wire empty_flag, aempty_flag;
	output wire full_flag, afull_flag;
	// my original signal
	input  wire EOD_in;
	output wire EOD_out;
	
	wire [8:0] new_din;
	wire [8:0] new_dout;

	assign new_din = {di, EOD_in};
	assign do      = new_dout[8:1];
	assign EOD_out = new_dout[0];	
	
	/* if you modify BRAM9K size, need to change WA value */
	localparam WA=14;
	
	reg[WA:0] wadr;
	reg[WA:0] radr;	
	
	BRAM9Kx32 bram9kx32_impl( 
		.doa(), 		.dia(new_din), .addra(wadr[WA-1:0]), .clka(clkw), .wea(we & ~full_flag),   .rsta(~rst_n), 
		.dob(new_dout), .dib(9'bz),    .addrb(radr[WA-1:0]), .clkb(clkr), .web(1'b0), .rstb(~rst_n));

	/* write address */
	always @(posedge clkw or negedge rst_n) begin
		if(~rst_n)
			wadr <= {(WA+1){1'b0}};
		else if(we & ~full_flag)
			wadr <= wadr + 1'b1;
	end

	/* read address */
	always @(posedge clkw or negedge rst_n) begin
		if(~rst_n)
			radr <= {(WA+1){1'b0}};
		else if(re & ~empty_flag)
			radr <= radr + 1'b1;
	end

	/* full flag */
	assign full_flag  = (radr[WA-1:0] == wadr[WA-1:0]) && (radr[WA] != wadr[WA]);
	/* empty flag */
	assign empty_flag = (radr == wadr);
	
	/* also full flag */
	wire [WA:0] diff_adr = {wadr[WA] ^ radr[WA], wadr[12:0]} - {1'b0, radr[12:0]};

	reg afull_flag_reg;
	always @(posedge clkw or negedge rst_n) begin
		if (~rst_n)
			afull_flag_reg <= 1'b0;
		else
			afull_flag_reg <= (diff_adr >= AFULL_CNT);
	end
	assign afull_flag = afull_flag_reg;

	/* also empty flag */	
	reg aempty_flag_reg;
	always @(posedge clkw or negedge rst_n) begin
		if (~rst_n)
			aempty_flag_reg <= 1'b1;
		else
			aempty_flag_reg <= (diff_adr <= AEMPTY_CNT);
	end
	assign aempty_flag = aempty_flag_reg;
	
endmodule
