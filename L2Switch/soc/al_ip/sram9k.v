/************************************************************\
 **  Copyright (c) 2011-2021 Anlogic, Inc.
 **  All Right Reserved.
\************************************************************/
/************************************************************\
 ** Log	:	This file is generated by Anlogic IP Generator.
 ** File	:	C:/Users/splas/tinyEtherDeveloper/FPGA_project/picorv32/picosoc/al_ip/sram9k.v
 ** Date	:	2022 08 13
 ** TD version	:	4.4.433
\************************************************************/

`timescale 1ns / 1ps

module sram9k ( doa, dia, addra, clka, wea, rsta );

	output [31:0] doa;

	input  [31:0] dia;
	input  [11:0] addra;
	input  [3:0] wea;
	input  clka;
	input  rsta;




	EG_LOGIC_BRAM #( .DATA_WIDTH_A(32),
				.ADDR_WIDTH_A(12),
				.DATA_DEPTH_A(4096),
				.DATA_WIDTH_B(32),
				.ADDR_WIDTH_B(12),
				.DATA_DEPTH_B(4096),
				.BYTE_ENABLE(8),
				.BYTE_A(4),
				.BYTE_B(4),
				.MODE("SP"),
				.REGMODE_A("NOREG"),
				.WRITEMODE_A("NORMAL"),
				.RESETMODE("SYNC"),
				.IMPLEMENT("9K"),
				.DEBUGGABLE("NO"),
				.PACKABLE("NO"),
				.INIT_FILE("../../memory/rom.mif"),
				.FILL_ALL("NONE"))
			inst(
				.dia(dia),
				.dib({32{1'b0}}),
				.addra(addra),
				.addrb({12{1'b0}}),
				.cea(1'b1),
				.ceb(1'b0),
				.ocea(1'b0),
				.oceb(1'b0),
				.clka(clka),
				.clkb(1'b0),
				.wea(1'b0),
				.bea(wea),
				.web(1'b0),
				.rsta(rsta),
				.rstb(1'b0),
				.doa(doa),
				.dob());


endmodule