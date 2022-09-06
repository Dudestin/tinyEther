// Verilog netlist created by TD v4.4.433
// Mon Jul 25 12:18:35 2022

`timescale 1ns / 1ps
module HEADER_FIFO  // al_ip/HEADER_FIFO.v(14)
  (
  clk,
  di,
  re,
  rst,
  we,
  do,
  empty_flag,
  full_flag
  );

  input clk;  // al_ip/HEADER_FIFO.v(24)
  input [114:0] di;  // al_ip/HEADER_FIFO.v(23)
  input re;  // al_ip/HEADER_FIFO.v(25)
  input rst;  // al_ip/HEADER_FIFO.v(22)
  input we;  // al_ip/HEADER_FIFO.v(24)
  output [114:0] do;  // al_ip/HEADER_FIFO.v(27)
  output empty_flag;  // al_ip/HEADER_FIFO.v(28)
  output full_flag;  // al_ip/HEADER_FIFO.v(29)

  wire empty_flag_neg;
  wire full_flag_neg;

  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  not empty_flag_inv (empty_flag_neg, empty_flag);
  not full_flag_inv (full_flag_neg, full_flag);
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000001100000),
    .AEP1(32'b00000000000000000000000001110000),
    .AF(32'b00000000000000000001111110100000),
    .AFM1(32'b00000000000000000001111110010000),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("18"),
    .DATA_WIDTH_B("18"),
    .E(32'b00000000000000000000000000000000),
    .EP1(32'b00000000000000000000000000010000),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111110000),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"))
    logic_fifo_0 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_neg}),
    .csw({2'b11,full_flag_neg}),
    .dia(di[8:0]),
    .dib(di[17:9]),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .doa(do[8:0]),
    .dob(do[17:9]),
    .empty_flag(empty_flag),
    .full_flag(full_flag));
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000001100000),
    .AEP1(32'b00000000000000000000000001110000),
    .AF(32'b00000000000000000001111110100000),
    .AFM1(32'b00000000000000000001111110010000),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("18"),
    .DATA_WIDTH_B("18"),
    .E(32'b00000000000000000000000000000000),
    .EP1(32'b00000000000000000000000000010000),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111110000),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"))
    logic_fifo_1 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_neg}),
    .csw({2'b11,full_flag_neg}),
    .dia(di[26:18]),
    .dib(di[35:27]),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .doa(do[26:18]),
    .dob(do[35:27]));
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000001100000),
    .AEP1(32'b00000000000000000000000001110000),
    .AF(32'b00000000000000000001111110100000),
    .AFM1(32'b00000000000000000001111110010000),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("18"),
    .DATA_WIDTH_B("18"),
    .E(32'b00000000000000000000000000000000),
    .EP1(32'b00000000000000000000000000010000),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111110000),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"))
    logic_fifo_2 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_neg}),
    .csw({2'b11,full_flag_neg}),
    .dia(di[44:36]),
    .dib(di[53:45]),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .doa(do[44:36]),
    .dob(do[53:45]));
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000001100000),
    .AEP1(32'b00000000000000000000000001110000),
    .AF(32'b00000000000000000001111110100000),
    .AFM1(32'b00000000000000000001111110010000),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("18"),
    .DATA_WIDTH_B("18"),
    .E(32'b00000000000000000000000000000000),
    .EP1(32'b00000000000000000000000000010000),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111110000),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"))
    logic_fifo_3 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_neg}),
    .csw({2'b11,full_flag_neg}),
    .dia(di[62:54]),
    .dib(di[71:63]),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .doa(do[62:54]),
    .dob(do[71:63]));
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000001100000),
    .AEP1(32'b00000000000000000000000001110000),
    .AF(32'b00000000000000000001111110100000),
    .AFM1(32'b00000000000000000001111110010000),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("18"),
    .DATA_WIDTH_B("18"),
    .E(32'b00000000000000000000000000000000),
    .EP1(32'b00000000000000000000000000010000),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111110000),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"))
    logic_fifo_4 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_neg}),
    .csw({2'b11,full_flag_neg}),
    .dia(di[80:72]),
    .dib(di[89:81]),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .doa(do[80:72]),
    .dob(do[89:81]));
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000001100000),
    .AEP1(32'b00000000000000000000000001110000),
    .AF(32'b00000000000000000001111110100000),
    .AFM1(32'b00000000000000000001111110010000),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("18"),
    .DATA_WIDTH_B("18"),
    .E(32'b00000000000000000000000000000000),
    .EP1(32'b00000000000000000000000000010000),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111110000),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"))
    logic_fifo_5 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_neg}),
    .csw({2'b11,full_flag_neg}),
    .dia(di[98:90]),
    .dib(di[107:99]),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .doa(do[98:90]),
    .dob(do[107:99]));
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000001100000),
    .AEP1(32'b00000000000000000000000001110000),
    .AF(32'b00000000000000000001111110100000),
    .AFM1(32'b00000000000000000001111110010000),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("18"),
    .DATA_WIDTH_B("18"),
    .E(32'b00000000000000000000000000000000),
    .EP1(32'b00000000000000000000000000010000),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111110000),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"))
    logic_fifo_6 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_neg}),
    .csw({2'b11,full_flag_neg}),
    .dia({open_n69,open_n70,di[114:108]}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .doa({open_n82,open_n83,do[114:108]}));

endmodule 

