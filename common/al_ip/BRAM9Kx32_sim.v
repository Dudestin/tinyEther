// Verilog netlist created by TD v4.4.433
// Sat Aug 13 08:23:07 2022

`timescale 1ns / 1ps
module BRAM9Kx32  // al_ip/BRAM9Kx32.v(14)
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

  input [13:0] addra;  // al_ip/BRAM9Kx32.v(25)
  input [13:0] addrb;  // al_ip/BRAM9Kx32.v(26)
  input clka;  // al_ip/BRAM9Kx32.v(29)
  input clkb;  // al_ip/BRAM9Kx32.v(30)
  input [8:0] dia;  // al_ip/BRAM9Kx32.v(23)
  input [8:0] dib;  // al_ip/BRAM9Kx32.v(24)
  input rsta;  // al_ip/BRAM9Kx32.v(31)
  input rstb;  // al_ip/BRAM9Kx32.v(32)
  input wea;  // al_ip/BRAM9Kx32.v(27)
  input web;  // al_ip/BRAM9Kx32.v(28)
  output [8:0] doa;  // al_ip/BRAM9Kx32.v(19)
  output [8:0] dob;  // al_ip/BRAM9Kx32.v(20)

  wire [0:3] addra_piped;
  wire [0:3] addrb_piped;
  wire  \inst_doa_mux_b0/B0_0 ;
  wire  \inst_doa_mux_b0/B0_1 ;
  wire  \inst_doa_mux_b0/B0_2 ;
  wire  \inst_doa_mux_b0/B0_3 ;
  wire  \inst_doa_mux_b0/B0_4 ;
  wire  \inst_doa_mux_b0/B0_5 ;
  wire  \inst_doa_mux_b0/B0_6 ;
  wire  \inst_doa_mux_b0/B0_7 ;
  wire  \inst_doa_mux_b0/B1_0 ;
  wire  \inst_doa_mux_b0/B1_1 ;
  wire  \inst_doa_mux_b0/B1_2 ;
  wire  \inst_doa_mux_b0/B1_3 ;
  wire  \inst_doa_mux_b0/B2_0 ;
  wire  \inst_doa_mux_b0/B2_1 ;
  wire  \inst_doa_mux_b1/B0_0 ;
  wire  \inst_doa_mux_b1/B0_1 ;
  wire  \inst_doa_mux_b1/B0_2 ;
  wire  \inst_doa_mux_b1/B0_3 ;
  wire  \inst_doa_mux_b1/B0_4 ;
  wire  \inst_doa_mux_b1/B0_5 ;
  wire  \inst_doa_mux_b1/B0_6 ;
  wire  \inst_doa_mux_b1/B0_7 ;
  wire  \inst_doa_mux_b1/B1_0 ;
  wire  \inst_doa_mux_b1/B1_1 ;
  wire  \inst_doa_mux_b1/B1_2 ;
  wire  \inst_doa_mux_b1/B1_3 ;
  wire  \inst_doa_mux_b1/B2_0 ;
  wire  \inst_doa_mux_b1/B2_1 ;
  wire  \inst_doa_mux_b2/B0_0 ;
  wire  \inst_doa_mux_b2/B0_1 ;
  wire  \inst_doa_mux_b2/B0_2 ;
  wire  \inst_doa_mux_b2/B0_3 ;
  wire  \inst_doa_mux_b2/B0_4 ;
  wire  \inst_doa_mux_b2/B0_5 ;
  wire  \inst_doa_mux_b2/B0_6 ;
  wire  \inst_doa_mux_b2/B0_7 ;
  wire  \inst_doa_mux_b2/B1_0 ;
  wire  \inst_doa_mux_b2/B1_1 ;
  wire  \inst_doa_mux_b2/B1_2 ;
  wire  \inst_doa_mux_b2/B1_3 ;
  wire  \inst_doa_mux_b2/B2_0 ;
  wire  \inst_doa_mux_b2/B2_1 ;
  wire  \inst_doa_mux_b3/B0_0 ;
  wire  \inst_doa_mux_b3/B0_1 ;
  wire  \inst_doa_mux_b3/B0_2 ;
  wire  \inst_doa_mux_b3/B0_3 ;
  wire  \inst_doa_mux_b3/B0_4 ;
  wire  \inst_doa_mux_b3/B0_5 ;
  wire  \inst_doa_mux_b3/B0_6 ;
  wire  \inst_doa_mux_b3/B0_7 ;
  wire  \inst_doa_mux_b3/B1_0 ;
  wire  \inst_doa_mux_b3/B1_1 ;
  wire  \inst_doa_mux_b3/B1_2 ;
  wire  \inst_doa_mux_b3/B1_3 ;
  wire  \inst_doa_mux_b3/B2_0 ;
  wire  \inst_doa_mux_b3/B2_1 ;
  wire  \inst_doa_mux_b4/B0_0 ;
  wire  \inst_doa_mux_b4/B0_1 ;
  wire  \inst_doa_mux_b4/B0_2 ;
  wire  \inst_doa_mux_b4/B0_3 ;
  wire  \inst_doa_mux_b4/B0_4 ;
  wire  \inst_doa_mux_b4/B0_5 ;
  wire  \inst_doa_mux_b4/B0_6 ;
  wire  \inst_doa_mux_b4/B0_7 ;
  wire  \inst_doa_mux_b4/B1_0 ;
  wire  \inst_doa_mux_b4/B1_1 ;
  wire  \inst_doa_mux_b4/B1_2 ;
  wire  \inst_doa_mux_b4/B1_3 ;
  wire  \inst_doa_mux_b4/B2_0 ;
  wire  \inst_doa_mux_b4/B2_1 ;
  wire  \inst_doa_mux_b5/B0_0 ;
  wire  \inst_doa_mux_b5/B0_1 ;
  wire  \inst_doa_mux_b5/B0_2 ;
  wire  \inst_doa_mux_b5/B0_3 ;
  wire  \inst_doa_mux_b5/B0_4 ;
  wire  \inst_doa_mux_b5/B0_5 ;
  wire  \inst_doa_mux_b5/B0_6 ;
  wire  \inst_doa_mux_b5/B0_7 ;
  wire  \inst_doa_mux_b5/B1_0 ;
  wire  \inst_doa_mux_b5/B1_1 ;
  wire  \inst_doa_mux_b5/B1_2 ;
  wire  \inst_doa_mux_b5/B1_3 ;
  wire  \inst_doa_mux_b5/B2_0 ;
  wire  \inst_doa_mux_b5/B2_1 ;
  wire  \inst_doa_mux_b6/B0_0 ;
  wire  \inst_doa_mux_b6/B0_1 ;
  wire  \inst_doa_mux_b6/B0_2 ;
  wire  \inst_doa_mux_b6/B0_3 ;
  wire  \inst_doa_mux_b6/B0_4 ;
  wire  \inst_doa_mux_b6/B0_5 ;
  wire  \inst_doa_mux_b6/B0_6 ;
  wire  \inst_doa_mux_b6/B0_7 ;
  wire  \inst_doa_mux_b6/B1_0 ;
  wire  \inst_doa_mux_b6/B1_1 ;
  wire  \inst_doa_mux_b6/B1_2 ;
  wire  \inst_doa_mux_b6/B1_3 ;
  wire  \inst_doa_mux_b6/B2_0 ;
  wire  \inst_doa_mux_b6/B2_1 ;
  wire  \inst_doa_mux_b7/B0_0 ;
  wire  \inst_doa_mux_b7/B0_1 ;
  wire  \inst_doa_mux_b7/B0_2 ;
  wire  \inst_doa_mux_b7/B0_3 ;
  wire  \inst_doa_mux_b7/B0_4 ;
  wire  \inst_doa_mux_b7/B0_5 ;
  wire  \inst_doa_mux_b7/B0_6 ;
  wire  \inst_doa_mux_b7/B0_7 ;
  wire  \inst_doa_mux_b7/B1_0 ;
  wire  \inst_doa_mux_b7/B1_1 ;
  wire  \inst_doa_mux_b7/B1_2 ;
  wire  \inst_doa_mux_b7/B1_3 ;
  wire  \inst_doa_mux_b7/B2_0 ;
  wire  \inst_doa_mux_b7/B2_1 ;
  wire  \inst_doa_mux_b8/B0_0 ;
  wire  \inst_doa_mux_b8/B0_1 ;
  wire  \inst_doa_mux_b8/B0_2 ;
  wire  \inst_doa_mux_b8/B0_3 ;
  wire  \inst_doa_mux_b8/B0_4 ;
  wire  \inst_doa_mux_b8/B0_5 ;
  wire  \inst_doa_mux_b8/B0_6 ;
  wire  \inst_doa_mux_b8/B0_7 ;
  wire  \inst_doa_mux_b8/B1_0 ;
  wire  \inst_doa_mux_b8/B1_1 ;
  wire  \inst_doa_mux_b8/B1_2 ;
  wire  \inst_doa_mux_b8/B1_3 ;
  wire  \inst_doa_mux_b8/B2_0 ;
  wire  \inst_doa_mux_b8/B2_1 ;
  wire  \inst_dob_mux_b0/B0_0 ;
  wire  \inst_dob_mux_b0/B0_1 ;
  wire  \inst_dob_mux_b0/B0_2 ;
  wire  \inst_dob_mux_b0/B0_3 ;
  wire  \inst_dob_mux_b0/B0_4 ;
  wire  \inst_dob_mux_b0/B0_5 ;
  wire  \inst_dob_mux_b0/B0_6 ;
  wire  \inst_dob_mux_b0/B0_7 ;
  wire  \inst_dob_mux_b0/B1_0 ;
  wire  \inst_dob_mux_b0/B1_1 ;
  wire  \inst_dob_mux_b0/B1_2 ;
  wire  \inst_dob_mux_b0/B1_3 ;
  wire  \inst_dob_mux_b0/B2_0 ;
  wire  \inst_dob_mux_b0/B2_1 ;
  wire  \inst_dob_mux_b1/B0_0 ;
  wire  \inst_dob_mux_b1/B0_1 ;
  wire  \inst_dob_mux_b1/B0_2 ;
  wire  \inst_dob_mux_b1/B0_3 ;
  wire  \inst_dob_mux_b1/B0_4 ;
  wire  \inst_dob_mux_b1/B0_5 ;
  wire  \inst_dob_mux_b1/B0_6 ;
  wire  \inst_dob_mux_b1/B0_7 ;
  wire  \inst_dob_mux_b1/B1_0 ;
  wire  \inst_dob_mux_b1/B1_1 ;
  wire  \inst_dob_mux_b1/B1_2 ;
  wire  \inst_dob_mux_b1/B1_3 ;
  wire  \inst_dob_mux_b1/B2_0 ;
  wire  \inst_dob_mux_b1/B2_1 ;
  wire  \inst_dob_mux_b2/B0_0 ;
  wire  \inst_dob_mux_b2/B0_1 ;
  wire  \inst_dob_mux_b2/B0_2 ;
  wire  \inst_dob_mux_b2/B0_3 ;
  wire  \inst_dob_mux_b2/B0_4 ;
  wire  \inst_dob_mux_b2/B0_5 ;
  wire  \inst_dob_mux_b2/B0_6 ;
  wire  \inst_dob_mux_b2/B0_7 ;
  wire  \inst_dob_mux_b2/B1_0 ;
  wire  \inst_dob_mux_b2/B1_1 ;
  wire  \inst_dob_mux_b2/B1_2 ;
  wire  \inst_dob_mux_b2/B1_3 ;
  wire  \inst_dob_mux_b2/B2_0 ;
  wire  \inst_dob_mux_b2/B2_1 ;
  wire  \inst_dob_mux_b3/B0_0 ;
  wire  \inst_dob_mux_b3/B0_1 ;
  wire  \inst_dob_mux_b3/B0_2 ;
  wire  \inst_dob_mux_b3/B0_3 ;
  wire  \inst_dob_mux_b3/B0_4 ;
  wire  \inst_dob_mux_b3/B0_5 ;
  wire  \inst_dob_mux_b3/B0_6 ;
  wire  \inst_dob_mux_b3/B0_7 ;
  wire  \inst_dob_mux_b3/B1_0 ;
  wire  \inst_dob_mux_b3/B1_1 ;
  wire  \inst_dob_mux_b3/B1_2 ;
  wire  \inst_dob_mux_b3/B1_3 ;
  wire  \inst_dob_mux_b3/B2_0 ;
  wire  \inst_dob_mux_b3/B2_1 ;
  wire  \inst_dob_mux_b4/B0_0 ;
  wire  \inst_dob_mux_b4/B0_1 ;
  wire  \inst_dob_mux_b4/B0_2 ;
  wire  \inst_dob_mux_b4/B0_3 ;
  wire  \inst_dob_mux_b4/B0_4 ;
  wire  \inst_dob_mux_b4/B0_5 ;
  wire  \inst_dob_mux_b4/B0_6 ;
  wire  \inst_dob_mux_b4/B0_7 ;
  wire  \inst_dob_mux_b4/B1_0 ;
  wire  \inst_dob_mux_b4/B1_1 ;
  wire  \inst_dob_mux_b4/B1_2 ;
  wire  \inst_dob_mux_b4/B1_3 ;
  wire  \inst_dob_mux_b4/B2_0 ;
  wire  \inst_dob_mux_b4/B2_1 ;
  wire  \inst_dob_mux_b5/B0_0 ;
  wire  \inst_dob_mux_b5/B0_1 ;
  wire  \inst_dob_mux_b5/B0_2 ;
  wire  \inst_dob_mux_b5/B0_3 ;
  wire  \inst_dob_mux_b5/B0_4 ;
  wire  \inst_dob_mux_b5/B0_5 ;
  wire  \inst_dob_mux_b5/B0_6 ;
  wire  \inst_dob_mux_b5/B0_7 ;
  wire  \inst_dob_mux_b5/B1_0 ;
  wire  \inst_dob_mux_b5/B1_1 ;
  wire  \inst_dob_mux_b5/B1_2 ;
  wire  \inst_dob_mux_b5/B1_3 ;
  wire  \inst_dob_mux_b5/B2_0 ;
  wire  \inst_dob_mux_b5/B2_1 ;
  wire  \inst_dob_mux_b6/B0_0 ;
  wire  \inst_dob_mux_b6/B0_1 ;
  wire  \inst_dob_mux_b6/B0_2 ;
  wire  \inst_dob_mux_b6/B0_3 ;
  wire  \inst_dob_mux_b6/B0_4 ;
  wire  \inst_dob_mux_b6/B0_5 ;
  wire  \inst_dob_mux_b6/B0_6 ;
  wire  \inst_dob_mux_b6/B0_7 ;
  wire  \inst_dob_mux_b6/B1_0 ;
  wire  \inst_dob_mux_b6/B1_1 ;
  wire  \inst_dob_mux_b6/B1_2 ;
  wire  \inst_dob_mux_b6/B1_3 ;
  wire  \inst_dob_mux_b6/B2_0 ;
  wire  \inst_dob_mux_b6/B2_1 ;
  wire  \inst_dob_mux_b7/B0_0 ;
  wire  \inst_dob_mux_b7/B0_1 ;
  wire  \inst_dob_mux_b7/B0_2 ;
  wire  \inst_dob_mux_b7/B0_3 ;
  wire  \inst_dob_mux_b7/B0_4 ;
  wire  \inst_dob_mux_b7/B0_5 ;
  wire  \inst_dob_mux_b7/B0_6 ;
  wire  \inst_dob_mux_b7/B0_7 ;
  wire  \inst_dob_mux_b7/B1_0 ;
  wire  \inst_dob_mux_b7/B1_1 ;
  wire  \inst_dob_mux_b7/B1_2 ;
  wire  \inst_dob_mux_b7/B1_3 ;
  wire  \inst_dob_mux_b7/B2_0 ;
  wire  \inst_dob_mux_b7/B2_1 ;
  wire  \inst_dob_mux_b8/B0_0 ;
  wire  \inst_dob_mux_b8/B0_1 ;
  wire  \inst_dob_mux_b8/B0_2 ;
  wire  \inst_dob_mux_b8/B0_3 ;
  wire  \inst_dob_mux_b8/B0_4 ;
  wire  \inst_dob_mux_b8/B0_5 ;
  wire  \inst_dob_mux_b8/B0_6 ;
  wire  \inst_dob_mux_b8/B0_7 ;
  wire  \inst_dob_mux_b8/B1_0 ;
  wire  \inst_dob_mux_b8/B1_1 ;
  wire  \inst_dob_mux_b8/B1_2 ;
  wire  \inst_dob_mux_b8/B1_3 ;
  wire  \inst_dob_mux_b8/B2_0 ;
  wire  \inst_dob_mux_b8/B2_1 ;
  wire \and_Naddra[12]_Naddr_o ;
  wire \and_Naddra[12]_addra_o ;
  wire \and_Naddrb[12]_Naddr_o ;
  wire \and_Naddrb[12]_addrb_o ;
  wire \and_addra[12]_Naddra_o ;
  wire \and_addra[12]_addra[_o ;
  wire \and_addrb[12]_Naddrb_o ;
  wire \and_addrb[12]_addrb[_o ;
  wire inst_doa_i0_000;
  wire inst_doa_i0_001;
  wire inst_doa_i0_002;
  wire inst_doa_i0_003;
  wire inst_doa_i0_004;
  wire inst_doa_i0_005;
  wire inst_doa_i0_006;
  wire inst_doa_i0_007;
  wire inst_doa_i0_008;
  wire inst_doa_i10_000;
  wire inst_doa_i10_001;
  wire inst_doa_i10_002;
  wire inst_doa_i10_003;
  wire inst_doa_i10_004;
  wire inst_doa_i10_005;
  wire inst_doa_i10_006;
  wire inst_doa_i10_007;
  wire inst_doa_i10_008;
  wire inst_doa_i11_000;
  wire inst_doa_i11_001;
  wire inst_doa_i11_002;
  wire inst_doa_i11_003;
  wire inst_doa_i11_004;
  wire inst_doa_i11_005;
  wire inst_doa_i11_006;
  wire inst_doa_i11_007;
  wire inst_doa_i11_008;
  wire inst_doa_i12_000;
  wire inst_doa_i12_001;
  wire inst_doa_i12_002;
  wire inst_doa_i12_003;
  wire inst_doa_i12_004;
  wire inst_doa_i12_005;
  wire inst_doa_i12_006;
  wire inst_doa_i12_007;
  wire inst_doa_i12_008;
  wire inst_doa_i13_000;
  wire inst_doa_i13_001;
  wire inst_doa_i13_002;
  wire inst_doa_i13_003;
  wire inst_doa_i13_004;
  wire inst_doa_i13_005;
  wire inst_doa_i13_006;
  wire inst_doa_i13_007;
  wire inst_doa_i13_008;
  wire inst_doa_i14_000;
  wire inst_doa_i14_001;
  wire inst_doa_i14_002;
  wire inst_doa_i14_003;
  wire inst_doa_i14_004;
  wire inst_doa_i14_005;
  wire inst_doa_i14_006;
  wire inst_doa_i14_007;
  wire inst_doa_i14_008;
  wire inst_doa_i15_000;
  wire inst_doa_i15_001;
  wire inst_doa_i15_002;
  wire inst_doa_i15_003;
  wire inst_doa_i15_004;
  wire inst_doa_i15_005;
  wire inst_doa_i15_006;
  wire inst_doa_i15_007;
  wire inst_doa_i15_008;
  wire inst_doa_i1_000;
  wire inst_doa_i1_001;
  wire inst_doa_i1_002;
  wire inst_doa_i1_003;
  wire inst_doa_i1_004;
  wire inst_doa_i1_005;
  wire inst_doa_i1_006;
  wire inst_doa_i1_007;
  wire inst_doa_i1_008;
  wire inst_doa_i2_000;
  wire inst_doa_i2_001;
  wire inst_doa_i2_002;
  wire inst_doa_i2_003;
  wire inst_doa_i2_004;
  wire inst_doa_i2_005;
  wire inst_doa_i2_006;
  wire inst_doa_i2_007;
  wire inst_doa_i2_008;
  wire inst_doa_i3_000;
  wire inst_doa_i3_001;
  wire inst_doa_i3_002;
  wire inst_doa_i3_003;
  wire inst_doa_i3_004;
  wire inst_doa_i3_005;
  wire inst_doa_i3_006;
  wire inst_doa_i3_007;
  wire inst_doa_i3_008;
  wire inst_doa_i4_000;
  wire inst_doa_i4_001;
  wire inst_doa_i4_002;
  wire inst_doa_i4_003;
  wire inst_doa_i4_004;
  wire inst_doa_i4_005;
  wire inst_doa_i4_006;
  wire inst_doa_i4_007;
  wire inst_doa_i4_008;
  wire inst_doa_i5_000;
  wire inst_doa_i5_001;
  wire inst_doa_i5_002;
  wire inst_doa_i5_003;
  wire inst_doa_i5_004;
  wire inst_doa_i5_005;
  wire inst_doa_i5_006;
  wire inst_doa_i5_007;
  wire inst_doa_i5_008;
  wire inst_doa_i6_000;
  wire inst_doa_i6_001;
  wire inst_doa_i6_002;
  wire inst_doa_i6_003;
  wire inst_doa_i6_004;
  wire inst_doa_i6_005;
  wire inst_doa_i6_006;
  wire inst_doa_i6_007;
  wire inst_doa_i6_008;
  wire inst_doa_i7_000;
  wire inst_doa_i7_001;
  wire inst_doa_i7_002;
  wire inst_doa_i7_003;
  wire inst_doa_i7_004;
  wire inst_doa_i7_005;
  wire inst_doa_i7_006;
  wire inst_doa_i7_007;
  wire inst_doa_i7_008;
  wire inst_doa_i8_000;
  wire inst_doa_i8_001;
  wire inst_doa_i8_002;
  wire inst_doa_i8_003;
  wire inst_doa_i8_004;
  wire inst_doa_i8_005;
  wire inst_doa_i8_006;
  wire inst_doa_i8_007;
  wire inst_doa_i8_008;
  wire inst_doa_i9_000;
  wire inst_doa_i9_001;
  wire inst_doa_i9_002;
  wire inst_doa_i9_003;
  wire inst_doa_i9_004;
  wire inst_doa_i9_005;
  wire inst_doa_i9_006;
  wire inst_doa_i9_007;
  wire inst_doa_i9_008;
  wire inst_dob_i0_000;
  wire inst_dob_i0_001;
  wire inst_dob_i0_002;
  wire inst_dob_i0_003;
  wire inst_dob_i0_004;
  wire inst_dob_i0_005;
  wire inst_dob_i0_006;
  wire inst_dob_i0_007;
  wire inst_dob_i0_008;
  wire inst_dob_i10_000;
  wire inst_dob_i10_001;
  wire inst_dob_i10_002;
  wire inst_dob_i10_003;
  wire inst_dob_i10_004;
  wire inst_dob_i10_005;
  wire inst_dob_i10_006;
  wire inst_dob_i10_007;
  wire inst_dob_i10_008;
  wire inst_dob_i11_000;
  wire inst_dob_i11_001;
  wire inst_dob_i11_002;
  wire inst_dob_i11_003;
  wire inst_dob_i11_004;
  wire inst_dob_i11_005;
  wire inst_dob_i11_006;
  wire inst_dob_i11_007;
  wire inst_dob_i11_008;
  wire inst_dob_i12_000;
  wire inst_dob_i12_001;
  wire inst_dob_i12_002;
  wire inst_dob_i12_003;
  wire inst_dob_i12_004;
  wire inst_dob_i12_005;
  wire inst_dob_i12_006;
  wire inst_dob_i12_007;
  wire inst_dob_i12_008;
  wire inst_dob_i13_000;
  wire inst_dob_i13_001;
  wire inst_dob_i13_002;
  wire inst_dob_i13_003;
  wire inst_dob_i13_004;
  wire inst_dob_i13_005;
  wire inst_dob_i13_006;
  wire inst_dob_i13_007;
  wire inst_dob_i13_008;
  wire inst_dob_i14_000;
  wire inst_dob_i14_001;
  wire inst_dob_i14_002;
  wire inst_dob_i14_003;
  wire inst_dob_i14_004;
  wire inst_dob_i14_005;
  wire inst_dob_i14_006;
  wire inst_dob_i14_007;
  wire inst_dob_i14_008;
  wire inst_dob_i15_000;
  wire inst_dob_i15_001;
  wire inst_dob_i15_002;
  wire inst_dob_i15_003;
  wire inst_dob_i15_004;
  wire inst_dob_i15_005;
  wire inst_dob_i15_006;
  wire inst_dob_i15_007;
  wire inst_dob_i15_008;
  wire inst_dob_i1_000;
  wire inst_dob_i1_001;
  wire inst_dob_i1_002;
  wire inst_dob_i1_003;
  wire inst_dob_i1_004;
  wire inst_dob_i1_005;
  wire inst_dob_i1_006;
  wire inst_dob_i1_007;
  wire inst_dob_i1_008;
  wire inst_dob_i2_000;
  wire inst_dob_i2_001;
  wire inst_dob_i2_002;
  wire inst_dob_i2_003;
  wire inst_dob_i2_004;
  wire inst_dob_i2_005;
  wire inst_dob_i2_006;
  wire inst_dob_i2_007;
  wire inst_dob_i2_008;
  wire inst_dob_i3_000;
  wire inst_dob_i3_001;
  wire inst_dob_i3_002;
  wire inst_dob_i3_003;
  wire inst_dob_i3_004;
  wire inst_dob_i3_005;
  wire inst_dob_i3_006;
  wire inst_dob_i3_007;
  wire inst_dob_i3_008;
  wire inst_dob_i4_000;
  wire inst_dob_i4_001;
  wire inst_dob_i4_002;
  wire inst_dob_i4_003;
  wire inst_dob_i4_004;
  wire inst_dob_i4_005;
  wire inst_dob_i4_006;
  wire inst_dob_i4_007;
  wire inst_dob_i4_008;
  wire inst_dob_i5_000;
  wire inst_dob_i5_001;
  wire inst_dob_i5_002;
  wire inst_dob_i5_003;
  wire inst_dob_i5_004;
  wire inst_dob_i5_005;
  wire inst_dob_i5_006;
  wire inst_dob_i5_007;
  wire inst_dob_i5_008;
  wire inst_dob_i6_000;
  wire inst_dob_i6_001;
  wire inst_dob_i6_002;
  wire inst_dob_i6_003;
  wire inst_dob_i6_004;
  wire inst_dob_i6_005;
  wire inst_dob_i6_006;
  wire inst_dob_i6_007;
  wire inst_dob_i6_008;
  wire inst_dob_i7_000;
  wire inst_dob_i7_001;
  wire inst_dob_i7_002;
  wire inst_dob_i7_003;
  wire inst_dob_i7_004;
  wire inst_dob_i7_005;
  wire inst_dob_i7_006;
  wire inst_dob_i7_007;
  wire inst_dob_i7_008;
  wire inst_dob_i8_000;
  wire inst_dob_i8_001;
  wire inst_dob_i8_002;
  wire inst_dob_i8_003;
  wire inst_dob_i8_004;
  wire inst_dob_i8_005;
  wire inst_dob_i8_006;
  wire inst_dob_i8_007;
  wire inst_dob_i8_008;
  wire inst_dob_i9_000;
  wire inst_dob_i9_001;
  wire inst_dob_i9_002;
  wire inst_dob_i9_003;
  wire inst_dob_i9_004;
  wire inst_dob_i9_005;
  wire inst_dob_i9_006;
  wire inst_dob_i9_007;
  wire inst_dob_i9_008;
  wire wea_neg;
  wire web_neg;

  reg_sr_as_w1 addra_pipe_b0 (
    .clk(clka),
    .d(addra[10]),
    .en(wea_neg),
    .reset(rsta),
    .set(1'b0),
    .q(addra_piped[0]));
  reg_sr_as_w1 addra_pipe_b1 (
    .clk(clka),
    .d(addra[11]),
    .en(wea_neg),
    .reset(rsta),
    .set(1'b0),
    .q(addra_piped[1]));
  reg_sr_as_w1 addra_pipe_b2 (
    .clk(clka),
    .d(addra[12]),
    .en(wea_neg),
    .reset(rsta),
    .set(1'b0),
    .q(addra_piped[2]));
  reg_sr_as_w1 addra_pipe_b3 (
    .clk(clka),
    .d(addra[13]),
    .en(wea_neg),
    .reset(rsta),
    .set(1'b0),
    .q(addra_piped[3]));
  reg_sr_as_w1 addrb_pipe_b0 (
    .clk(clkb),
    .d(addrb[10]),
    .en(web_neg),
    .reset(rstb),
    .set(1'b0),
    .q(addrb_piped[0]));
  reg_sr_as_w1 addrb_pipe_b1 (
    .clk(clkb),
    .d(addrb[11]),
    .en(web_neg),
    .reset(rstb),
    .set(1'b0),
    .q(addrb_piped[1]));
  reg_sr_as_w1 addrb_pipe_b2 (
    .clk(clkb),
    .d(addrb[12]),
    .en(web_neg),
    .reset(rstb),
    .set(1'b0),
    .q(addrb_piped[2]));
  reg_sr_as_w1 addrb_pipe_b3 (
    .clk(clkb),
    .d(addrb[13]),
    .en(web_neg),
    .reset(rstb),
    .set(1'b0),
    .q(addrb_piped[3]));
  and \and_Naddra[12]_Naddr  (\and_Naddra[12]_Naddr_o , ~addra[12], ~addra[13]);
  and \and_Naddra[12]_addra  (\and_Naddra[12]_addra_o , ~addra[12], addra[13]);
  and \and_Naddrb[12]_Naddr  (\and_Naddrb[12]_Naddr_o , ~addrb[12], ~addrb[13]);
  and \and_Naddrb[12]_addrb  (\and_Naddrb[12]_addrb_o , ~addrb[12], addrb[13]);
  and \and_addra[12]_Naddra  (\and_addra[12]_Naddra_o , addra[12], ~addra[13]);
  and \and_addra[12]_addra[  (\and_addra[12]_addra[_o , addra[12], addra[13]);
  and \and_addrb[12]_Naddrb  (\and_addrb[12]_Naddrb_o , addrb[12], ~addrb[13]);
  and \and_addrb[12]_addrb[  (\and_addrb[12]_addrb[_o , addrb[12], addrb[13]);
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  // address_offset=0;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=9;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEAMUX("1"),
    .CEBMUX("1"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_16384x9_sub_000000_000 (
    .addra({addra[9:0],3'b111}),
    .addrb({addrb[9:0],3'b111}),
    .clka(clka),
    .clkb(clkb),
    .csa({\and_Naddra[12]_Naddr_o ,addra[11:10]}),
    .csb({\and_Naddrb[12]_Naddr_o ,addrb[11:10]}),
    .dia(dia),
    .dib(dib),
    .rsta(rsta),
    .rstb(rstb),
    .wea(wea),
    .web(web),
    .doa({inst_doa_i0_008,inst_doa_i0_007,inst_doa_i0_006,inst_doa_i0_005,inst_doa_i0_004,inst_doa_i0_003,inst_doa_i0_002,inst_doa_i0_001,inst_doa_i0_000}),
    .dob({inst_dob_i0_008,inst_dob_i0_007,inst_dob_i0_006,inst_dob_i0_005,inst_dob_i0_004,inst_dob_i0_003,inst_dob_i0_002,inst_dob_i0_001,inst_dob_i0_000}));
  // address_offset=1024;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=9;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEAMUX("1"),
    .CEBMUX("1"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_16384x9_sub_001024_000 (
    .addra({addra[9:0],3'b111}),
    .addrb({addrb[9:0],3'b111}),
    .clka(clka),
    .clkb(clkb),
    .csa({\and_Naddra[12]_Naddr_o ,addra[11:10]}),
    .csb({\and_Naddrb[12]_Naddr_o ,addrb[11:10]}),
    .dia(dia),
    .dib(dib),
    .rsta(rsta),
    .rstb(rstb),
    .wea(wea),
    .web(web),
    .doa({inst_doa_i1_008,inst_doa_i1_007,inst_doa_i1_006,inst_doa_i1_005,inst_doa_i1_004,inst_doa_i1_003,inst_doa_i1_002,inst_doa_i1_001,inst_doa_i1_000}),
    .dob({inst_dob_i1_008,inst_dob_i1_007,inst_dob_i1_006,inst_dob_i1_005,inst_dob_i1_004,inst_dob_i1_003,inst_dob_i1_002,inst_dob_i1_001,inst_dob_i1_000}));
  // address_offset=2048;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=9;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEAMUX("1"),
    .CEBMUX("1"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_16384x9_sub_002048_000 (
    .addra({addra[9:0],3'b111}),
    .addrb({addrb[9:0],3'b111}),
    .clka(clka),
    .clkb(clkb),
    .csa({\and_Naddra[12]_Naddr_o ,addra[11:10]}),
    .csb({\and_Naddrb[12]_Naddr_o ,addrb[11:10]}),
    .dia(dia),
    .dib(dib),
    .rsta(rsta),
    .rstb(rstb),
    .wea(wea),
    .web(web),
    .doa({inst_doa_i2_008,inst_doa_i2_007,inst_doa_i2_006,inst_doa_i2_005,inst_doa_i2_004,inst_doa_i2_003,inst_doa_i2_002,inst_doa_i2_001,inst_doa_i2_000}),
    .dob({inst_dob_i2_008,inst_dob_i2_007,inst_dob_i2_006,inst_dob_i2_005,inst_dob_i2_004,inst_dob_i2_003,inst_dob_i2_002,inst_dob_i2_001,inst_dob_i2_000}));
  // address_offset=3072;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=9;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEAMUX("1"),
    .CEBMUX("1"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_16384x9_sub_003072_000 (
    .addra({addra[9:0],3'b111}),
    .addrb({addrb[9:0],3'b111}),
    .clka(clka),
    .clkb(clkb),
    .csa({\and_Naddra[12]_Naddr_o ,addra[11:10]}),
    .csb({\and_Naddrb[12]_Naddr_o ,addrb[11:10]}),
    .dia(dia),
    .dib(dib),
    .rsta(rsta),
    .rstb(rstb),
    .wea(wea),
    .web(web),
    .doa({inst_doa_i3_008,inst_doa_i3_007,inst_doa_i3_006,inst_doa_i3_005,inst_doa_i3_004,inst_doa_i3_003,inst_doa_i3_002,inst_doa_i3_001,inst_doa_i3_000}),
    .dob({inst_dob_i3_008,inst_dob_i3_007,inst_dob_i3_006,inst_dob_i3_005,inst_dob_i3_004,inst_dob_i3_003,inst_dob_i3_002,inst_dob_i3_001,inst_dob_i3_000}));
  // address_offset=4096;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=9;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEAMUX("1"),
    .CEBMUX("1"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_16384x9_sub_004096_000 (
    .addra({addra[9:0],3'b111}),
    .addrb({addrb[9:0],3'b111}),
    .clka(clka),
    .clkb(clkb),
    .csa({\and_addra[12]_Naddra_o ,addra[11:10]}),
    .csb({\and_addrb[12]_Naddrb_o ,addrb[11:10]}),
    .dia(dia),
    .dib(dib),
    .rsta(rsta),
    .rstb(rstb),
    .wea(wea),
    .web(web),
    .doa({inst_doa_i4_008,inst_doa_i4_007,inst_doa_i4_006,inst_doa_i4_005,inst_doa_i4_004,inst_doa_i4_003,inst_doa_i4_002,inst_doa_i4_001,inst_doa_i4_000}),
    .dob({inst_dob_i4_008,inst_dob_i4_007,inst_dob_i4_006,inst_dob_i4_005,inst_dob_i4_004,inst_dob_i4_003,inst_dob_i4_002,inst_dob_i4_001,inst_dob_i4_000}));
  // address_offset=5120;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=9;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEAMUX("1"),
    .CEBMUX("1"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_16384x9_sub_005120_000 (
    .addra({addra[9:0],3'b111}),
    .addrb({addrb[9:0],3'b111}),
    .clka(clka),
    .clkb(clkb),
    .csa({\and_addra[12]_Naddra_o ,addra[11:10]}),
    .csb({\and_addrb[12]_Naddrb_o ,addrb[11:10]}),
    .dia(dia),
    .dib(dib),
    .rsta(rsta),
    .rstb(rstb),
    .wea(wea),
    .web(web),
    .doa({inst_doa_i5_008,inst_doa_i5_007,inst_doa_i5_006,inst_doa_i5_005,inst_doa_i5_004,inst_doa_i5_003,inst_doa_i5_002,inst_doa_i5_001,inst_doa_i5_000}),
    .dob({inst_dob_i5_008,inst_dob_i5_007,inst_dob_i5_006,inst_dob_i5_005,inst_dob_i5_004,inst_dob_i5_003,inst_dob_i5_002,inst_dob_i5_001,inst_dob_i5_000}));
  // address_offset=6144;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=9;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEAMUX("1"),
    .CEBMUX("1"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_16384x9_sub_006144_000 (
    .addra({addra[9:0],3'b111}),
    .addrb({addrb[9:0],3'b111}),
    .clka(clka),
    .clkb(clkb),
    .csa({\and_addra[12]_Naddra_o ,addra[11:10]}),
    .csb({\and_addrb[12]_Naddrb_o ,addrb[11:10]}),
    .dia(dia),
    .dib(dib),
    .rsta(rsta),
    .rstb(rstb),
    .wea(wea),
    .web(web),
    .doa({inst_doa_i6_008,inst_doa_i6_007,inst_doa_i6_006,inst_doa_i6_005,inst_doa_i6_004,inst_doa_i6_003,inst_doa_i6_002,inst_doa_i6_001,inst_doa_i6_000}),
    .dob({inst_dob_i6_008,inst_dob_i6_007,inst_dob_i6_006,inst_dob_i6_005,inst_dob_i6_004,inst_dob_i6_003,inst_dob_i6_002,inst_dob_i6_001,inst_dob_i6_000}));
  // address_offset=7168;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=9;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEAMUX("1"),
    .CEBMUX("1"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_16384x9_sub_007168_000 (
    .addra({addra[9:0],3'b111}),
    .addrb({addrb[9:0],3'b111}),
    .clka(clka),
    .clkb(clkb),
    .csa({\and_addra[12]_Naddra_o ,addra[11:10]}),
    .csb({\and_addrb[12]_Naddrb_o ,addrb[11:10]}),
    .dia(dia),
    .dib(dib),
    .rsta(rsta),
    .rstb(rstb),
    .wea(wea),
    .web(web),
    .doa({inst_doa_i7_008,inst_doa_i7_007,inst_doa_i7_006,inst_doa_i7_005,inst_doa_i7_004,inst_doa_i7_003,inst_doa_i7_002,inst_doa_i7_001,inst_doa_i7_000}),
    .dob({inst_dob_i7_008,inst_dob_i7_007,inst_dob_i7_006,inst_dob_i7_005,inst_dob_i7_004,inst_dob_i7_003,inst_dob_i7_002,inst_dob_i7_001,inst_dob_i7_000}));
  // address_offset=8192;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=9;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEAMUX("1"),
    .CEBMUX("1"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_16384x9_sub_008192_000 (
    .addra({addra[9:0],3'b111}),
    .addrb({addrb[9:0],3'b111}),
    .clka(clka),
    .clkb(clkb),
    .csa({\and_Naddra[12]_addra_o ,addra[11:10]}),
    .csb({\and_Naddrb[12]_addrb_o ,addrb[11:10]}),
    .dia(dia),
    .dib(dib),
    .rsta(rsta),
    .rstb(rstb),
    .wea(wea),
    .web(web),
    .doa({inst_doa_i8_008,inst_doa_i8_007,inst_doa_i8_006,inst_doa_i8_005,inst_doa_i8_004,inst_doa_i8_003,inst_doa_i8_002,inst_doa_i8_001,inst_doa_i8_000}),
    .dob({inst_dob_i8_008,inst_dob_i8_007,inst_dob_i8_006,inst_dob_i8_005,inst_dob_i8_004,inst_dob_i8_003,inst_dob_i8_002,inst_dob_i8_001,inst_dob_i8_000}));
  // address_offset=9216;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=9;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEAMUX("1"),
    .CEBMUX("1"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_16384x9_sub_009216_000 (
    .addra({addra[9:0],3'b111}),
    .addrb({addrb[9:0],3'b111}),
    .clka(clka),
    .clkb(clkb),
    .csa({\and_Naddra[12]_addra_o ,addra[11:10]}),
    .csb({\and_Naddrb[12]_addrb_o ,addrb[11:10]}),
    .dia(dia),
    .dib(dib),
    .rsta(rsta),
    .rstb(rstb),
    .wea(wea),
    .web(web),
    .doa({inst_doa_i9_008,inst_doa_i9_007,inst_doa_i9_006,inst_doa_i9_005,inst_doa_i9_004,inst_doa_i9_003,inst_doa_i9_002,inst_doa_i9_001,inst_doa_i9_000}),
    .dob({inst_dob_i9_008,inst_dob_i9_007,inst_dob_i9_006,inst_dob_i9_005,inst_dob_i9_004,inst_dob_i9_003,inst_dob_i9_002,inst_dob_i9_001,inst_dob_i9_000}));
  // address_offset=10240;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=9;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEAMUX("1"),
    .CEBMUX("1"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_16384x9_sub_010240_000 (
    .addra({addra[9:0],3'b111}),
    .addrb({addrb[9:0],3'b111}),
    .clka(clka),
    .clkb(clkb),
    .csa({\and_Naddra[12]_addra_o ,addra[11:10]}),
    .csb({\and_Naddrb[12]_addrb_o ,addrb[11:10]}),
    .dia(dia),
    .dib(dib),
    .rsta(rsta),
    .rstb(rstb),
    .wea(wea),
    .web(web),
    .doa({inst_doa_i10_008,inst_doa_i10_007,inst_doa_i10_006,inst_doa_i10_005,inst_doa_i10_004,inst_doa_i10_003,inst_doa_i10_002,inst_doa_i10_001,inst_doa_i10_000}),
    .dob({inst_dob_i10_008,inst_dob_i10_007,inst_dob_i10_006,inst_dob_i10_005,inst_dob_i10_004,inst_dob_i10_003,inst_dob_i10_002,inst_dob_i10_001,inst_dob_i10_000}));
  // address_offset=11264;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=9;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEAMUX("1"),
    .CEBMUX("1"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_16384x9_sub_011264_000 (
    .addra({addra[9:0],3'b111}),
    .addrb({addrb[9:0],3'b111}),
    .clka(clka),
    .clkb(clkb),
    .csa({\and_Naddra[12]_addra_o ,addra[11:10]}),
    .csb({\and_Naddrb[12]_addrb_o ,addrb[11:10]}),
    .dia(dia),
    .dib(dib),
    .rsta(rsta),
    .rstb(rstb),
    .wea(wea),
    .web(web),
    .doa({inst_doa_i11_008,inst_doa_i11_007,inst_doa_i11_006,inst_doa_i11_005,inst_doa_i11_004,inst_doa_i11_003,inst_doa_i11_002,inst_doa_i11_001,inst_doa_i11_000}),
    .dob({inst_dob_i11_008,inst_dob_i11_007,inst_dob_i11_006,inst_dob_i11_005,inst_dob_i11_004,inst_dob_i11_003,inst_dob_i11_002,inst_dob_i11_001,inst_dob_i11_000}));
  // address_offset=12288;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=9;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEAMUX("1"),
    .CEBMUX("1"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_16384x9_sub_012288_000 (
    .addra({addra[9:0],3'b111}),
    .addrb({addrb[9:0],3'b111}),
    .clka(clka),
    .clkb(clkb),
    .csa({\and_addra[12]_addra[_o ,addra[11:10]}),
    .csb({\and_addrb[12]_addrb[_o ,addrb[11:10]}),
    .dia(dia),
    .dib(dib),
    .rsta(rsta),
    .rstb(rstb),
    .wea(wea),
    .web(web),
    .doa({inst_doa_i12_008,inst_doa_i12_007,inst_doa_i12_006,inst_doa_i12_005,inst_doa_i12_004,inst_doa_i12_003,inst_doa_i12_002,inst_doa_i12_001,inst_doa_i12_000}),
    .dob({inst_dob_i12_008,inst_dob_i12_007,inst_dob_i12_006,inst_dob_i12_005,inst_dob_i12_004,inst_dob_i12_003,inst_dob_i12_002,inst_dob_i12_001,inst_dob_i12_000}));
  // address_offset=13312;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=9;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEAMUX("1"),
    .CEBMUX("1"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_16384x9_sub_013312_000 (
    .addra({addra[9:0],3'b111}),
    .addrb({addrb[9:0],3'b111}),
    .clka(clka),
    .clkb(clkb),
    .csa({\and_addra[12]_addra[_o ,addra[11:10]}),
    .csb({\and_addrb[12]_addrb[_o ,addrb[11:10]}),
    .dia(dia),
    .dib(dib),
    .rsta(rsta),
    .rstb(rstb),
    .wea(wea),
    .web(web),
    .doa({inst_doa_i13_008,inst_doa_i13_007,inst_doa_i13_006,inst_doa_i13_005,inst_doa_i13_004,inst_doa_i13_003,inst_doa_i13_002,inst_doa_i13_001,inst_doa_i13_000}),
    .dob({inst_dob_i13_008,inst_dob_i13_007,inst_dob_i13_006,inst_dob_i13_005,inst_dob_i13_004,inst_dob_i13_003,inst_dob_i13_002,inst_dob_i13_001,inst_dob_i13_000}));
  // address_offset=14336;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=9;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEAMUX("1"),
    .CEBMUX("1"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_16384x9_sub_014336_000 (
    .addra({addra[9:0],3'b111}),
    .addrb({addrb[9:0],3'b111}),
    .clka(clka),
    .clkb(clkb),
    .csa({\and_addra[12]_addra[_o ,addra[11:10]}),
    .csb({\and_addrb[12]_addrb[_o ,addrb[11:10]}),
    .dia(dia),
    .dib(dib),
    .rsta(rsta),
    .rstb(rstb),
    .wea(wea),
    .web(web),
    .doa({inst_doa_i14_008,inst_doa_i14_007,inst_doa_i14_006,inst_doa_i14_005,inst_doa_i14_004,inst_doa_i14_003,inst_doa_i14_002,inst_doa_i14_001,inst_doa_i14_000}),
    .dob({inst_dob_i14_008,inst_dob_i14_007,inst_dob_i14_006,inst_dob_i14_005,inst_dob_i14_004,inst_dob_i14_003,inst_dob_i14_002,inst_dob_i14_001,inst_dob_i14_000}));
  // address_offset=15360;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=9;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEAMUX("1"),
    .CEBMUX("1"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_16384x9_sub_015360_000 (
    .addra({addra[9:0],3'b111}),
    .addrb({addrb[9:0],3'b111}),
    .clka(clka),
    .clkb(clkb),
    .csa({\and_addra[12]_addra[_o ,addra[11:10]}),
    .csb({\and_addrb[12]_addrb[_o ,addrb[11:10]}),
    .dia(dia),
    .dib(dib),
    .rsta(rsta),
    .rstb(rstb),
    .wea(wea),
    .web(web),
    .doa({inst_doa_i15_008,inst_doa_i15_007,inst_doa_i15_006,inst_doa_i15_005,inst_doa_i15_004,inst_doa_i15_003,inst_doa_i15_002,inst_doa_i15_001,inst_doa_i15_000}),
    .dob({inst_dob_i15_008,inst_dob_i15_007,inst_dob_i15_006,inst_dob_i15_005,inst_dob_i15_004,inst_dob_i15_003,inst_dob_i15_002,inst_dob_i15_001,inst_dob_i15_000}));
  AL_MUX \inst_doa_mux_b0/al_mux_b0_0_0  (
    .i0(inst_doa_i0_000),
    .i1(inst_doa_i1_000),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b0/B0_0 ));
  AL_MUX \inst_doa_mux_b0/al_mux_b0_0_1  (
    .i0(inst_doa_i2_000),
    .i1(inst_doa_i3_000),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b0/B0_1 ));
  AL_MUX \inst_doa_mux_b0/al_mux_b0_0_2  (
    .i0(inst_doa_i4_000),
    .i1(inst_doa_i5_000),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b0/B0_2 ));
  AL_MUX \inst_doa_mux_b0/al_mux_b0_0_3  (
    .i0(inst_doa_i6_000),
    .i1(inst_doa_i7_000),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b0/B0_3 ));
  AL_MUX \inst_doa_mux_b0/al_mux_b0_0_4  (
    .i0(inst_doa_i8_000),
    .i1(inst_doa_i9_000),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b0/B0_4 ));
  AL_MUX \inst_doa_mux_b0/al_mux_b0_0_5  (
    .i0(inst_doa_i10_000),
    .i1(inst_doa_i11_000),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b0/B0_5 ));
  AL_MUX \inst_doa_mux_b0/al_mux_b0_0_6  (
    .i0(inst_doa_i12_000),
    .i1(inst_doa_i13_000),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b0/B0_6 ));
  AL_MUX \inst_doa_mux_b0/al_mux_b0_0_7  (
    .i0(inst_doa_i14_000),
    .i1(inst_doa_i15_000),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b0/B0_7 ));
  AL_MUX \inst_doa_mux_b0/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b0/B0_0 ),
    .i1(\inst_doa_mux_b0/B0_1 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b0/B1_0 ));
  AL_MUX \inst_doa_mux_b0/al_mux_b0_1_1  (
    .i0(\inst_doa_mux_b0/B0_2 ),
    .i1(\inst_doa_mux_b0/B0_3 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b0/B1_1 ));
  AL_MUX \inst_doa_mux_b0/al_mux_b0_1_2  (
    .i0(\inst_doa_mux_b0/B0_4 ),
    .i1(\inst_doa_mux_b0/B0_5 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b0/B1_2 ));
  AL_MUX \inst_doa_mux_b0/al_mux_b0_1_3  (
    .i0(\inst_doa_mux_b0/B0_6 ),
    .i1(\inst_doa_mux_b0/B0_7 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b0/B1_3 ));
  AL_MUX \inst_doa_mux_b0/al_mux_b0_2_0  (
    .i0(\inst_doa_mux_b0/B1_0 ),
    .i1(\inst_doa_mux_b0/B1_1 ),
    .sel(addra_piped[2]),
    .o(\inst_doa_mux_b0/B2_0 ));
  AL_MUX \inst_doa_mux_b0/al_mux_b0_2_1  (
    .i0(\inst_doa_mux_b0/B1_2 ),
    .i1(\inst_doa_mux_b0/B1_3 ),
    .sel(addra_piped[2]),
    .o(\inst_doa_mux_b0/B2_1 ));
  AL_MUX \inst_doa_mux_b0/al_mux_b0_3_0  (
    .i0(\inst_doa_mux_b0/B2_0 ),
    .i1(\inst_doa_mux_b0/B2_1 ),
    .sel(addra_piped[3]),
    .o(doa[0]));
  AL_MUX \inst_doa_mux_b1/al_mux_b0_0_0  (
    .i0(inst_doa_i0_001),
    .i1(inst_doa_i1_001),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b1/B0_0 ));
  AL_MUX \inst_doa_mux_b1/al_mux_b0_0_1  (
    .i0(inst_doa_i2_001),
    .i1(inst_doa_i3_001),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b1/B0_1 ));
  AL_MUX \inst_doa_mux_b1/al_mux_b0_0_2  (
    .i0(inst_doa_i4_001),
    .i1(inst_doa_i5_001),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b1/B0_2 ));
  AL_MUX \inst_doa_mux_b1/al_mux_b0_0_3  (
    .i0(inst_doa_i6_001),
    .i1(inst_doa_i7_001),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b1/B0_3 ));
  AL_MUX \inst_doa_mux_b1/al_mux_b0_0_4  (
    .i0(inst_doa_i8_001),
    .i1(inst_doa_i9_001),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b1/B0_4 ));
  AL_MUX \inst_doa_mux_b1/al_mux_b0_0_5  (
    .i0(inst_doa_i10_001),
    .i1(inst_doa_i11_001),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b1/B0_5 ));
  AL_MUX \inst_doa_mux_b1/al_mux_b0_0_6  (
    .i0(inst_doa_i12_001),
    .i1(inst_doa_i13_001),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b1/B0_6 ));
  AL_MUX \inst_doa_mux_b1/al_mux_b0_0_7  (
    .i0(inst_doa_i14_001),
    .i1(inst_doa_i15_001),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b1/B0_7 ));
  AL_MUX \inst_doa_mux_b1/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b1/B0_0 ),
    .i1(\inst_doa_mux_b1/B0_1 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b1/B1_0 ));
  AL_MUX \inst_doa_mux_b1/al_mux_b0_1_1  (
    .i0(\inst_doa_mux_b1/B0_2 ),
    .i1(\inst_doa_mux_b1/B0_3 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b1/B1_1 ));
  AL_MUX \inst_doa_mux_b1/al_mux_b0_1_2  (
    .i0(\inst_doa_mux_b1/B0_4 ),
    .i1(\inst_doa_mux_b1/B0_5 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b1/B1_2 ));
  AL_MUX \inst_doa_mux_b1/al_mux_b0_1_3  (
    .i0(\inst_doa_mux_b1/B0_6 ),
    .i1(\inst_doa_mux_b1/B0_7 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b1/B1_3 ));
  AL_MUX \inst_doa_mux_b1/al_mux_b0_2_0  (
    .i0(\inst_doa_mux_b1/B1_0 ),
    .i1(\inst_doa_mux_b1/B1_1 ),
    .sel(addra_piped[2]),
    .o(\inst_doa_mux_b1/B2_0 ));
  AL_MUX \inst_doa_mux_b1/al_mux_b0_2_1  (
    .i0(\inst_doa_mux_b1/B1_2 ),
    .i1(\inst_doa_mux_b1/B1_3 ),
    .sel(addra_piped[2]),
    .o(\inst_doa_mux_b1/B2_1 ));
  AL_MUX \inst_doa_mux_b1/al_mux_b0_3_0  (
    .i0(\inst_doa_mux_b1/B2_0 ),
    .i1(\inst_doa_mux_b1/B2_1 ),
    .sel(addra_piped[3]),
    .o(doa[1]));
  AL_MUX \inst_doa_mux_b2/al_mux_b0_0_0  (
    .i0(inst_doa_i0_002),
    .i1(inst_doa_i1_002),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b2/B0_0 ));
  AL_MUX \inst_doa_mux_b2/al_mux_b0_0_1  (
    .i0(inst_doa_i2_002),
    .i1(inst_doa_i3_002),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b2/B0_1 ));
  AL_MUX \inst_doa_mux_b2/al_mux_b0_0_2  (
    .i0(inst_doa_i4_002),
    .i1(inst_doa_i5_002),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b2/B0_2 ));
  AL_MUX \inst_doa_mux_b2/al_mux_b0_0_3  (
    .i0(inst_doa_i6_002),
    .i1(inst_doa_i7_002),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b2/B0_3 ));
  AL_MUX \inst_doa_mux_b2/al_mux_b0_0_4  (
    .i0(inst_doa_i8_002),
    .i1(inst_doa_i9_002),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b2/B0_4 ));
  AL_MUX \inst_doa_mux_b2/al_mux_b0_0_5  (
    .i0(inst_doa_i10_002),
    .i1(inst_doa_i11_002),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b2/B0_5 ));
  AL_MUX \inst_doa_mux_b2/al_mux_b0_0_6  (
    .i0(inst_doa_i12_002),
    .i1(inst_doa_i13_002),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b2/B0_6 ));
  AL_MUX \inst_doa_mux_b2/al_mux_b0_0_7  (
    .i0(inst_doa_i14_002),
    .i1(inst_doa_i15_002),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b2/B0_7 ));
  AL_MUX \inst_doa_mux_b2/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b2/B0_0 ),
    .i1(\inst_doa_mux_b2/B0_1 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b2/B1_0 ));
  AL_MUX \inst_doa_mux_b2/al_mux_b0_1_1  (
    .i0(\inst_doa_mux_b2/B0_2 ),
    .i1(\inst_doa_mux_b2/B0_3 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b2/B1_1 ));
  AL_MUX \inst_doa_mux_b2/al_mux_b0_1_2  (
    .i0(\inst_doa_mux_b2/B0_4 ),
    .i1(\inst_doa_mux_b2/B0_5 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b2/B1_2 ));
  AL_MUX \inst_doa_mux_b2/al_mux_b0_1_3  (
    .i0(\inst_doa_mux_b2/B0_6 ),
    .i1(\inst_doa_mux_b2/B0_7 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b2/B1_3 ));
  AL_MUX \inst_doa_mux_b2/al_mux_b0_2_0  (
    .i0(\inst_doa_mux_b2/B1_0 ),
    .i1(\inst_doa_mux_b2/B1_1 ),
    .sel(addra_piped[2]),
    .o(\inst_doa_mux_b2/B2_0 ));
  AL_MUX \inst_doa_mux_b2/al_mux_b0_2_1  (
    .i0(\inst_doa_mux_b2/B1_2 ),
    .i1(\inst_doa_mux_b2/B1_3 ),
    .sel(addra_piped[2]),
    .o(\inst_doa_mux_b2/B2_1 ));
  AL_MUX \inst_doa_mux_b2/al_mux_b0_3_0  (
    .i0(\inst_doa_mux_b2/B2_0 ),
    .i1(\inst_doa_mux_b2/B2_1 ),
    .sel(addra_piped[3]),
    .o(doa[2]));
  AL_MUX \inst_doa_mux_b3/al_mux_b0_0_0  (
    .i0(inst_doa_i0_003),
    .i1(inst_doa_i1_003),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b3/B0_0 ));
  AL_MUX \inst_doa_mux_b3/al_mux_b0_0_1  (
    .i0(inst_doa_i2_003),
    .i1(inst_doa_i3_003),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b3/B0_1 ));
  AL_MUX \inst_doa_mux_b3/al_mux_b0_0_2  (
    .i0(inst_doa_i4_003),
    .i1(inst_doa_i5_003),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b3/B0_2 ));
  AL_MUX \inst_doa_mux_b3/al_mux_b0_0_3  (
    .i0(inst_doa_i6_003),
    .i1(inst_doa_i7_003),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b3/B0_3 ));
  AL_MUX \inst_doa_mux_b3/al_mux_b0_0_4  (
    .i0(inst_doa_i8_003),
    .i1(inst_doa_i9_003),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b3/B0_4 ));
  AL_MUX \inst_doa_mux_b3/al_mux_b0_0_5  (
    .i0(inst_doa_i10_003),
    .i1(inst_doa_i11_003),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b3/B0_5 ));
  AL_MUX \inst_doa_mux_b3/al_mux_b0_0_6  (
    .i0(inst_doa_i12_003),
    .i1(inst_doa_i13_003),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b3/B0_6 ));
  AL_MUX \inst_doa_mux_b3/al_mux_b0_0_7  (
    .i0(inst_doa_i14_003),
    .i1(inst_doa_i15_003),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b3/B0_7 ));
  AL_MUX \inst_doa_mux_b3/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b3/B0_0 ),
    .i1(\inst_doa_mux_b3/B0_1 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b3/B1_0 ));
  AL_MUX \inst_doa_mux_b3/al_mux_b0_1_1  (
    .i0(\inst_doa_mux_b3/B0_2 ),
    .i1(\inst_doa_mux_b3/B0_3 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b3/B1_1 ));
  AL_MUX \inst_doa_mux_b3/al_mux_b0_1_2  (
    .i0(\inst_doa_mux_b3/B0_4 ),
    .i1(\inst_doa_mux_b3/B0_5 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b3/B1_2 ));
  AL_MUX \inst_doa_mux_b3/al_mux_b0_1_3  (
    .i0(\inst_doa_mux_b3/B0_6 ),
    .i1(\inst_doa_mux_b3/B0_7 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b3/B1_3 ));
  AL_MUX \inst_doa_mux_b3/al_mux_b0_2_0  (
    .i0(\inst_doa_mux_b3/B1_0 ),
    .i1(\inst_doa_mux_b3/B1_1 ),
    .sel(addra_piped[2]),
    .o(\inst_doa_mux_b3/B2_0 ));
  AL_MUX \inst_doa_mux_b3/al_mux_b0_2_1  (
    .i0(\inst_doa_mux_b3/B1_2 ),
    .i1(\inst_doa_mux_b3/B1_3 ),
    .sel(addra_piped[2]),
    .o(\inst_doa_mux_b3/B2_1 ));
  AL_MUX \inst_doa_mux_b3/al_mux_b0_3_0  (
    .i0(\inst_doa_mux_b3/B2_0 ),
    .i1(\inst_doa_mux_b3/B2_1 ),
    .sel(addra_piped[3]),
    .o(doa[3]));
  AL_MUX \inst_doa_mux_b4/al_mux_b0_0_0  (
    .i0(inst_doa_i0_004),
    .i1(inst_doa_i1_004),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b4/B0_0 ));
  AL_MUX \inst_doa_mux_b4/al_mux_b0_0_1  (
    .i0(inst_doa_i2_004),
    .i1(inst_doa_i3_004),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b4/B0_1 ));
  AL_MUX \inst_doa_mux_b4/al_mux_b0_0_2  (
    .i0(inst_doa_i4_004),
    .i1(inst_doa_i5_004),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b4/B0_2 ));
  AL_MUX \inst_doa_mux_b4/al_mux_b0_0_3  (
    .i0(inst_doa_i6_004),
    .i1(inst_doa_i7_004),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b4/B0_3 ));
  AL_MUX \inst_doa_mux_b4/al_mux_b0_0_4  (
    .i0(inst_doa_i8_004),
    .i1(inst_doa_i9_004),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b4/B0_4 ));
  AL_MUX \inst_doa_mux_b4/al_mux_b0_0_5  (
    .i0(inst_doa_i10_004),
    .i1(inst_doa_i11_004),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b4/B0_5 ));
  AL_MUX \inst_doa_mux_b4/al_mux_b0_0_6  (
    .i0(inst_doa_i12_004),
    .i1(inst_doa_i13_004),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b4/B0_6 ));
  AL_MUX \inst_doa_mux_b4/al_mux_b0_0_7  (
    .i0(inst_doa_i14_004),
    .i1(inst_doa_i15_004),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b4/B0_7 ));
  AL_MUX \inst_doa_mux_b4/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b4/B0_0 ),
    .i1(\inst_doa_mux_b4/B0_1 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b4/B1_0 ));
  AL_MUX \inst_doa_mux_b4/al_mux_b0_1_1  (
    .i0(\inst_doa_mux_b4/B0_2 ),
    .i1(\inst_doa_mux_b4/B0_3 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b4/B1_1 ));
  AL_MUX \inst_doa_mux_b4/al_mux_b0_1_2  (
    .i0(\inst_doa_mux_b4/B0_4 ),
    .i1(\inst_doa_mux_b4/B0_5 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b4/B1_2 ));
  AL_MUX \inst_doa_mux_b4/al_mux_b0_1_3  (
    .i0(\inst_doa_mux_b4/B0_6 ),
    .i1(\inst_doa_mux_b4/B0_7 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b4/B1_3 ));
  AL_MUX \inst_doa_mux_b4/al_mux_b0_2_0  (
    .i0(\inst_doa_mux_b4/B1_0 ),
    .i1(\inst_doa_mux_b4/B1_1 ),
    .sel(addra_piped[2]),
    .o(\inst_doa_mux_b4/B2_0 ));
  AL_MUX \inst_doa_mux_b4/al_mux_b0_2_1  (
    .i0(\inst_doa_mux_b4/B1_2 ),
    .i1(\inst_doa_mux_b4/B1_3 ),
    .sel(addra_piped[2]),
    .o(\inst_doa_mux_b4/B2_1 ));
  AL_MUX \inst_doa_mux_b4/al_mux_b0_3_0  (
    .i0(\inst_doa_mux_b4/B2_0 ),
    .i1(\inst_doa_mux_b4/B2_1 ),
    .sel(addra_piped[3]),
    .o(doa[4]));
  AL_MUX \inst_doa_mux_b5/al_mux_b0_0_0  (
    .i0(inst_doa_i0_005),
    .i1(inst_doa_i1_005),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b5/B0_0 ));
  AL_MUX \inst_doa_mux_b5/al_mux_b0_0_1  (
    .i0(inst_doa_i2_005),
    .i1(inst_doa_i3_005),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b5/B0_1 ));
  AL_MUX \inst_doa_mux_b5/al_mux_b0_0_2  (
    .i0(inst_doa_i4_005),
    .i1(inst_doa_i5_005),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b5/B0_2 ));
  AL_MUX \inst_doa_mux_b5/al_mux_b0_0_3  (
    .i0(inst_doa_i6_005),
    .i1(inst_doa_i7_005),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b5/B0_3 ));
  AL_MUX \inst_doa_mux_b5/al_mux_b0_0_4  (
    .i0(inst_doa_i8_005),
    .i1(inst_doa_i9_005),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b5/B0_4 ));
  AL_MUX \inst_doa_mux_b5/al_mux_b0_0_5  (
    .i0(inst_doa_i10_005),
    .i1(inst_doa_i11_005),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b5/B0_5 ));
  AL_MUX \inst_doa_mux_b5/al_mux_b0_0_6  (
    .i0(inst_doa_i12_005),
    .i1(inst_doa_i13_005),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b5/B0_6 ));
  AL_MUX \inst_doa_mux_b5/al_mux_b0_0_7  (
    .i0(inst_doa_i14_005),
    .i1(inst_doa_i15_005),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b5/B0_7 ));
  AL_MUX \inst_doa_mux_b5/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b5/B0_0 ),
    .i1(\inst_doa_mux_b5/B0_1 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b5/B1_0 ));
  AL_MUX \inst_doa_mux_b5/al_mux_b0_1_1  (
    .i0(\inst_doa_mux_b5/B0_2 ),
    .i1(\inst_doa_mux_b5/B0_3 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b5/B1_1 ));
  AL_MUX \inst_doa_mux_b5/al_mux_b0_1_2  (
    .i0(\inst_doa_mux_b5/B0_4 ),
    .i1(\inst_doa_mux_b5/B0_5 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b5/B1_2 ));
  AL_MUX \inst_doa_mux_b5/al_mux_b0_1_3  (
    .i0(\inst_doa_mux_b5/B0_6 ),
    .i1(\inst_doa_mux_b5/B0_7 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b5/B1_3 ));
  AL_MUX \inst_doa_mux_b5/al_mux_b0_2_0  (
    .i0(\inst_doa_mux_b5/B1_0 ),
    .i1(\inst_doa_mux_b5/B1_1 ),
    .sel(addra_piped[2]),
    .o(\inst_doa_mux_b5/B2_0 ));
  AL_MUX \inst_doa_mux_b5/al_mux_b0_2_1  (
    .i0(\inst_doa_mux_b5/B1_2 ),
    .i1(\inst_doa_mux_b5/B1_3 ),
    .sel(addra_piped[2]),
    .o(\inst_doa_mux_b5/B2_1 ));
  AL_MUX \inst_doa_mux_b5/al_mux_b0_3_0  (
    .i0(\inst_doa_mux_b5/B2_0 ),
    .i1(\inst_doa_mux_b5/B2_1 ),
    .sel(addra_piped[3]),
    .o(doa[5]));
  AL_MUX \inst_doa_mux_b6/al_mux_b0_0_0  (
    .i0(inst_doa_i0_006),
    .i1(inst_doa_i1_006),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b6/B0_0 ));
  AL_MUX \inst_doa_mux_b6/al_mux_b0_0_1  (
    .i0(inst_doa_i2_006),
    .i1(inst_doa_i3_006),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b6/B0_1 ));
  AL_MUX \inst_doa_mux_b6/al_mux_b0_0_2  (
    .i0(inst_doa_i4_006),
    .i1(inst_doa_i5_006),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b6/B0_2 ));
  AL_MUX \inst_doa_mux_b6/al_mux_b0_0_3  (
    .i0(inst_doa_i6_006),
    .i1(inst_doa_i7_006),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b6/B0_3 ));
  AL_MUX \inst_doa_mux_b6/al_mux_b0_0_4  (
    .i0(inst_doa_i8_006),
    .i1(inst_doa_i9_006),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b6/B0_4 ));
  AL_MUX \inst_doa_mux_b6/al_mux_b0_0_5  (
    .i0(inst_doa_i10_006),
    .i1(inst_doa_i11_006),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b6/B0_5 ));
  AL_MUX \inst_doa_mux_b6/al_mux_b0_0_6  (
    .i0(inst_doa_i12_006),
    .i1(inst_doa_i13_006),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b6/B0_6 ));
  AL_MUX \inst_doa_mux_b6/al_mux_b0_0_7  (
    .i0(inst_doa_i14_006),
    .i1(inst_doa_i15_006),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b6/B0_7 ));
  AL_MUX \inst_doa_mux_b6/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b6/B0_0 ),
    .i1(\inst_doa_mux_b6/B0_1 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b6/B1_0 ));
  AL_MUX \inst_doa_mux_b6/al_mux_b0_1_1  (
    .i0(\inst_doa_mux_b6/B0_2 ),
    .i1(\inst_doa_mux_b6/B0_3 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b6/B1_1 ));
  AL_MUX \inst_doa_mux_b6/al_mux_b0_1_2  (
    .i0(\inst_doa_mux_b6/B0_4 ),
    .i1(\inst_doa_mux_b6/B0_5 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b6/B1_2 ));
  AL_MUX \inst_doa_mux_b6/al_mux_b0_1_3  (
    .i0(\inst_doa_mux_b6/B0_6 ),
    .i1(\inst_doa_mux_b6/B0_7 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b6/B1_3 ));
  AL_MUX \inst_doa_mux_b6/al_mux_b0_2_0  (
    .i0(\inst_doa_mux_b6/B1_0 ),
    .i1(\inst_doa_mux_b6/B1_1 ),
    .sel(addra_piped[2]),
    .o(\inst_doa_mux_b6/B2_0 ));
  AL_MUX \inst_doa_mux_b6/al_mux_b0_2_1  (
    .i0(\inst_doa_mux_b6/B1_2 ),
    .i1(\inst_doa_mux_b6/B1_3 ),
    .sel(addra_piped[2]),
    .o(\inst_doa_mux_b6/B2_1 ));
  AL_MUX \inst_doa_mux_b6/al_mux_b0_3_0  (
    .i0(\inst_doa_mux_b6/B2_0 ),
    .i1(\inst_doa_mux_b6/B2_1 ),
    .sel(addra_piped[3]),
    .o(doa[6]));
  AL_MUX \inst_doa_mux_b7/al_mux_b0_0_0  (
    .i0(inst_doa_i0_007),
    .i1(inst_doa_i1_007),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b7/B0_0 ));
  AL_MUX \inst_doa_mux_b7/al_mux_b0_0_1  (
    .i0(inst_doa_i2_007),
    .i1(inst_doa_i3_007),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b7/B0_1 ));
  AL_MUX \inst_doa_mux_b7/al_mux_b0_0_2  (
    .i0(inst_doa_i4_007),
    .i1(inst_doa_i5_007),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b7/B0_2 ));
  AL_MUX \inst_doa_mux_b7/al_mux_b0_0_3  (
    .i0(inst_doa_i6_007),
    .i1(inst_doa_i7_007),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b7/B0_3 ));
  AL_MUX \inst_doa_mux_b7/al_mux_b0_0_4  (
    .i0(inst_doa_i8_007),
    .i1(inst_doa_i9_007),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b7/B0_4 ));
  AL_MUX \inst_doa_mux_b7/al_mux_b0_0_5  (
    .i0(inst_doa_i10_007),
    .i1(inst_doa_i11_007),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b7/B0_5 ));
  AL_MUX \inst_doa_mux_b7/al_mux_b0_0_6  (
    .i0(inst_doa_i12_007),
    .i1(inst_doa_i13_007),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b7/B0_6 ));
  AL_MUX \inst_doa_mux_b7/al_mux_b0_0_7  (
    .i0(inst_doa_i14_007),
    .i1(inst_doa_i15_007),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b7/B0_7 ));
  AL_MUX \inst_doa_mux_b7/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b7/B0_0 ),
    .i1(\inst_doa_mux_b7/B0_1 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b7/B1_0 ));
  AL_MUX \inst_doa_mux_b7/al_mux_b0_1_1  (
    .i0(\inst_doa_mux_b7/B0_2 ),
    .i1(\inst_doa_mux_b7/B0_3 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b7/B1_1 ));
  AL_MUX \inst_doa_mux_b7/al_mux_b0_1_2  (
    .i0(\inst_doa_mux_b7/B0_4 ),
    .i1(\inst_doa_mux_b7/B0_5 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b7/B1_2 ));
  AL_MUX \inst_doa_mux_b7/al_mux_b0_1_3  (
    .i0(\inst_doa_mux_b7/B0_6 ),
    .i1(\inst_doa_mux_b7/B0_7 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b7/B1_3 ));
  AL_MUX \inst_doa_mux_b7/al_mux_b0_2_0  (
    .i0(\inst_doa_mux_b7/B1_0 ),
    .i1(\inst_doa_mux_b7/B1_1 ),
    .sel(addra_piped[2]),
    .o(\inst_doa_mux_b7/B2_0 ));
  AL_MUX \inst_doa_mux_b7/al_mux_b0_2_1  (
    .i0(\inst_doa_mux_b7/B1_2 ),
    .i1(\inst_doa_mux_b7/B1_3 ),
    .sel(addra_piped[2]),
    .o(\inst_doa_mux_b7/B2_1 ));
  AL_MUX \inst_doa_mux_b7/al_mux_b0_3_0  (
    .i0(\inst_doa_mux_b7/B2_0 ),
    .i1(\inst_doa_mux_b7/B2_1 ),
    .sel(addra_piped[3]),
    .o(doa[7]));
  AL_MUX \inst_doa_mux_b8/al_mux_b0_0_0  (
    .i0(inst_doa_i0_008),
    .i1(inst_doa_i1_008),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b8/B0_0 ));
  AL_MUX \inst_doa_mux_b8/al_mux_b0_0_1  (
    .i0(inst_doa_i2_008),
    .i1(inst_doa_i3_008),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b8/B0_1 ));
  AL_MUX \inst_doa_mux_b8/al_mux_b0_0_2  (
    .i0(inst_doa_i4_008),
    .i1(inst_doa_i5_008),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b8/B0_2 ));
  AL_MUX \inst_doa_mux_b8/al_mux_b0_0_3  (
    .i0(inst_doa_i6_008),
    .i1(inst_doa_i7_008),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b8/B0_3 ));
  AL_MUX \inst_doa_mux_b8/al_mux_b0_0_4  (
    .i0(inst_doa_i8_008),
    .i1(inst_doa_i9_008),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b8/B0_4 ));
  AL_MUX \inst_doa_mux_b8/al_mux_b0_0_5  (
    .i0(inst_doa_i10_008),
    .i1(inst_doa_i11_008),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b8/B0_5 ));
  AL_MUX \inst_doa_mux_b8/al_mux_b0_0_6  (
    .i0(inst_doa_i12_008),
    .i1(inst_doa_i13_008),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b8/B0_6 ));
  AL_MUX \inst_doa_mux_b8/al_mux_b0_0_7  (
    .i0(inst_doa_i14_008),
    .i1(inst_doa_i15_008),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b8/B0_7 ));
  AL_MUX \inst_doa_mux_b8/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b8/B0_0 ),
    .i1(\inst_doa_mux_b8/B0_1 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b8/B1_0 ));
  AL_MUX \inst_doa_mux_b8/al_mux_b0_1_1  (
    .i0(\inst_doa_mux_b8/B0_2 ),
    .i1(\inst_doa_mux_b8/B0_3 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b8/B1_1 ));
  AL_MUX \inst_doa_mux_b8/al_mux_b0_1_2  (
    .i0(\inst_doa_mux_b8/B0_4 ),
    .i1(\inst_doa_mux_b8/B0_5 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b8/B1_2 ));
  AL_MUX \inst_doa_mux_b8/al_mux_b0_1_3  (
    .i0(\inst_doa_mux_b8/B0_6 ),
    .i1(\inst_doa_mux_b8/B0_7 ),
    .sel(addra_piped[1]),
    .o(\inst_doa_mux_b8/B1_3 ));
  AL_MUX \inst_doa_mux_b8/al_mux_b0_2_0  (
    .i0(\inst_doa_mux_b8/B1_0 ),
    .i1(\inst_doa_mux_b8/B1_1 ),
    .sel(addra_piped[2]),
    .o(\inst_doa_mux_b8/B2_0 ));
  AL_MUX \inst_doa_mux_b8/al_mux_b0_2_1  (
    .i0(\inst_doa_mux_b8/B1_2 ),
    .i1(\inst_doa_mux_b8/B1_3 ),
    .sel(addra_piped[2]),
    .o(\inst_doa_mux_b8/B2_1 ));
  AL_MUX \inst_doa_mux_b8/al_mux_b0_3_0  (
    .i0(\inst_doa_mux_b8/B2_0 ),
    .i1(\inst_doa_mux_b8/B2_1 ),
    .sel(addra_piped[3]),
    .o(doa[8]));
  AL_MUX \inst_dob_mux_b0/al_mux_b0_0_0  (
    .i0(inst_dob_i0_000),
    .i1(inst_dob_i1_000),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b0/B0_0 ));
  AL_MUX \inst_dob_mux_b0/al_mux_b0_0_1  (
    .i0(inst_dob_i2_000),
    .i1(inst_dob_i3_000),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b0/B0_1 ));
  AL_MUX \inst_dob_mux_b0/al_mux_b0_0_2  (
    .i0(inst_dob_i4_000),
    .i1(inst_dob_i5_000),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b0/B0_2 ));
  AL_MUX \inst_dob_mux_b0/al_mux_b0_0_3  (
    .i0(inst_dob_i6_000),
    .i1(inst_dob_i7_000),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b0/B0_3 ));
  AL_MUX \inst_dob_mux_b0/al_mux_b0_0_4  (
    .i0(inst_dob_i8_000),
    .i1(inst_dob_i9_000),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b0/B0_4 ));
  AL_MUX \inst_dob_mux_b0/al_mux_b0_0_5  (
    .i0(inst_dob_i10_000),
    .i1(inst_dob_i11_000),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b0/B0_5 ));
  AL_MUX \inst_dob_mux_b0/al_mux_b0_0_6  (
    .i0(inst_dob_i12_000),
    .i1(inst_dob_i13_000),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b0/B0_6 ));
  AL_MUX \inst_dob_mux_b0/al_mux_b0_0_7  (
    .i0(inst_dob_i14_000),
    .i1(inst_dob_i15_000),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b0/B0_7 ));
  AL_MUX \inst_dob_mux_b0/al_mux_b0_1_0  (
    .i0(\inst_dob_mux_b0/B0_0 ),
    .i1(\inst_dob_mux_b0/B0_1 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b0/B1_0 ));
  AL_MUX \inst_dob_mux_b0/al_mux_b0_1_1  (
    .i0(\inst_dob_mux_b0/B0_2 ),
    .i1(\inst_dob_mux_b0/B0_3 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b0/B1_1 ));
  AL_MUX \inst_dob_mux_b0/al_mux_b0_1_2  (
    .i0(\inst_dob_mux_b0/B0_4 ),
    .i1(\inst_dob_mux_b0/B0_5 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b0/B1_2 ));
  AL_MUX \inst_dob_mux_b0/al_mux_b0_1_3  (
    .i0(\inst_dob_mux_b0/B0_6 ),
    .i1(\inst_dob_mux_b0/B0_7 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b0/B1_3 ));
  AL_MUX \inst_dob_mux_b0/al_mux_b0_2_0  (
    .i0(\inst_dob_mux_b0/B1_0 ),
    .i1(\inst_dob_mux_b0/B1_1 ),
    .sel(addrb_piped[2]),
    .o(\inst_dob_mux_b0/B2_0 ));
  AL_MUX \inst_dob_mux_b0/al_mux_b0_2_1  (
    .i0(\inst_dob_mux_b0/B1_2 ),
    .i1(\inst_dob_mux_b0/B1_3 ),
    .sel(addrb_piped[2]),
    .o(\inst_dob_mux_b0/B2_1 ));
  AL_MUX \inst_dob_mux_b0/al_mux_b0_3_0  (
    .i0(\inst_dob_mux_b0/B2_0 ),
    .i1(\inst_dob_mux_b0/B2_1 ),
    .sel(addrb_piped[3]),
    .o(dob[0]));
  AL_MUX \inst_dob_mux_b1/al_mux_b0_0_0  (
    .i0(inst_dob_i0_001),
    .i1(inst_dob_i1_001),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b1/B0_0 ));
  AL_MUX \inst_dob_mux_b1/al_mux_b0_0_1  (
    .i0(inst_dob_i2_001),
    .i1(inst_dob_i3_001),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b1/B0_1 ));
  AL_MUX \inst_dob_mux_b1/al_mux_b0_0_2  (
    .i0(inst_dob_i4_001),
    .i1(inst_dob_i5_001),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b1/B0_2 ));
  AL_MUX \inst_dob_mux_b1/al_mux_b0_0_3  (
    .i0(inst_dob_i6_001),
    .i1(inst_dob_i7_001),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b1/B0_3 ));
  AL_MUX \inst_dob_mux_b1/al_mux_b0_0_4  (
    .i0(inst_dob_i8_001),
    .i1(inst_dob_i9_001),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b1/B0_4 ));
  AL_MUX \inst_dob_mux_b1/al_mux_b0_0_5  (
    .i0(inst_dob_i10_001),
    .i1(inst_dob_i11_001),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b1/B0_5 ));
  AL_MUX \inst_dob_mux_b1/al_mux_b0_0_6  (
    .i0(inst_dob_i12_001),
    .i1(inst_dob_i13_001),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b1/B0_6 ));
  AL_MUX \inst_dob_mux_b1/al_mux_b0_0_7  (
    .i0(inst_dob_i14_001),
    .i1(inst_dob_i15_001),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b1/B0_7 ));
  AL_MUX \inst_dob_mux_b1/al_mux_b0_1_0  (
    .i0(\inst_dob_mux_b1/B0_0 ),
    .i1(\inst_dob_mux_b1/B0_1 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b1/B1_0 ));
  AL_MUX \inst_dob_mux_b1/al_mux_b0_1_1  (
    .i0(\inst_dob_mux_b1/B0_2 ),
    .i1(\inst_dob_mux_b1/B0_3 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b1/B1_1 ));
  AL_MUX \inst_dob_mux_b1/al_mux_b0_1_2  (
    .i0(\inst_dob_mux_b1/B0_4 ),
    .i1(\inst_dob_mux_b1/B0_5 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b1/B1_2 ));
  AL_MUX \inst_dob_mux_b1/al_mux_b0_1_3  (
    .i0(\inst_dob_mux_b1/B0_6 ),
    .i1(\inst_dob_mux_b1/B0_7 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b1/B1_3 ));
  AL_MUX \inst_dob_mux_b1/al_mux_b0_2_0  (
    .i0(\inst_dob_mux_b1/B1_0 ),
    .i1(\inst_dob_mux_b1/B1_1 ),
    .sel(addrb_piped[2]),
    .o(\inst_dob_mux_b1/B2_0 ));
  AL_MUX \inst_dob_mux_b1/al_mux_b0_2_1  (
    .i0(\inst_dob_mux_b1/B1_2 ),
    .i1(\inst_dob_mux_b1/B1_3 ),
    .sel(addrb_piped[2]),
    .o(\inst_dob_mux_b1/B2_1 ));
  AL_MUX \inst_dob_mux_b1/al_mux_b0_3_0  (
    .i0(\inst_dob_mux_b1/B2_0 ),
    .i1(\inst_dob_mux_b1/B2_1 ),
    .sel(addrb_piped[3]),
    .o(dob[1]));
  AL_MUX \inst_dob_mux_b2/al_mux_b0_0_0  (
    .i0(inst_dob_i0_002),
    .i1(inst_dob_i1_002),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b2/B0_0 ));
  AL_MUX \inst_dob_mux_b2/al_mux_b0_0_1  (
    .i0(inst_dob_i2_002),
    .i1(inst_dob_i3_002),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b2/B0_1 ));
  AL_MUX \inst_dob_mux_b2/al_mux_b0_0_2  (
    .i0(inst_dob_i4_002),
    .i1(inst_dob_i5_002),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b2/B0_2 ));
  AL_MUX \inst_dob_mux_b2/al_mux_b0_0_3  (
    .i0(inst_dob_i6_002),
    .i1(inst_dob_i7_002),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b2/B0_3 ));
  AL_MUX \inst_dob_mux_b2/al_mux_b0_0_4  (
    .i0(inst_dob_i8_002),
    .i1(inst_dob_i9_002),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b2/B0_4 ));
  AL_MUX \inst_dob_mux_b2/al_mux_b0_0_5  (
    .i0(inst_dob_i10_002),
    .i1(inst_dob_i11_002),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b2/B0_5 ));
  AL_MUX \inst_dob_mux_b2/al_mux_b0_0_6  (
    .i0(inst_dob_i12_002),
    .i1(inst_dob_i13_002),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b2/B0_6 ));
  AL_MUX \inst_dob_mux_b2/al_mux_b0_0_7  (
    .i0(inst_dob_i14_002),
    .i1(inst_dob_i15_002),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b2/B0_7 ));
  AL_MUX \inst_dob_mux_b2/al_mux_b0_1_0  (
    .i0(\inst_dob_mux_b2/B0_0 ),
    .i1(\inst_dob_mux_b2/B0_1 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b2/B1_0 ));
  AL_MUX \inst_dob_mux_b2/al_mux_b0_1_1  (
    .i0(\inst_dob_mux_b2/B0_2 ),
    .i1(\inst_dob_mux_b2/B0_3 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b2/B1_1 ));
  AL_MUX \inst_dob_mux_b2/al_mux_b0_1_2  (
    .i0(\inst_dob_mux_b2/B0_4 ),
    .i1(\inst_dob_mux_b2/B0_5 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b2/B1_2 ));
  AL_MUX \inst_dob_mux_b2/al_mux_b0_1_3  (
    .i0(\inst_dob_mux_b2/B0_6 ),
    .i1(\inst_dob_mux_b2/B0_7 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b2/B1_3 ));
  AL_MUX \inst_dob_mux_b2/al_mux_b0_2_0  (
    .i0(\inst_dob_mux_b2/B1_0 ),
    .i1(\inst_dob_mux_b2/B1_1 ),
    .sel(addrb_piped[2]),
    .o(\inst_dob_mux_b2/B2_0 ));
  AL_MUX \inst_dob_mux_b2/al_mux_b0_2_1  (
    .i0(\inst_dob_mux_b2/B1_2 ),
    .i1(\inst_dob_mux_b2/B1_3 ),
    .sel(addrb_piped[2]),
    .o(\inst_dob_mux_b2/B2_1 ));
  AL_MUX \inst_dob_mux_b2/al_mux_b0_3_0  (
    .i0(\inst_dob_mux_b2/B2_0 ),
    .i1(\inst_dob_mux_b2/B2_1 ),
    .sel(addrb_piped[3]),
    .o(dob[2]));
  AL_MUX \inst_dob_mux_b3/al_mux_b0_0_0  (
    .i0(inst_dob_i0_003),
    .i1(inst_dob_i1_003),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b3/B0_0 ));
  AL_MUX \inst_dob_mux_b3/al_mux_b0_0_1  (
    .i0(inst_dob_i2_003),
    .i1(inst_dob_i3_003),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b3/B0_1 ));
  AL_MUX \inst_dob_mux_b3/al_mux_b0_0_2  (
    .i0(inst_dob_i4_003),
    .i1(inst_dob_i5_003),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b3/B0_2 ));
  AL_MUX \inst_dob_mux_b3/al_mux_b0_0_3  (
    .i0(inst_dob_i6_003),
    .i1(inst_dob_i7_003),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b3/B0_3 ));
  AL_MUX \inst_dob_mux_b3/al_mux_b0_0_4  (
    .i0(inst_dob_i8_003),
    .i1(inst_dob_i9_003),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b3/B0_4 ));
  AL_MUX \inst_dob_mux_b3/al_mux_b0_0_5  (
    .i0(inst_dob_i10_003),
    .i1(inst_dob_i11_003),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b3/B0_5 ));
  AL_MUX \inst_dob_mux_b3/al_mux_b0_0_6  (
    .i0(inst_dob_i12_003),
    .i1(inst_dob_i13_003),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b3/B0_6 ));
  AL_MUX \inst_dob_mux_b3/al_mux_b0_0_7  (
    .i0(inst_dob_i14_003),
    .i1(inst_dob_i15_003),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b3/B0_7 ));
  AL_MUX \inst_dob_mux_b3/al_mux_b0_1_0  (
    .i0(\inst_dob_mux_b3/B0_0 ),
    .i1(\inst_dob_mux_b3/B0_1 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b3/B1_0 ));
  AL_MUX \inst_dob_mux_b3/al_mux_b0_1_1  (
    .i0(\inst_dob_mux_b3/B0_2 ),
    .i1(\inst_dob_mux_b3/B0_3 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b3/B1_1 ));
  AL_MUX \inst_dob_mux_b3/al_mux_b0_1_2  (
    .i0(\inst_dob_mux_b3/B0_4 ),
    .i1(\inst_dob_mux_b3/B0_5 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b3/B1_2 ));
  AL_MUX \inst_dob_mux_b3/al_mux_b0_1_3  (
    .i0(\inst_dob_mux_b3/B0_6 ),
    .i1(\inst_dob_mux_b3/B0_7 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b3/B1_3 ));
  AL_MUX \inst_dob_mux_b3/al_mux_b0_2_0  (
    .i0(\inst_dob_mux_b3/B1_0 ),
    .i1(\inst_dob_mux_b3/B1_1 ),
    .sel(addrb_piped[2]),
    .o(\inst_dob_mux_b3/B2_0 ));
  AL_MUX \inst_dob_mux_b3/al_mux_b0_2_1  (
    .i0(\inst_dob_mux_b3/B1_2 ),
    .i1(\inst_dob_mux_b3/B1_3 ),
    .sel(addrb_piped[2]),
    .o(\inst_dob_mux_b3/B2_1 ));
  AL_MUX \inst_dob_mux_b3/al_mux_b0_3_0  (
    .i0(\inst_dob_mux_b3/B2_0 ),
    .i1(\inst_dob_mux_b3/B2_1 ),
    .sel(addrb_piped[3]),
    .o(dob[3]));
  AL_MUX \inst_dob_mux_b4/al_mux_b0_0_0  (
    .i0(inst_dob_i0_004),
    .i1(inst_dob_i1_004),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b4/B0_0 ));
  AL_MUX \inst_dob_mux_b4/al_mux_b0_0_1  (
    .i0(inst_dob_i2_004),
    .i1(inst_dob_i3_004),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b4/B0_1 ));
  AL_MUX \inst_dob_mux_b4/al_mux_b0_0_2  (
    .i0(inst_dob_i4_004),
    .i1(inst_dob_i5_004),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b4/B0_2 ));
  AL_MUX \inst_dob_mux_b4/al_mux_b0_0_3  (
    .i0(inst_dob_i6_004),
    .i1(inst_dob_i7_004),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b4/B0_3 ));
  AL_MUX \inst_dob_mux_b4/al_mux_b0_0_4  (
    .i0(inst_dob_i8_004),
    .i1(inst_dob_i9_004),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b4/B0_4 ));
  AL_MUX \inst_dob_mux_b4/al_mux_b0_0_5  (
    .i0(inst_dob_i10_004),
    .i1(inst_dob_i11_004),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b4/B0_5 ));
  AL_MUX \inst_dob_mux_b4/al_mux_b0_0_6  (
    .i0(inst_dob_i12_004),
    .i1(inst_dob_i13_004),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b4/B0_6 ));
  AL_MUX \inst_dob_mux_b4/al_mux_b0_0_7  (
    .i0(inst_dob_i14_004),
    .i1(inst_dob_i15_004),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b4/B0_7 ));
  AL_MUX \inst_dob_mux_b4/al_mux_b0_1_0  (
    .i0(\inst_dob_mux_b4/B0_0 ),
    .i1(\inst_dob_mux_b4/B0_1 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b4/B1_0 ));
  AL_MUX \inst_dob_mux_b4/al_mux_b0_1_1  (
    .i0(\inst_dob_mux_b4/B0_2 ),
    .i1(\inst_dob_mux_b4/B0_3 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b4/B1_1 ));
  AL_MUX \inst_dob_mux_b4/al_mux_b0_1_2  (
    .i0(\inst_dob_mux_b4/B0_4 ),
    .i1(\inst_dob_mux_b4/B0_5 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b4/B1_2 ));
  AL_MUX \inst_dob_mux_b4/al_mux_b0_1_3  (
    .i0(\inst_dob_mux_b4/B0_6 ),
    .i1(\inst_dob_mux_b4/B0_7 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b4/B1_3 ));
  AL_MUX \inst_dob_mux_b4/al_mux_b0_2_0  (
    .i0(\inst_dob_mux_b4/B1_0 ),
    .i1(\inst_dob_mux_b4/B1_1 ),
    .sel(addrb_piped[2]),
    .o(\inst_dob_mux_b4/B2_0 ));
  AL_MUX \inst_dob_mux_b4/al_mux_b0_2_1  (
    .i0(\inst_dob_mux_b4/B1_2 ),
    .i1(\inst_dob_mux_b4/B1_3 ),
    .sel(addrb_piped[2]),
    .o(\inst_dob_mux_b4/B2_1 ));
  AL_MUX \inst_dob_mux_b4/al_mux_b0_3_0  (
    .i0(\inst_dob_mux_b4/B2_0 ),
    .i1(\inst_dob_mux_b4/B2_1 ),
    .sel(addrb_piped[3]),
    .o(dob[4]));
  AL_MUX \inst_dob_mux_b5/al_mux_b0_0_0  (
    .i0(inst_dob_i0_005),
    .i1(inst_dob_i1_005),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b5/B0_0 ));
  AL_MUX \inst_dob_mux_b5/al_mux_b0_0_1  (
    .i0(inst_dob_i2_005),
    .i1(inst_dob_i3_005),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b5/B0_1 ));
  AL_MUX \inst_dob_mux_b5/al_mux_b0_0_2  (
    .i0(inst_dob_i4_005),
    .i1(inst_dob_i5_005),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b5/B0_2 ));
  AL_MUX \inst_dob_mux_b5/al_mux_b0_0_3  (
    .i0(inst_dob_i6_005),
    .i1(inst_dob_i7_005),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b5/B0_3 ));
  AL_MUX \inst_dob_mux_b5/al_mux_b0_0_4  (
    .i0(inst_dob_i8_005),
    .i1(inst_dob_i9_005),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b5/B0_4 ));
  AL_MUX \inst_dob_mux_b5/al_mux_b0_0_5  (
    .i0(inst_dob_i10_005),
    .i1(inst_dob_i11_005),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b5/B0_5 ));
  AL_MUX \inst_dob_mux_b5/al_mux_b0_0_6  (
    .i0(inst_dob_i12_005),
    .i1(inst_dob_i13_005),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b5/B0_6 ));
  AL_MUX \inst_dob_mux_b5/al_mux_b0_0_7  (
    .i0(inst_dob_i14_005),
    .i1(inst_dob_i15_005),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b5/B0_7 ));
  AL_MUX \inst_dob_mux_b5/al_mux_b0_1_0  (
    .i0(\inst_dob_mux_b5/B0_0 ),
    .i1(\inst_dob_mux_b5/B0_1 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b5/B1_0 ));
  AL_MUX \inst_dob_mux_b5/al_mux_b0_1_1  (
    .i0(\inst_dob_mux_b5/B0_2 ),
    .i1(\inst_dob_mux_b5/B0_3 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b5/B1_1 ));
  AL_MUX \inst_dob_mux_b5/al_mux_b0_1_2  (
    .i0(\inst_dob_mux_b5/B0_4 ),
    .i1(\inst_dob_mux_b5/B0_5 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b5/B1_2 ));
  AL_MUX \inst_dob_mux_b5/al_mux_b0_1_3  (
    .i0(\inst_dob_mux_b5/B0_6 ),
    .i1(\inst_dob_mux_b5/B0_7 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b5/B1_3 ));
  AL_MUX \inst_dob_mux_b5/al_mux_b0_2_0  (
    .i0(\inst_dob_mux_b5/B1_0 ),
    .i1(\inst_dob_mux_b5/B1_1 ),
    .sel(addrb_piped[2]),
    .o(\inst_dob_mux_b5/B2_0 ));
  AL_MUX \inst_dob_mux_b5/al_mux_b0_2_1  (
    .i0(\inst_dob_mux_b5/B1_2 ),
    .i1(\inst_dob_mux_b5/B1_3 ),
    .sel(addrb_piped[2]),
    .o(\inst_dob_mux_b5/B2_1 ));
  AL_MUX \inst_dob_mux_b5/al_mux_b0_3_0  (
    .i0(\inst_dob_mux_b5/B2_0 ),
    .i1(\inst_dob_mux_b5/B2_1 ),
    .sel(addrb_piped[3]),
    .o(dob[5]));
  AL_MUX \inst_dob_mux_b6/al_mux_b0_0_0  (
    .i0(inst_dob_i0_006),
    .i1(inst_dob_i1_006),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b6/B0_0 ));
  AL_MUX \inst_dob_mux_b6/al_mux_b0_0_1  (
    .i0(inst_dob_i2_006),
    .i1(inst_dob_i3_006),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b6/B0_1 ));
  AL_MUX \inst_dob_mux_b6/al_mux_b0_0_2  (
    .i0(inst_dob_i4_006),
    .i1(inst_dob_i5_006),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b6/B0_2 ));
  AL_MUX \inst_dob_mux_b6/al_mux_b0_0_3  (
    .i0(inst_dob_i6_006),
    .i1(inst_dob_i7_006),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b6/B0_3 ));
  AL_MUX \inst_dob_mux_b6/al_mux_b0_0_4  (
    .i0(inst_dob_i8_006),
    .i1(inst_dob_i9_006),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b6/B0_4 ));
  AL_MUX \inst_dob_mux_b6/al_mux_b0_0_5  (
    .i0(inst_dob_i10_006),
    .i1(inst_dob_i11_006),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b6/B0_5 ));
  AL_MUX \inst_dob_mux_b6/al_mux_b0_0_6  (
    .i0(inst_dob_i12_006),
    .i1(inst_dob_i13_006),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b6/B0_6 ));
  AL_MUX \inst_dob_mux_b6/al_mux_b0_0_7  (
    .i0(inst_dob_i14_006),
    .i1(inst_dob_i15_006),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b6/B0_7 ));
  AL_MUX \inst_dob_mux_b6/al_mux_b0_1_0  (
    .i0(\inst_dob_mux_b6/B0_0 ),
    .i1(\inst_dob_mux_b6/B0_1 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b6/B1_0 ));
  AL_MUX \inst_dob_mux_b6/al_mux_b0_1_1  (
    .i0(\inst_dob_mux_b6/B0_2 ),
    .i1(\inst_dob_mux_b6/B0_3 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b6/B1_1 ));
  AL_MUX \inst_dob_mux_b6/al_mux_b0_1_2  (
    .i0(\inst_dob_mux_b6/B0_4 ),
    .i1(\inst_dob_mux_b6/B0_5 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b6/B1_2 ));
  AL_MUX \inst_dob_mux_b6/al_mux_b0_1_3  (
    .i0(\inst_dob_mux_b6/B0_6 ),
    .i1(\inst_dob_mux_b6/B0_7 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b6/B1_3 ));
  AL_MUX \inst_dob_mux_b6/al_mux_b0_2_0  (
    .i0(\inst_dob_mux_b6/B1_0 ),
    .i1(\inst_dob_mux_b6/B1_1 ),
    .sel(addrb_piped[2]),
    .o(\inst_dob_mux_b6/B2_0 ));
  AL_MUX \inst_dob_mux_b6/al_mux_b0_2_1  (
    .i0(\inst_dob_mux_b6/B1_2 ),
    .i1(\inst_dob_mux_b6/B1_3 ),
    .sel(addrb_piped[2]),
    .o(\inst_dob_mux_b6/B2_1 ));
  AL_MUX \inst_dob_mux_b6/al_mux_b0_3_0  (
    .i0(\inst_dob_mux_b6/B2_0 ),
    .i1(\inst_dob_mux_b6/B2_1 ),
    .sel(addrb_piped[3]),
    .o(dob[6]));
  AL_MUX \inst_dob_mux_b7/al_mux_b0_0_0  (
    .i0(inst_dob_i0_007),
    .i1(inst_dob_i1_007),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b7/B0_0 ));
  AL_MUX \inst_dob_mux_b7/al_mux_b0_0_1  (
    .i0(inst_dob_i2_007),
    .i1(inst_dob_i3_007),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b7/B0_1 ));
  AL_MUX \inst_dob_mux_b7/al_mux_b0_0_2  (
    .i0(inst_dob_i4_007),
    .i1(inst_dob_i5_007),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b7/B0_2 ));
  AL_MUX \inst_dob_mux_b7/al_mux_b0_0_3  (
    .i0(inst_dob_i6_007),
    .i1(inst_dob_i7_007),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b7/B0_3 ));
  AL_MUX \inst_dob_mux_b7/al_mux_b0_0_4  (
    .i0(inst_dob_i8_007),
    .i1(inst_dob_i9_007),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b7/B0_4 ));
  AL_MUX \inst_dob_mux_b7/al_mux_b0_0_5  (
    .i0(inst_dob_i10_007),
    .i1(inst_dob_i11_007),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b7/B0_5 ));
  AL_MUX \inst_dob_mux_b7/al_mux_b0_0_6  (
    .i0(inst_dob_i12_007),
    .i1(inst_dob_i13_007),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b7/B0_6 ));
  AL_MUX \inst_dob_mux_b7/al_mux_b0_0_7  (
    .i0(inst_dob_i14_007),
    .i1(inst_dob_i15_007),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b7/B0_7 ));
  AL_MUX \inst_dob_mux_b7/al_mux_b0_1_0  (
    .i0(\inst_dob_mux_b7/B0_0 ),
    .i1(\inst_dob_mux_b7/B0_1 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b7/B1_0 ));
  AL_MUX \inst_dob_mux_b7/al_mux_b0_1_1  (
    .i0(\inst_dob_mux_b7/B0_2 ),
    .i1(\inst_dob_mux_b7/B0_3 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b7/B1_1 ));
  AL_MUX \inst_dob_mux_b7/al_mux_b0_1_2  (
    .i0(\inst_dob_mux_b7/B0_4 ),
    .i1(\inst_dob_mux_b7/B0_5 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b7/B1_2 ));
  AL_MUX \inst_dob_mux_b7/al_mux_b0_1_3  (
    .i0(\inst_dob_mux_b7/B0_6 ),
    .i1(\inst_dob_mux_b7/B0_7 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b7/B1_3 ));
  AL_MUX \inst_dob_mux_b7/al_mux_b0_2_0  (
    .i0(\inst_dob_mux_b7/B1_0 ),
    .i1(\inst_dob_mux_b7/B1_1 ),
    .sel(addrb_piped[2]),
    .o(\inst_dob_mux_b7/B2_0 ));
  AL_MUX \inst_dob_mux_b7/al_mux_b0_2_1  (
    .i0(\inst_dob_mux_b7/B1_2 ),
    .i1(\inst_dob_mux_b7/B1_3 ),
    .sel(addrb_piped[2]),
    .o(\inst_dob_mux_b7/B2_1 ));
  AL_MUX \inst_dob_mux_b7/al_mux_b0_3_0  (
    .i0(\inst_dob_mux_b7/B2_0 ),
    .i1(\inst_dob_mux_b7/B2_1 ),
    .sel(addrb_piped[3]),
    .o(dob[7]));
  AL_MUX \inst_dob_mux_b8/al_mux_b0_0_0  (
    .i0(inst_dob_i0_008),
    .i1(inst_dob_i1_008),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b8/B0_0 ));
  AL_MUX \inst_dob_mux_b8/al_mux_b0_0_1  (
    .i0(inst_dob_i2_008),
    .i1(inst_dob_i3_008),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b8/B0_1 ));
  AL_MUX \inst_dob_mux_b8/al_mux_b0_0_2  (
    .i0(inst_dob_i4_008),
    .i1(inst_dob_i5_008),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b8/B0_2 ));
  AL_MUX \inst_dob_mux_b8/al_mux_b0_0_3  (
    .i0(inst_dob_i6_008),
    .i1(inst_dob_i7_008),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b8/B0_3 ));
  AL_MUX \inst_dob_mux_b8/al_mux_b0_0_4  (
    .i0(inst_dob_i8_008),
    .i1(inst_dob_i9_008),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b8/B0_4 ));
  AL_MUX \inst_dob_mux_b8/al_mux_b0_0_5  (
    .i0(inst_dob_i10_008),
    .i1(inst_dob_i11_008),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b8/B0_5 ));
  AL_MUX \inst_dob_mux_b8/al_mux_b0_0_6  (
    .i0(inst_dob_i12_008),
    .i1(inst_dob_i13_008),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b8/B0_6 ));
  AL_MUX \inst_dob_mux_b8/al_mux_b0_0_7  (
    .i0(inst_dob_i14_008),
    .i1(inst_dob_i15_008),
    .sel(addrb_piped[0]),
    .o(\inst_dob_mux_b8/B0_7 ));
  AL_MUX \inst_dob_mux_b8/al_mux_b0_1_0  (
    .i0(\inst_dob_mux_b8/B0_0 ),
    .i1(\inst_dob_mux_b8/B0_1 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b8/B1_0 ));
  AL_MUX \inst_dob_mux_b8/al_mux_b0_1_1  (
    .i0(\inst_dob_mux_b8/B0_2 ),
    .i1(\inst_dob_mux_b8/B0_3 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b8/B1_1 ));
  AL_MUX \inst_dob_mux_b8/al_mux_b0_1_2  (
    .i0(\inst_dob_mux_b8/B0_4 ),
    .i1(\inst_dob_mux_b8/B0_5 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b8/B1_2 ));
  AL_MUX \inst_dob_mux_b8/al_mux_b0_1_3  (
    .i0(\inst_dob_mux_b8/B0_6 ),
    .i1(\inst_dob_mux_b8/B0_7 ),
    .sel(addrb_piped[1]),
    .o(\inst_dob_mux_b8/B1_3 ));
  AL_MUX \inst_dob_mux_b8/al_mux_b0_2_0  (
    .i0(\inst_dob_mux_b8/B1_0 ),
    .i1(\inst_dob_mux_b8/B1_1 ),
    .sel(addrb_piped[2]),
    .o(\inst_dob_mux_b8/B2_0 ));
  AL_MUX \inst_dob_mux_b8/al_mux_b0_2_1  (
    .i0(\inst_dob_mux_b8/B1_2 ),
    .i1(\inst_dob_mux_b8/B1_3 ),
    .sel(addrb_piped[2]),
    .o(\inst_dob_mux_b8/B2_1 ));
  AL_MUX \inst_dob_mux_b8/al_mux_b0_3_0  (
    .i0(\inst_dob_mux_b8/B2_0 ),
    .i1(\inst_dob_mux_b8/B2_1 ),
    .sel(addrb_piped[3]),
    .o(dob[8]));
  not wea_inv (wea_neg, wea);
  not web_inv (web_neg, web);

endmodule 

module reg_sr_as_w1
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input d;
  input en;
  input reset;
  input set;
  output q;

  parameter REGSET = "RESET";
  wire enout;
  wire resetout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_MUX u_reset0 (
    .i0(enout),
    .i1(1'b0),
    .sel(reset),
    .o(resetout));
  AL_DFF #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(resetout),
    .reset(1'b0),
    .set(set),
    .q(q));

endmodule 

module AL_MUX
  (
  input i0,
  input i1,
  input sel,
  output o
  );

  wire not_sel, sel_i0, sel_i1;
  not u0 (not_sel, sel);
  and u1 (sel_i1, sel, i1);
  and u2 (sel_i0, not_sel, i0);
  or u3 (o, sel_i1, sel_i0);

endmodule

module AL_DFF
  (
  input reset,
  input set,
  input clk,
  input d,
  output reg q
  );

  parameter INI = 1'b0;

  tri0 gsrn = glbl.gsrn;

  always @(gsrn)
  begin
    if(!gsrn)
      assign q = INI;
    else
      deassign q;
  end

  always @(posedge reset or posedge set or posedge clk)
  begin
    if (reset)
      q <= 1'b0;
    else if (set)
      q <= 1'b1;
    else
      q <= d;
  end

endmodule

