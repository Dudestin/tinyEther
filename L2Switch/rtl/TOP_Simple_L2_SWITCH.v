/* No CPU edition */

module TOP_Simple_L2_SWITCH #(
	parameter HEADER_DWIDTH = 128
)(
	CLK_IN,
	arst_n,
	
	PHY_RST,
	PHY_TXEN,
	PHY_TXD,
	PHY_TXC,
	PHY_RXD,
	PHY_RXC,
	PHY_CRS,
	PHY_COL		
);
	localparam PHY_NUM = 4;
	
	input wire CLK_IN; // 24 MHz
	input wire arst_n;	
	wire clk;
	
	// Sync Reset
	wire rst_n;         // Active-Low
	wire rst = ~rst_n;  // Active-High
	sync_2ff sync_2ff_impl (.clk(clk), .din(arst_n), .dout(rst_n));	

	// 100 MHz system clock
	pll_clk100M pll_impl(
		.refclk(CLK_IN),
		.reset(rst),
		.extlock(),
		.clk0_out(clk));
	
	output wire [3:0] PHY_RST;
	output wire [3:0] PHY_TXEN;
	output wire [3:0] PHY_TXD;
	input  wire [3:0] PHY_TXC;
	input  wire [3:0] PHY_RXD;
	input  wire [3:0] PHY_RXC;
	input  wire [3:0] PHY_CRS;
	input  wire [3:0] PHY_COL;

	// PHY Reset
	assign PHY_RST = {rst_n, rst_n, rst_n, rst_n}; // Active-Low

	// generate PHY-RX module & FIFO 
	wire [7:0] frame_fifo_rx_fifo_din [0:3];
	wire [3:0] frame_fifo_rx_fifo_wren;
	wire [7:0] frame_fifo_rx_fifo_dout [0:3] ;
	wire [3:0] frame_fifo_rx_fifo_rden;
	wire [3:0] frame_fifo_rx_empty_flag;
	wire [3:0] frame_fifo_rx_aempty_flag;
	wire [3:0] frame_fifo_rx_full_flag;
	wire [3:0] frame_fifo_rx_afull_flag;
	wire [3:0] frame_fifo_rx_half_flag;
	wire [3:0] frame_fifo_rx_EOD_in;
	wire [3:0] frame_fifo_rx_EOD_out;
	wire [3:0] frame_fifo_rx_frame_exist;
	genvar i;
	generate
		for (i = 0; i < PHY_NUM; i = i + 1)
		begin : PHY_RX_INTERFACE
		SNI_RX phy_rx (
			.arst_n(arst_n),
			.fifo_afull(frame_fifo_rx_afull_flag[i]),
			.fifo_din(frame_fifo_rx_fifo_din[i]),
			.fifo_wren(frame_fifo_rx_fifo_wren[i]),
			// Original FIFO Signal
			.fifo_EOD_in(frame_fifo_rx_EOD_in[i]),
			// SNI signal
			.RXC(PHY_RXC[i]),
			.CRS(PHY_CRS[i]),
			.RXD(PHY_RXD[i])	
		);
		FRAME_FIFO frame_fifo_rx(
			.arst_n(arst_n),
			.di(frame_fifo_rx_fifo_din[i]),
			.clkw(PHY_RXC[i]),
			.we(frame_fifo_rx_fifo_wren[i]),
			.do(frame_fifo_rx_fifo_dout[i]),
			.clkr(clk),
			.re(frame_fifo_rx_fifo_rden[i]),
			.empty_flag(frame_fifo_rx_empty_flag[i]),
			.aempty_flag(frame_fifo_rx_aempty_flag[i]),
			.full_flag(frame_fifo_rx_full_flag[i]),
			.afull_flag(frame_fifo_rx_afull_flag[i]), 
			.half_flag(frame_fifo_rx_half_flag[i]),
			// my original signal
			.EOD_in(frame_fifo_rx_EOD_in[i]),
			.EOD_out(frame_fifo_rx_EOD_out[i]),
			.frame_exist(frame_fifo_rx_frame_exist[i])
		);
		end
	endgenerate

	/* MAC Decoder */
	/* Header FIFO signal */
	wire [HEADER_DWIDTH-1:0] h_fifo_din; // TODO [x] : check bit width
	wire h_fifo_full; 
	wire h_fifo_wren;
	/* Body FIFO signal */	
	wire [7:0] b_fifo_din;
	wire b_fifo_afull;
	wire b_fifo_wren;
	wire b_fifo_del;
	MAC_DEC mac_dec (
		.clk(clk),
		.arst_n(arst_n),

		// PHY0-FIFO
		.i0_fifo_dout(frame_fifo_rx_fifo_dout[0]),
		.i0_fifo_empty(frame_fifo_rx_empty_flag[0]),
		.i0_fifo_aempty(frame_fifo_rx_aempty_flag[0]),
		.i0_fifo_afull(frame_fifo_rx_afull_flag[0]),
		.i0_fifo_half(frame_fifo_rx_half_flag[0]),
		.i0_fifo_frame_exist(frame_fifo_rx_frame_exist[0]),
		.i0_fifo_rden(frame_fifo_rx_fifo_rden[0]),
		.i0_fifo_del(frame_fifo_rx_EOD_out[0]),

		// PHY1-FIFO	
		.i1_fifo_dout(frame_fifo_rx_fifo_dout[1]),
		.i1_fifo_empty(frame_fifo_rx_empty_flag[1]),
		.i1_fifo_aempty(frame_fifo_rx_aempty_flag[1]),
		.i1_fifo_afull(frame_fifo_rx_afull_flag[1]),
		.i1_fifo_half(frame_fifo_rx_half_flag[1]),
		.i1_fifo_frame_exist(frame_fifo_rx_frame_exist[1]),				
		.i1_fifo_rden(frame_fifo_rx_fifo_rden[1]),
		.i1_fifo_del(frame_fifo_rx_EOD_out[1]),

		// PHY2-FIFO
		.i2_fifo_dout(frame_fifo_rx_fifo_dout[2]),
		.i2_fifo_empty(frame_fifo_rx_empty_flag[2]),
		.i2_fifo_aempty(frame_fifo_rx_aempty_flag[2]),
		.i2_fifo_afull(frame_fifo_rx_afull_flag[2]),
		.i2_fifo_half(frame_fifo_rx_half_flag[2]),
		.i2_fifo_frame_exist(frame_fifo_rx_frame_exist[2]),					
		.i2_fifo_rden(frame_fifo_rx_fifo_rden[2]),
		.i2_fifo_del(frame_fifo_rx_EOD_out[2]),

		// PHY3-FIFO
		.i3_fifo_dout(frame_fifo_rx_fifo_dout[3]),
		.i3_fifo_empty(frame_fifo_rx_empty_flag[3]),
		.i3_fifo_aempty(frame_fifo_rx_aempty_flag[3]),
		.i3_fifo_afull(frame_fifo_rx_afull_flag[3]),
		.i3_fifo_half(frame_fifo_rx_half_flag[3]),
		.i3_fifo_frame_exist(frame_fifo_rx_frame_exist[3]),			
		.i3_fifo_rden(frame_fifo_rx_fifo_rden[3]),
		.i3_fifo_del(frame_fifo_rx_EOD_out[3]),
			
		// HEADER-FIFO	
		.h_fifo_din(h_fifo_din),
		.h_fifo_full(h_fifo_full),
		.h_fifo_wren(h_fifo_wren),
	
		// BODY-FIFO 
 		.b_fifo_din(b_fifo_din),
 		.b_fifo_afull(b_fifo_afull),
 		.b_fifo_wren(b_fifo_wren),
 		.b_fifo_del(b_fifo_del)
	);
	
	/* Header-FIFO */
	wire [HEADER_DWIDTH-1:0] h_fifo_dout;
	wire h_fifo_rden;
	HEADER_FIFO #(
		.WIDTH(128)
	) header_fifo(
		.rst(rst),
		.di(h_fifo_din),  .clk(clk), .we(h_fifo_wren),
		.do(h_fifo_dout), .re(h_fifo_rden),
		.empty_flag(h_fifo_empty),
		.full_flag(h_fifo_full)
	);
	
	/* Body-FIFO */
	wire [7:0] frame_fifo_mac_b_fifo_do;
	wire frame_fifo_mac_b_fifo_re;
	wire frame_fifo_mac_b_empty_flag;
	wire frame_fifo_mac_b_EOD_out;
	NEW_PACKET_FIFO packet_fifo_mac_b_fifo(
		.arst_n(arst_n),
		.di(b_fifo_din),
		.clkw(clk),
		.we(b_fifo_wren),
		.do(frame_fifo_mac_b_fifo_do),
		.clkr(clk),
		.re(frame_fifo_mac_b_fifo_re),
		.empty_flag(frame_fifo_mac_b_empty_flag),
		.aempty_flag(), // not used here
		.full_flag(),   // not used here
		.afull_flag(b_fifo_afull), 
		// my original signal
		.EOD_in(b_fifo_del),
		.EOD_out(frame_fifo_mac_b_EOD_out)	
	);	
	
	// PHY-TX module & FIFO
	/* MAC Switch (L2-Switch) */
	wire [7:0] frame_fifo_tx_di;         // OUTPUT : common
	wire frame_fifo_del;                 // OUTPUT : common
	wire [3:0] frame_fifo_tx_afull_flag; // INPUT  : distinct
	wire [3:0] frame_fifo_tx_we;	     // OUTPUT : distinct
	MAC_SWITCH
	#(
		.PORT_TABLE_ADDR_LEN(3)
	) mac_switch (
		.clk(clk),
		.arst_n(arst_n),
	
		.h_fifo_dout(h_fifo_dout),
		.h_fifo_rden(h_fifo_rden),
		.h_fifo_empty(h_fifo_empty),
	
		.b_fifo_dout(frame_fifo_mac_b_fifo_do),
		.b_fifo_rden(frame_fifo_mac_b_fifo_re),
		.b_fifo_empty(frame_fifo_mac_b_empty_flag),
		.b_fifo_del(frame_fifo_mac_b_EOD_out),
	
		.o_fifo_din(frame_fifo_tx_di),
		.o_fifo_del(frame_fifo_del),
		.p0_fifo_afull(frame_fifo_tx_afull_flag[0]),
		.p0_fifo_wren(frame_fifo_tx_we[0]),		
		.p1_fifo_afull(frame_fifo_tx_afull_flag[1]),
		.p1_fifo_wren(frame_fifo_tx_we[1]),			
		.p2_fifo_afull(frame_fifo_tx_afull_flag[2]),
		.p2_fifo_wren(frame_fifo_tx_we[2]),		
		.p3_fifo_afull(frame_fifo_tx_afull_flag[3]),
		.p3_fifo_wren(frame_fifo_tx_we[3]),
		
		.mutex_req(),
		.mutex_val(4'b1111),
		
		.mask_port(4'b0)
	);
	
	
	/* PHY FRAME_OUTPUT */
	wire [7:0] frame_fifo_tx_do [0:3];
	wire [3:0] frame_fifo_tx_re;
	wire [3:0] frame_fifo_tx_empty_flag;
	wire [3:0] frame_fifo_tx_aempty_flag;
	wire [3:0] frame_fifo_tx_full_flag;
	wire [3:0] frame_fifo_tx_EOD_out;
	generate
	for (i = 0; i < PHY_NUM; i = i + 1)
	begin : PHY_TX_INTERFACE
		FRAME_FIFO frame_fifo_tx (
			.arst_n(arst_n),
			.di(frame_fifo_tx_di),
			.clkw(clk),
			.we(frame_fifo_tx_we[i]),
			.do(frame_fifo_tx_do[i]),
			.clkr(PHY_TXC[i]),
			.re(frame_fifo_tx_re[i]),
			.empty_flag(frame_fifo_tx_empty_flag[i]),
			.aempty_flag(frame_fifo_tx_aempty_flag[i]),
			.full_flag(frame_fifo_tx_full_flag[i]),
			.afull_flag(frame_fifo_tx_afull_flag[i]), 
			// my original signal
			.EOD_in(frame_fifo_del),
			.EOD_out(frame_fifo_tx_EOD_out[i])		
		);
		
		SNI_TX #(
   			.IFG(96) // Interframe Gap
		) phy_tx ( 
			.arst_n(arst_n),
			// FIFO signal
			.fifo_aempty(frame_fifo_tx_aempty_flag[i]),
			.fifo_dout(frame_fifo_tx_do[i]),
			.fifo_empty(frame_fifo_tx_empty_flag[i]),
			.fifo_rden(frame_fifo_tx_re[i]),
			// Original FIFO signal
			.fifo_EOD_out(frame_fifo_tx_EOD_out[i]),
			// SNI signal
			.TXC(PHY_TXC[i]),
			.COL(PHY_COL[i]),
			.CRS(PHY_CRS[i]),
			.TXD(PHY_TXD[i]),
			.TXEN(PHY_TXEN[i])
		);
	end	
	endgenerate
endmodule
