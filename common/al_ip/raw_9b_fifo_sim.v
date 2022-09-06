// Verilog netlist created by TD v4.6.14756
// Sat Aug 27 16:38:18 2022

`timescale 1ns / 1ps
module raw_9b_fifo  // ../common/al_ip/raw_9b_fifo.v(14)
  (
  clk,
  di,
  re,
  rst,
  we,
  aempty_flag,
  afull_flag,
  do,
  empty_flag,
  full_flag
  );

  input clk;  // ../common/al_ip/raw_9b_fifo.v(24)
  input [8:0] di;  // ../common/al_ip/raw_9b_fifo.v(23)
  input re;  // ../common/al_ip/raw_9b_fifo.v(25)
  input rst;  // ../common/al_ip/raw_9b_fifo.v(22)
  input we;  // ../common/al_ip/raw_9b_fifo.v(24)
  output aempty_flag;  // ../common/al_ip/raw_9b_fifo.v(28)
  output afull_flag;  // ../common/al_ip/raw_9b_fifo.v(29)
  output [8:0] do;  // ../common/al_ip/raw_9b_fifo.v(27)
  output empty_flag;  // ../common/al_ip/raw_9b_fifo.v(28)
  output full_flag;  // ../common/al_ip/raw_9b_fifo.v(29)

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
    .AE(32'b00000000000000000000000000011110),
    .AEP1(32'b00000000000000000000000000011111),
    .AF(32'b00000000000000000001100111001000),
    .AFM1(32'b00000000000000000001100111000111),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .E(32'b00000000000000000000000000000000),
    .EP1(32'b00000000000000000000000000000001),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111111111),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"))
    logic_fifo_0 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_neg}),
    .csw({2'b11,full_flag_neg}),
    .dia({open_n47,open_n48,open_n49,open_n50,open_n51,open_n52,open_n53,di[0],open_n54}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .aempty_flag(aempty_flag),
    .afull_flag(afull_flag),
    .dob({open_n73,open_n74,open_n75,open_n76,open_n77,open_n78,open_n79,open_n80,do[0]}),
    .empty_flag(empty_flag),
    .full_flag(full_flag));
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000000011110),
    .AEP1(32'b00000000000000000000000000011111),
    .AF(32'b00000000000000000001100111001000),
    .AFM1(32'b00000000000000000001100111000111),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .E(32'b00000000000000000000000000000000),
    .EP1(32'b00000000000000000000000000000001),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111111111),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"))
    logic_fifo_1 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_neg}),
    .csw({2'b11,full_flag_neg}),
    .dia({open_n81,open_n82,open_n83,open_n84,open_n85,open_n86,open_n87,di[1],open_n88}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n109,open_n110,open_n111,open_n112,open_n113,open_n114,open_n115,open_n116,do[1]}));
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000000011110),
    .AEP1(32'b00000000000000000000000000011111),
    .AF(32'b00000000000000000001100111001000),
    .AFM1(32'b00000000000000000001100111000111),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .E(32'b00000000000000000000000000000000),
    .EP1(32'b00000000000000000000000000000001),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111111111),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"))
    logic_fifo_2 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_neg}),
    .csw({2'b11,full_flag_neg}),
    .dia({open_n119,open_n120,open_n121,open_n122,open_n123,open_n124,open_n125,di[2],open_n126}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n147,open_n148,open_n149,open_n150,open_n151,open_n152,open_n153,open_n154,do[2]}));
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000000011110),
    .AEP1(32'b00000000000000000000000000011111),
    .AF(32'b00000000000000000001100111001000),
    .AFM1(32'b00000000000000000001100111000111),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .E(32'b00000000000000000000000000000000),
    .EP1(32'b00000000000000000000000000000001),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111111111),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"))
    logic_fifo_3 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_neg}),
    .csw({2'b11,full_flag_neg}),
    .dia({open_n157,open_n158,open_n159,open_n160,open_n161,open_n162,open_n163,di[3],open_n164}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n185,open_n186,open_n187,open_n188,open_n189,open_n190,open_n191,open_n192,do[3]}));
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000000011110),
    .AEP1(32'b00000000000000000000000000011111),
    .AF(32'b00000000000000000001100111001000),
    .AFM1(32'b00000000000000000001100111000111),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .E(32'b00000000000000000000000000000000),
    .EP1(32'b00000000000000000000000000000001),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111111111),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"))
    logic_fifo_4 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_neg}),
    .csw({2'b11,full_flag_neg}),
    .dia({open_n195,open_n196,open_n197,open_n198,open_n199,open_n200,open_n201,di[4],open_n202}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n223,open_n224,open_n225,open_n226,open_n227,open_n228,open_n229,open_n230,do[4]}));
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000000011110),
    .AEP1(32'b00000000000000000000000000011111),
    .AF(32'b00000000000000000001100111001000),
    .AFM1(32'b00000000000000000001100111000111),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .E(32'b00000000000000000000000000000000),
    .EP1(32'b00000000000000000000000000000001),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111111111),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"))
    logic_fifo_5 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_neg}),
    .csw({2'b11,full_flag_neg}),
    .dia({open_n233,open_n234,open_n235,open_n236,open_n237,open_n238,open_n239,di[5],open_n240}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n261,open_n262,open_n263,open_n264,open_n265,open_n266,open_n267,open_n268,do[5]}));
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000000011110),
    .AEP1(32'b00000000000000000000000000011111),
    .AF(32'b00000000000000000001100111001000),
    .AFM1(32'b00000000000000000001100111000111),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .E(32'b00000000000000000000000000000000),
    .EP1(32'b00000000000000000000000000000001),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111111111),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"))
    logic_fifo_6 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_neg}),
    .csw({2'b11,full_flag_neg}),
    .dia({open_n271,open_n272,open_n273,open_n274,open_n275,open_n276,open_n277,di[6],open_n278}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n299,open_n300,open_n301,open_n302,open_n303,open_n304,open_n305,open_n306,do[6]}));
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000000011110),
    .AEP1(32'b00000000000000000000000000011111),
    .AF(32'b00000000000000000001100111001000),
    .AFM1(32'b00000000000000000001100111000111),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .E(32'b00000000000000000000000000000000),
    .EP1(32'b00000000000000000000000000000001),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111111111),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"))
    logic_fifo_7 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_neg}),
    .csw({2'b11,full_flag_neg}),
    .dia({open_n309,open_n310,open_n311,open_n312,open_n313,open_n314,open_n315,di[7],open_n316}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n337,open_n338,open_n339,open_n340,open_n341,open_n342,open_n343,open_n344,do[7]}));
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000000011110),
    .AEP1(32'b00000000000000000000000000011111),
    .AF(32'b00000000000000000001100111001000),
    .AFM1(32'b00000000000000000001100111000111),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .E(32'b00000000000000000000000000000000),
    .EP1(32'b00000000000000000000000000000001),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111111111),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"))
    logic_fifo_8 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_neg}),
    .csw({2'b11,full_flag_neg}),
    .dia({open_n347,open_n348,open_n349,open_n350,open_n351,open_n352,open_n353,di[8],open_n354}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n375,open_n376,open_n377,open_n378,open_n379,open_n380,open_n381,open_n382,do[8]}));

endmodule 

