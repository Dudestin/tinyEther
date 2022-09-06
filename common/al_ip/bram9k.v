/* used in FRAME_FIFO.v to implement PORT_FIFO */

/************************************************************\
 **  Copyright (c) 2011-2021 Anlogic, Inc.
 **  All Right Reserved.
\************************************************************/
/************************************************************\
 ** Log	:	This file is generated by Anlogic IP Generator.
 ** File	:	C:/Users/splas/tinyEtherDeveloper/FPGA_project/L2Switch/al_ip/bram9k.v
 ** Date	:	2022 07 27
 ** TD version	:	4.4.433
\************************************************************/

`timescale 1ns / 1ps

module bram9k ( 
	doa, dia, addra, clka, wea, rsta, 
	dob, dib, addrb, clkb, web, rstb
);

	output [0:0] doa;
	output [0:0] dob;


	input  [0:0] dia;
	input  [0:0] dib;
	input  [12:0] addra;
	input  [12:0] addrb;
	input  wea;
	input  web;
	input  clka;
	input  clkb;
	input  rsta;
	input  rstb;




	EG_LOGIC_BRAM #( .DATA_WIDTH_A(1),
				.DATA_WIDTH_B(1),
				.ADDR_WIDTH_A(13),
				.ADDR_WIDTH_B(13),
				.DATA_DEPTH_A(8192),
				.DATA_DEPTH_B(8192),
				.MODE("DP"),
				.REGMODE_A("NOREG"),
				.REGMODE_B("NOREG"),
				.WRITEMODE_A("NORMAL"),
				.WRITEMODE_B("NORMAL"),
				.RESETMODE("SYNC"),
				.IMPLEMENT("9K"),
				.INIT_FILE("NONE"),
				.FILL_ALL("0"))
			inst(
				.dia(dia),
				.dib(dib),
				.addra(addra),
				.addrb(addrb),
				.cea(1'b1),
				.ceb(1'b1),
				.ocea(1'b0),
				.oceb(1'b0),
				.clka(clka),
				.clkb(clkb),
				.wea(wea),
				.web(web),
				.bea(1'b0),
				.beb(1'b0),
				.rsta(rsta),
				.rstb(rstb),
				.doa(doa),
				.dob(dob));


endmodule
