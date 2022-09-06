// Synchronous FIFO, for Packet FIFO.
// overlay raw IP FIFO (raw_9b_fifo), for extend EOD data.

module PACKET_FIFO #(
	parameter integer AEMPTY_CNT = 1500, // IP MTU
	parameter integer AFULL_CNT = 6600  // ~= 16384 - MTU
)( 
	arst_n,
	di, clk, we,
	do, re,
	empty_flag, aempty_flag,
	full_flag, afull_flag, 
	// my original signal
	EOD_in, EOD_out
);

	input wire [7:0] di;
	input wire clk;
	input wire we,re;
	input wire arst_n;
	
	output wire [7:0] do;
	output wire empty_flag, aempty_flag;
	output wire full_flag, afull_flag;
	// my original signal
	input  wire EOD_in;
	output wire EOD_out;
	
	wire [8:0] raw_di = {di, EOD_in};
	wire [8:0] raw_do;
	assign do = raw_do[8:1];
	assign EOD_out = raw_do[0];

	RTL_SYNC_FIFO #(
		.DATA_WIDTH(9),
		.FIFO_DEPTH_POWER(13), // 14:16384, 15:32768, 16:65536
		.AFULL_CNT(6600),
		.AEMPTY_CNT(32) // not used 
	) raw_packet_rtl_fifo (
		.full_flag(full_flag),       // not used,
		.empty_flag(empty_flag),     // buffer read ready
		.afull_flag(afull_flag),     // 
		.aempty_flag(aempty_flag),   // not used
		.din(raw_di),       // read data out

		.dout(raw_do),       // write data in
		.wen(we),       // write enable
		.ren(re),       // read enable
		.clk(clk),       // clock
		.rst(~arst_n)); 

endmodule
