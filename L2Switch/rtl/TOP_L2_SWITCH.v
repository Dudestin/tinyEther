/* SoC Implemented edition */

module TOP_L2_SWITCH #(
           parameter HEADER_DWIDTH = 128
       )(
           CLK_IN,
           usr_btn,

           RGB_LED,

           PHY_RST,
           PHY_TXEN,
           PHY_TXD0,
           PHY_TXD1,
           PHY_REF_CLK,
           PHY_RXD0,
           PHY_RXD1,
           PHY_CRS_DV,

           PHY_MDC,
           PHY_MDIO,

           soc_uart_tx,
           soc_uart_rx
       );
localparam PHY_NUM = 4;

input wire CLK_IN; // 24 MHz
input wire usr_btn;
wire clk;
wire soc_clk;

/* generate 48 MHz system clock from 24MHz Clock */
pll_clk100M pll_impl(
                .refclk(CLK_IN),
                .reset(1'b0),
                .extlock(),
                .clk0_out(clk), // 100MHz
                .clk1_out(soc_clk)); // 50 MHz

/* reset system */
/* push USER PUSH BUTTON on the Tang PriMER to reset the circuit */
reg [5:0] reset_cnt = 0;
wire rst_n = &reset_cnt;
wire rst = ~rst_n;  // Active-High;
always @(posedge clk)
    if (~usr_btn)
        reset_cnt <= 0;
    else
        reset_cnt <= reset_cnt + !rst_n;

output wire [2:0] RGB_LED;
assign RGB_LED[0] = rst;
assign RGB_LED[1] = rst;
assign RGB_LED[2] = rst;

output wire [3:0] PHY_RST;
output wire [3:0] PHY_TXEN;
output wire [3:0] PHY_TXD0;
output wire [3:0] PHY_TXD1;
input  wire [3:0] PHY_REF_CLK;
input  wire [3:0] PHY_RXD0;
input  wire [3:0] PHY_RXD1;
input  wire [3:0] PHY_CRS_DV;

// PHY Reset
assign PHY_RST = 4'b1111; // Active-Low

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
// SoC monitoring signal
wire [15:0] phy_rx_succ_rx_count_gray [0:3];
wire [15:0] phy_rx_buff_OF_count_gray [0:3];
genvar i;
generate
    for (i = 0; i < PHY_NUM; i = i + 1)
    begin : PHY_RX_INTERFACE
        RMII_RX phy_rx (
                    .arst_n(rst_n),
                    .fifo_afull(frame_fifo_rx_afull_flag[i]),
                    .fifo_din(frame_fifo_rx_fifo_din[i]),
                    .fifo_wren(frame_fifo_rx_fifo_wren[i]),
                    // Original FIFO Signal
                    .fifo_EOD_in(frame_fifo_rx_EOD_in[i]),
                    // RMII signal
                    .REF_CLK(PHY_REF_CLK[i]),
                    .CRS_DV(PHY_CRS_DV[i]),
                    .RXD0(PHY_RXD0[i]),
                    .RXD1(PHY_RXD1[i]),
                    .succ_rx_count_gray(phy_rx_succ_rx_count_gray[i]), // 16-bit, gray-code
                    .buff_OF_count_gray(phy_rx_buff_OF_count_gray[i])  // 16-bit, gray-code
                );
        FRAME_FIFO #(
                       .AEMPTY_CNT(60)
                   ) frame_fifo_rx(
                       .arst_n(rst_n),
                       .di(frame_fifo_rx_fifo_din[i]),
                       .clkw(PHY_REF_CLK[i]),
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
            .arst_n(rst_n),

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
/* NEW_PACKET_FIFO is my original FIFO, large memory space */
/* PACKET_FIFO is IP FIFO */
wire [7:0] frame_fifo_mac_b_fifo_do;
wire frame_fifo_mac_b_fifo_re;
wire frame_fifo_mac_b_empty_flag;
wire frame_fifo_mac_b_EOD_out;
/*
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
*/
PACKET_FIFO packet_fifo_mac_b_fifo(
                .arst_n(rst_n),
                .di(b_fifo_din),
                .clk(clk),
                .we(b_fifo_wren),
                .do(frame_fifo_mac_b_fifo_do),
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
        .arst_n(rst_n),

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
// SoC monitoring signal
wire [15:0] phy_tx_succ_tx_count_gray [0:3];
wire [15:0] phy_tx_fail_tx_count_gray [0:3];
generate
    for (i = 0; i < PHY_NUM; i = i + 1)
    begin : PHY_TX_INTERFACE
        FRAME_FIFO #(
                       .AEMPTY_CNT(32)
                   ) frame_fifo_tx (
                       .arst_n(rst_n),
                       .di(frame_fifo_tx_di),
                       .clkw(clk),
                       .we(frame_fifo_tx_we[i]),
                       .do(frame_fifo_tx_do[i]),
                       .clkr(PHY_REF_CLK[i]),
                       .re(frame_fifo_tx_re[i]),
                       .empty_flag(frame_fifo_tx_empty_flag[i]),
                       .aempty_flag(frame_fifo_tx_aempty_flag[i]),
                       .full_flag(frame_fifo_tx_full_flag[i]),
                       .afull_flag(frame_fifo_tx_afull_flag[i]),
                       // my original signal
                       .EOD_in(frame_fifo_del),
                       .EOD_out(frame_fifo_tx_EOD_out[i])
                   );

        RMII_TX #(
                    .IFG(48) // Interframe Gap
                ) phy_tx (
                    .arst_n(rst_n),
                    // FIFO signal
                    .fifo_aempty(frame_fifo_tx_aempty_flag[i]),
                    .fifo_dout(frame_fifo_tx_do[i]),
                    .fifo_empty(frame_fifo_tx_empty_flag[i]),
                    .fifo_rden(frame_fifo_tx_re[i]),
                    // Original FIFO signal
                    .fifo_EOD_out(frame_fifo_tx_EOD_out[i]),
                    // config signal
                    .duplex_mode(1'b1), // 1 means full, 0 means half
                    // RMII signal
                    .REF_CLK(PHY_REF_CLK[i]),
                    .CRS_DV(PHY_CRS_DV[i]),
                    .TXD0(PHY_TXD0[i]),
                    .TXD1(PHY_TXD1[i]),
                    .TX_EN(PHY_TXEN[i]),
                    // monitor
                    .succ_tx_count_gray(phy_tx_succ_tx_count_gray[i]), // Success to TX frame counter, gray-encoded, 16-bit counter
                    .fail_tx_count_gray(phy_tx_fail_tx_count_gray[i])  // Fail to TX frame counter, gray-encoded, 16-bit counter
                );
    end
    endgenerate

        /* SoC Implementation */
        output wire soc_uart_tx;
input  wire soc_uart_rx;

/*
wire        iomem_valid;
reg         iomem_ready;
wire [3:0]  iomem_wstrb;
wire [31:0] iomem_addr;
wire [31:0] iomem_wdata;
reg  [31:0] iomem_rdata;

function [31:0] endian_conv(input [31:0] din);
	endian_conv = {din[7:0], din[15:8], din[23:16], din[31:24]};
endfunction	
*/

/*
wire [15:0] phy_rx_succ_rx_count_sync[0:3];
wire [15:0] phy_rx_buff_OF_count_sync[0:3];
wire [15:0] phy_tx_succ_tx_count_gray[0:3];
wire [15:0] phy_tx_fail_tx_count_gray[0:3];
generate
	for (i = 0; i < 4; i = i + 1)
	begin
		vec_sync_2ff soc_io_sync_impl (.clk(soc_));
	end
endgenerate
*/

/*
always @(posedge clk) begin
	iomem_ready <= 0;
	if (iomem_valid && !iomem_ready) begin
		case (iomem_addr)
			// PHY 0 
			32'h03_00_00_00 : // reg_phy0_rx_succ_count_gray
			begin
				iomem_ready <= 1;
				iomem_rdata <= endian_conv({phy_rx_succ_rx_count_gray[0], 16'b0});
			end
			32'h03_00_00_04 : // reg_phy0_rx_OF_count_gray
			begin
				iomem_ready <= 1;
				iomem_rdata <= endian_conv({phy_rx_buff_OF_count_gray[0], 16'b0});
			end
			32'h03_00_00_08 : // reg_phy0_tx_succ_count_gray
			begin
				iomem_ready <= 1;
				iomem_rdata <= endian_conv({phy_tx_succ_tx_count_gray[0], 16'b0});					
			end
			32'h03_00_00_0C : // reg_phy0_tx_fail_count_gray
			begin
				iomem_ready <= 1;
				iomem_rdata <= endian_conv({phy_tx_fail_tx_count_gray[0], 16'b0});					
			end
			// PHY 1
			32'h03_00_01_00 : // reg_phy1_rx_succ_count_gray
			begin
				iomem_ready <= 1;
				iomem_rdata <= endian_conv({phy_rx_succ_rx_count_gray[1], 16'b0});
			end
			32'h03_00_01_04 : // reg_phy1_rx_OF_count_gray
			begin
				iomem_ready <= 1;
				iomem_rdata <= endian_conv({phy_rx_buff_OF_count_gray[1], 16'b0});
			end
			32'h03_00_01_08 : // reg_phy1_tx_succ_count_gray
			begin
				iomem_ready <= 1;
				iomem_rdata <= endian_conv({phy_tx_succ_tx_count_gray[1], 16'b0});					
			end
			32'h03_00_01_0C : // reg_phy1_tx_fail_count_gray
			begin
				iomem_ready <= 1;
				iomem_rdata <= endian_conv({phy_tx_fail_tx_count_gray[1], 16'b0});					
			end
			// PHY 2			
			32'h03_00_02_00 : // reg_phy2_rx_succ_count_gray
			begin
				iomem_ready <= 1;
				iomem_rdata <= endian_conv({phy_rx_succ_rx_count_gray[2], 16'b0});
			end
			32'h03_00_02_04 : // reg_phy2_rx_OF_count_gray
			begin
				iomem_ready <= 1;
				iomem_rdata <= endian_conv({phy_rx_buff_OF_count_gray[2], 16'b0});
			end
			32'h03_00_02_08 : // reg_phy2_tx_succ_count_gray
			begin
				iomem_ready <= 1;
				iomem_rdata <= endian_conv({phy_tx_succ_tx_count_gray[2], 16'b0});					
			end
			32'h03_00_02_0C : // reg_phy2_tx_fail_count_gray
			begin
				iomem_ready <= 1;
				iomem_rdata <= endian_conv({phy_tx_fail_tx_count_gray[2], 16'b0});					
			end						
			// PHY 3
			32'h03_00_03_00 : // reg_phy3_rx_succ_count_gray 
			begin
				iomem_ready <= 1;
				iomem_rdata <= endian_conv({phy_rx_succ_rx_count_gray[3], 16'b0});
			end
			32'h03_00_03_04 : // reg_phy3_rx_OF_count_gray
			begin
				iomem_ready <= 1;
				iomem_rdata <= endian_conv({phy_rx_buff_OF_count_gray[3], 16'b0});
			end
			32'h03_00_03_08 : // reg_phy3_tx_succ_count_gray
			begin
				iomem_ready <= 1;
				iomem_rdata <= endian_conv({phy_tx_succ_tx_count_gray[3], 16'b0});					
			end
			32'h03_00_03_0C : // reg_phy3_tx_fail_count_gray
			begin
				iomem_ready <= 1;
				iomem_rdata <= endian_conv({phy_tx_fail_tx_count_gray[3], 16'b0});					
			end						
			default: iomem_ready <= 0;									
		endcase
	end
end	
*/

/* reset system */
/* push USER PUSH BUTTON on the Tang PriMER to reset the circuit */
reg [5:0] soc_reset_cnt = 0;
wire soc_rst_n = &soc_reset_cnt;
wire soc_rst = ~soc_rst_n;  // Active-High;
always @(posedge soc_clk)
    if (~usr_btn)
        soc_reset_cnt <= 0;
    else
        soc_reset_cnt <= soc_reset_cnt + !soc_rst_n;

wire iomem_valid;
wire iomem_ready;
wire [ 3: 0] iomem_wstrb;
wire [31: 0] iomem_addr;
wire [31: 0] iomem_wdata;
wire [31: 0] iomem_rdata;

picosoc #(
            .BARREL_SHIFTER(1),
            .ENABLE_MUL(0),
            .ENABLE_DIV(0),
            .ENABLE_FAST_MUL(0),
            .ENABLE_REGS_DUALPORT(1),
            .TWO_CYCLE_ALU(0)
        ) soc (
            .clk          (soc_clk     ),
            .resetn       (soc_rst_n   ),

            .ser_tx       (soc_uart_tx ),
            .ser_rx       (soc_uart_rx ),

            .irq_5        (1'b0        ),
            .irq_6        (1'b0        ),
            .irq_7        (1'b0        ),

            .iomem_valid  (iomem_valid ),
            .iomem_ready  (iomem_ready ),
            .iomem_wstrb  (iomem_wstrb ),
            .iomem_addr   (iomem_addr  ),
            .iomem_wdata  (iomem_wdata ),
            .iomem_rdata  (iomem_rdata )
        );

output wire PHY_MDC;
inout wire PHY_MDIO;

MDIO mdio_impl (
         .clk(soc_clk),
         .arst_n(usr_btn),

         /* MDIO interface */
         .mdc(PHY_MDC),
         .mdio(PHY_MDIO),

         /* picosoc IO interface */
         .iomem_valid(iomem_valid),
         .iomem_ready(iomem_ready),
         .iomem_wstrb(iomem_wstrb),
         .iomem_addr(iomem_addr),
         .iomem_wdata(iomem_wdata),
         .iomem_rdata(iomem_rdata)
     );

endmodule
