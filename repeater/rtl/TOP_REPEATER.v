// PHY0 Loopback Test
// PHY0 RX -> PHY0 TX

module TOP_RMII_repeater(
           input  wire arst_n,
           output wire [2:0] RGB_LED,

           /* PHY0 */
           output wire PHY0_RST_N,
           output wire PHY0_TXEN,
           output wire PHY0_TXD0,
           output wire PHY0_TXD1,
           input  wire PHY0_CRS_DV,
           input  wire PHY0_RXD0,
           input  wire PHY0_RXD1,
           input  wire PHY0_REF_CLK,

           /* PHY1 */
           output wire PHY1_RST_N,
           output wire PHY1_TXEN,
           output wire PHY1_TXD0,
           output wire PHY1_TXD1,
           input  wire PHY1_CRS_DV,
           input  wire PHY1_RXD0,
           input  wire PHY1_RXD1,
           input  wire PHY1_REF_CLK,

           output wire PHY2_RST_N,
           output wire PHY3_RST_N
       );
/* indicater */
reg [24:0] counter;
always @(posedge PHY0_REF_CLK or negedge arst_n)
begin
    if (~arst_n)
        counter <= 25'b0;
    else
        counter <= counter + 1'b1;
end

reg phy0_crs_latch;
always @(posedge PHY0_CRS_DV)
begin
    phy0_crs_latch <= ~phy0_crs_latch;
end

assign RGB_LED[2] = phy0_crs_latch; // G
assign RGB_LED[1] = 1'b1; // B
assign RGB_LED[0] = counter[24]; // R

assign PHY0_RST_N = 1'b1;
assign PHY1_RST_N = 1'b1;
assign PHY2_RST_N = 1'b1;
assign PHY3_RST_N = 1'b1;

/* Loopback Assign, assume Full-Duplex Mode */
wire fifo_afull_0;
wire [7:0] fifo_din_0;
wire fifo_wren_0;
wire fifo_EOD_in_0;
RMII_RX phy0_rmii_rx (
            .arst_n(arst_n),
            .fifo_afull(fifo_afull_0), .fifo_din(fifo_din_0), .fifo_wren(fifo_wren_0),
            // Original FIFO Signal
            .fifo_EOD_in(fifo_EOD_in_0),
            // RMII signal
            .REF_CLK(PHY0_REF_CLK), .CRS_DV(PHY0_CRS_DV), .RXD0(PHY0_RXD0), .RXD1(PHY0_RXD1)
        );
wire fifo_empty_0;
wire fifo_aempty_0;
wire fifo_EOD_out_0;
wire [7:0] fifo_dout_0;
FRAME_FIFO #(
               .AEMPTY_CNT(60)
           ) frame_fifo_0 (
               .arst_n(arst_n),
               .di(fifo_din_0), .clkw(PHY0_REF_CLK), .we(fifo_wren_0),
               .do(fifo_dout_0), .clkr(PHY1_REF_CLK), .re(fifo_rden_0),
               .empty_flag(fifo_empty_0), .aempty_flag(fifo_aempty_0),
               .full_flag(), .afull_flag(fifo_afull_0),
               // my original signal
               // .half_flag(), // half of FIFO occupied, useful to implement smart schedular
               .EOD_in(fifo_EOD_in_0), .EOD_out(fifo_EOD_out_0)
           );

// PHY1 - RX
wire fifo_afull_1;
wire [7:0] fifo_din_1;
wire fifo_wren_1;
wire fifo_EOD_in_1;
wire [7:0] fifo_dout_1;
RMII_RX phy1_rmii_rx (
            .arst_n(arst_n),
            .fifo_afull(fifo_afull_1), .fifo_din(fifo_din_1), .fifo_wren(fifo_wren_1),
            // Original FIFO Signal
            .fifo_EOD_in(fifo_EOD_in_1),
            // RMII signal
            .REF_CLK(PHY1_REF_CLK), .CRS_DV(PHY1_CRS_DV), .RXD0(PHY1_RXD0), .RXD1(PHY1_RXD1)
        );
wire fifo_empty_1;
wire fifo_aempty_1;
wire fifo_EOD_out_1;
FRAME_FIFO #(
               .AEMPTY_CNT(60)
           ) frame_fifo_1 (
               .arst_n(arst_n),
               .di(fifo_din_1), .clkw(PHY1_REF_CLK), .we(fifo_wren_1),
               .do(fifo_dout_1), .clkr(PHY0_REF_CLK), .re(fifo_rden_1),
               .empty_flag(fifo_empty_1), .aempty_flag(fifo_aempty_1),
               .full_flag(), .afull_flag(fifo_afull_1),
               // my original signal
               // .half_flag(), // half of FIFO occupied, useful to implement smart schedular
               .EOD_in(fifo_EOD_in_1), .EOD_out(fifo_EOD_out_1)
           );

// PHY0 - TX
RMII_TX phy0_rmii_tx (
            .arst_n(arst_n),
            // FIFO signal
            .fifo_aempty(fifo_aempty_1), .fifo_dout(fifo_dout_1), .fifo_empty(fifo_empty_1), .fifo_rden(fifo_rden_1),
            // Original FIFO signal
            .fifo_EOD_out(fifo_EOD_out_1),
            // RMII signal
            .REF_CLK(PHY0_REF_CLK), .TXD0(PHY0_TXD0), .TXD1(PHY0_TXD1), .TX_EN(PHY0_TXEN), .CRS_DV(PHY0_CRS_DV),

            // config
            .duplex_mode(1'b1) // 1 means full-duplex, 0 means half-duplex
        );

// PHY1 - TX
RMII_TX phy1_rmii_tx (
            .arst_n(arst_n),
            // FIFO signal
            .fifo_aempty(fifo_aempty_0), .fifo_dout(fifo_dout_0), .fifo_empty(fifo_empty_0), .fifo_rden(fifo_rden_0),
            // Original FIFO signal
            .fifo_EOD_out(fifo_EOD_out_0),
            // RMII signal
            .REF_CLK(PHY1_REF_CLK), .TXD0(PHY1_TXD0), .TXD1(PHY1_TXD1), .TX_EN(PHY1_TXEN), .CRS_DV(PHY1_CRS_DV),

            // config
            .duplex_mode(1'b1) // 1 means full-duplex, 0 means half-duplex
        );

endmodule
