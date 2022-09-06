// Verilog netlist created by TD v4.4.433
// Tue Aug  9 02:44:51 2022

`timescale 1ns / 1ps
module sram64k  // al_ip/sram64k.v(14)
  (
  addra,
  addrb,
  clka,
  clkb,
  dia,
  dib,
  rsta,
  rstb,
  wea,
  web,
  doa,
  dob
  );

  input [11:0] addra;  // al_ip/sram64k.v(25)
  input [11:0] addrb;  // al_ip/sram64k.v(26)
  input clka;  // al_ip/sram64k.v(29)
  input clkb;  // al_ip/sram64k.v(30)
  input [31:0] dia;  // al_ip/sram64k.v(23)
  input [31:0] dib;  // al_ip/sram64k.v(24)
  input rsta;  // al_ip/sram64k.v(31)
  input rstb;  // al_ip/sram64k.v(32)
  input [3:0] wea;  // al_ip/sram64k.v(27)
  input [3:0] web;  // al_ip/sram64k.v(28)
  output [31:0] doa;  // al_ip/sram64k.v(19)
  output [31:0] dob;  // al_ip/sram64k.v(20)


  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  // address_offset=0;data_offset=0;depth=4096;width=8;num_section=1;width_per_section=8;section_size=32;working_depth=4096;working_width=8;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM32K #(
    .CSAMUX("1"),
    .CSBMUX("1"),
    .DATA_WIDTH_A("8"),
    .DATA_WIDTH_B("8"),
    .MODE("DP16K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .SRMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_4096x32_sub_000000_000 (
    .addra(addra[11:1]),
    .addrb(addrb[11:1]),
    .bytea(addra[0]),
    .byteb(addrb[0]),
    .clka(clka),
    .clkb(clkb),
    .dia({open_n51,open_n52,open_n53,open_n54,open_n55,open_n56,open_n57,open_n58,dia[7:0]}),
    .dib({open_n59,open_n60,open_n61,open_n62,open_n63,open_n64,open_n65,open_n66,dib[7:0]}),
    .rsta(rsta),
    .rstb(rstb),
    .wea(wea[0]),
    .web(web[0]),
    .doa({open_n69,open_n70,open_n71,open_n72,open_n73,open_n74,open_n75,open_n76,doa[7:0]}),
    .dob({open_n77,open_n78,open_n79,open_n80,open_n81,open_n82,open_n83,open_n84,dob[7:0]}));
  // address_offset=0;data_offset=8;depth=4096;width=8;num_section=1;width_per_section=8;section_size=32;working_depth=4096;working_width=8;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM32K #(
    .CSAMUX("1"),
    .CSBMUX("1"),
    .DATA_WIDTH_A("8"),
    .DATA_WIDTH_B("8"),
    .MODE("DP16K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .SRMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_4096x32_sub_000000_008 (
    .addra(addra[11:1]),
    .addrb(addrb[11:1]),
    .bytea(addra[0]),
    .byteb(addrb[0]),
    .clka(clka),
    .clkb(clkb),
    .dia({open_n89,open_n90,open_n91,open_n92,open_n93,open_n94,open_n95,open_n96,dia[15:8]}),
    .dib({open_n97,open_n98,open_n99,open_n100,open_n101,open_n102,open_n103,open_n104,dib[15:8]}),
    .rsta(rsta),
    .rstb(rstb),
    .wea(wea[1]),
    .web(web[1]),
    .doa({open_n107,open_n108,open_n109,open_n110,open_n111,open_n112,open_n113,open_n114,doa[15:8]}),
    .dob({open_n115,open_n116,open_n117,open_n118,open_n119,open_n120,open_n121,open_n122,dob[15:8]}));
  // address_offset=0;data_offset=16;depth=4096;width=8;num_section=1;width_per_section=8;section_size=32;working_depth=4096;working_width=8;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM32K #(
    .CSAMUX("1"),
    .CSBMUX("1"),
    .DATA_WIDTH_A("8"),
    .DATA_WIDTH_B("8"),
    .MODE("DP16K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .SRMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_4096x32_sub_000000_016 (
    .addra(addra[11:1]),
    .addrb(addrb[11:1]),
    .bytea(addra[0]),
    .byteb(addrb[0]),
    .clka(clka),
    .clkb(clkb),
    .dia({open_n127,open_n128,open_n129,open_n130,open_n131,open_n132,open_n133,open_n134,dia[23:16]}),
    .dib({open_n135,open_n136,open_n137,open_n138,open_n139,open_n140,open_n141,open_n142,dib[23:16]}),
    .rsta(rsta),
    .rstb(rstb),
    .wea(wea[2]),
    .web(web[2]),
    .doa({open_n145,open_n146,open_n147,open_n148,open_n149,open_n150,open_n151,open_n152,doa[23:16]}),
    .dob({open_n153,open_n154,open_n155,open_n156,open_n157,open_n158,open_n159,open_n160,dob[23:16]}));
  // address_offset=0;data_offset=24;depth=4096;width=8;num_section=1;width_per_section=8;section_size=32;working_depth=4096;working_width=8;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM32K #(
    .CSAMUX("1"),
    .CSBMUX("1"),
    .DATA_WIDTH_A("8"),
    .DATA_WIDTH_B("8"),
    .MODE("DP16K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .SRMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_4096x32_sub_000000_024 (
    .addra(addra[11:1]),
    .addrb(addrb[11:1]),
    .bytea(addra[0]),
    .byteb(addrb[0]),
    .clka(clka),
    .clkb(clkb),
    .dia({open_n165,open_n166,open_n167,open_n168,open_n169,open_n170,open_n171,open_n172,dia[31:24]}),
    .dib({open_n173,open_n174,open_n175,open_n176,open_n177,open_n178,open_n179,open_n180,dib[31:24]}),
    .rsta(rsta),
    .rstb(rstb),
    .wea(wea[3]),
    .web(web[3]),
    .doa({open_n183,open_n184,open_n185,open_n186,open_n187,open_n188,open_n189,open_n190,doa[31:24]}),
    .dob({open_n191,open_n192,open_n193,open_n194,open_n195,open_n196,open_n197,open_n198,dob[31:24]}));

endmodule 

