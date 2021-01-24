//-------------------------------------------------------------------------
//                                                                       --
//                                                                       --
//      For use with ECE 385 Lab 8                                       --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module lab8 (

      ///////// Clocks /////////
      input              Clk,

      ///////// KEY /////////
      input    [ 1: 0]   KEY,

      ///////// SW /////////
      input    [ 9: 0]   SW,

      ///////// LEDR /////////
      output   [ 9: 0]   LEDR,

      ///////// HEX /////////
      output   [ 7: 0]   HEX0,
      output   [ 7: 0]   HEX1,
      output   [ 7: 0]   HEX2,
      output   [ 7: 0]   HEX3,
      output   [ 7: 0]   HEX4,
      output   [ 7: 0]   HEX5,

      ///////// SDRAM /////////
      output             DRAM_CLK,
      output             DRAM_CKE,
      output   [12: 0]   DRAM_ADDR,
      output   [ 1: 0]   DRAM_BA,
      inout    [15: 0]   DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_UDQM,
      output             DRAM_CS_N,
      output             DRAM_WE_N,
      output             DRAM_CAS_N,
      output             DRAM_RAS_N,

      ///////// VGA /////////
      output             VGA_HS,
      output             VGA_VS,
      output   [ 3: 0]   VGA_R,
      output   [ 3: 0]   VGA_G,
      output   [ 3: 0]   VGA_B,


      ///////// ARDUINO /////////
      inout    [15: 0]   ARDUINO_IO,
      inout              ARDUINO_RESET_N 

);




logic Reset_h, vssig, blank, sync, VGA_Clk;


//=======================================================
//  REG/WIRE declarations
//=======================================================
	logic SPI0_CS_N, SPI0_SCLK, SPI0_MISO, SPI0_MOSI, USB_GPX, USB_IRQ, USB_RST;
	logic [3:0] hex_num_4, hex_num_3, hex_num_1, hex_num_0; //4 bit input hex digits
	logic [1:0] signs;
	logic [1:0] hundreds;
	logic [9:0] drawxsig, drawysig, drop1xsig, drop1ysig, drop2xsig, drop2ysig, drop3xsig, drop3ysig, drop4xsig, drop4ysig, drop5xsig, drop5ysig, drop6xsig, drop6ysig, drop7xsig, drop7ysig, drop8xsig, drop8ysig, drop9xsig, drop9ysig, drop10xsig, drop10ysig, drop11xsig, drop11ysig, drop12xsig, drop12ysig;
	logic [9:0] drop13xsig,drop13ysig,drop14xsig,drop14ysig,drop15xsig,drop15ysig,drop16xsig,drop16ysig,drop17xsig,drop17ysig,drop18xsig,drop18ysig,drop19xsig,drop19ysig,drop20xsig,drop20ysig,drop21xsig,drop21ysig,drop22xsig,drop22ysig,drop23xsig,drop23ysig;
	logic [9:0] drop24xsig,drop24ysig,drop25xsig,drop25ysig,drop26xsig,drop26ysig,drop27xsig,drop27ysig,drop28xsig,drop28ysig,drop29xsig,drop29ysig,drop30xsig,drop30ysig,drop31xsig,drop31ysig,drop32xsig,drop32ysig,drop33xsig,drop33ysig,drop34xsig,drop34ysig,drop35xsig,drop35ysig;
	logic [9:0] drop36xsig,drop36ysig,drop37xsig,drop37ysig,drop38xsig,drop38ysig,drop39xsig,drop39ysig,drop40xsig,drop40ysig,drop41xsig,drop41ysig,drop42xsig,drop42ysig,drop43xsig,drop43ysig,drop44xsig,drop44ysig,drop45xsig,drop45ysig,drop46xsig,drop46ysig;
	
	logic [9:0] drop1xsig_1, drop1ysig_1, drop2xsig_1, drop2ysig_1, drop3xsig_1, drop3ysig_1, drop4xsig_1, drop4ysig_1, drop5xsig_1, drop5ysig_1, drop6xsig_1, drop6ysig_1, drop7xsig_1, drop7ysig_1, drop8xsig_1, drop8ysig_1, drop9xsig_1, drop9ysig_1, drop10xsig_1, drop10ysig_1, drop11xsig_1, drop11ysig_1, drop12xsig_1, drop12ysig_1;
	logic [9:0] drop13xsig_1,drop13ysig_1,drop14xsig_1,drop14ysig_1,drop15xsig_1,drop15ysig_1,drop16xsig_1,drop16ysig_1,drop17xsig_1,drop17ysig_1,drop18xsig_1,drop18ysig_1,drop19xsig_1,drop19ysig_1,drop20xsig_1,drop20ysig_1,drop21xsig_1,drop21ysig_1,drop22xsig_1,drop22ysig_1,drop23xsig_1,drop23ysig_1;
	logic [9:0] drop24xsig_1,drop24ysig_1,drop25xsig_1,drop25ysig_1,drop26xsig_1,drop26ysig_1,drop27xsig_1,drop27ysig_1,drop28xsig_1,drop28ysig_1,drop29xsig_1,drop29ysig_1,drop30xsig_1,drop30ysig_1,drop31xsig_1,drop31ysig_1,drop32xsig_1,drop32ysig_1,drop33xsig_1,drop33ysig_1,drop34xsig_1,drop34ysig_1,drop35xsig_1,drop35ysig_1;
	logic [9:0] drop36xsig_1,drop36ysig_1,drop37xsig_1,drop37ysig_1,drop38xsig_1,drop38ysig_1,drop39xsig_1,drop39ysig_1,drop40xsig_1,drop40ysig_1,drop41xsig_1,drop41ysig_1,drop42xsig_1,drop42ysig_1,drop43xsig_1,drop43ysig_1,drop44xsig_1,drop44ysig_1,drop45xsig_1,drop45ysig_1,drop46xsig_1,drop46ysig_1;
	logic [7:0] Red, Blue, Green;
	logic [7:0] keycode, keycode_second;
	logic [17249:0] pika_color;
	logic [1599:0] arrow1, arrow2, arrow3, arrow4, arrow5, arrow6, arrow7, arrow8, arrow9, arrow10, arrow11, arrow12;
	logic [1599:0] arrow13, arrow14, arrow15, arrow16, arrow17, arrow18, arrow19, arrow20, arrow21, arrow22, arrow23;
	logic [1599:0] arrow24, arrow25, arrow26, arrow27, arrow28, arrow29, arrow30, arrow31, arrow32, arrow33, arrow34, arrow35;
	logic [1599:0] arrow36, arrow37, arrow38, arrow39, arrow40, arrow41, arrow42, arrow43, arrow44, arrow45, arrow46;
	
	logic [1599:0] arrow1_1, arrow2_1, arrow3_1, arrow4_1, arrow5_1, arrow6_1, arrow7_1, arrow8_1, arrow9_1, arrow10_1, arrow11_1, arrow12_1;
	logic [1599:0] arrow13_1, arrow14_1, arrow15_1, arrow16_1, arrow17_1, arrow18_1, arrow19_1, arrow20_1, arrow21_1, arrow22_1, arrow23_1;
	logic [1599:0] arrow24_1, arrow25_1, arrow26_1, arrow27_1, arrow28_1, arrow29_1, arrow30_1, arrow31_1, arrow32_1, arrow33_1, arrow34_1, arrow35_1;
	logic [1599:0] arrow36_1, arrow37_1, arrow38_1, arrow39_1, arrow40_1, arrow41_1, arrow42_1, arrow43_1, arrow44_1, arrow45_1, arrow46_1;
	
	logic score1, score2,score3, score4,score5,score6, score7, score8, score9, score10, score11,score12,score13,score14,score15;
	logic score16,score17,score18,score19,score20,score21,score22,score23,score24,score25, score26,score27,score28,score29,score30;
	logic score31,score32,score33,score34,score35,score36,score37,score38,score39,score40,score41,score42,score43, score44,score45,score46;
	
	logic score1_1, score2_1,score3_1, score4_1,score5_1,score6_1, score7_1, score8_1, score9_1, score10_1, score11_1,score12_1,score13_1,score14_1,score15_1;
	logic score16_1,score17_1,score18_1,score19_1,score20_1,score21_1,score22_1,score23_1,score24_1,score25_1, score26_1,score27_1,score28_1,score29_1,score30_1;
	logic score31_1,score32_1,score33_1,score34_1,score35_1,score36_1,score37_1,score38_1,score39_1,score40_1,score41_1,score42_1,score43_1, score44_1,score45_1,score46_1;
	
	logic [7:0] total_Score, total_Score_1;
	logic [20999:0] startscreen;
	logic [1374:0] score_bar_left;
	logic [349:0] cur1_color, cur2_color;
	
//=======================================================
//  Structural coding
//=======================================================
	assign ARDUINO_IO[10] = SPI0_CS_N;
	assign ARDUINO_IO[13] = SPI0_SCLK;
	assign ARDUINO_IO[11] = SPI0_MOSI;
	assign ARDUINO_IO[12] = 1'bZ;
	assign SPI0_MISO = ARDUINO_IO[12];
	
	assign ARDUINO_IO[9] = 1'bZ; 
	assign USB_IRQ = ARDUINO_IO[9];
		
	//Assignments specific to Circuits At Home UHS_20
	assign ARDUINO_RESET_N = USB_RST;
	assign ARDUINO_IO[7] = USB_RST;//USB reset 
	assign ARDUINO_IO[8] = 1'bZ; //this is GPX (set to input)
	assign USB_GPX = 1'b0;//GPX is not needed for standard USB host - set to 0 to prevent interrupt
	
	//Assign uSD CS to '1' to prevent uSD card from interfering with USB Host (if uSD card is plugged in)
	assign ARDUINO_IO[6] = 1'b1;
	//HEX drivers to convert numbers to HEX output
	HexDriver hex_driver4 (total_Score[7:4], HEX4[6:0]);
	assign HEX4[7] = 1'b1; 
	
	HexDriver hex_driver3 (total_Score[3:0], HEX3[6:0]);
	assign HEX3[7] = 1'b1;
	
	HexDriver hex_driver1 (total_Score[7:4], HEX1[6:0]);
	assign HEX1[7] = 1'b1;
	
	HexDriver hex_driver0 (total_Score[3:0], HEX0[6:0]);
	assign HEX0[7] = 1'b1;
	
	//fill in the hundreds digit as well as the negative sign
	assign HEX5 = {1'b1, ~signs[1], 3'b111, ~hundreds[1], ~hundreds[1], 1'b1};
	assign HEX2 = {1'b1, ~signs[0], 3'b111, ~hundreds[0], ~hundreds[0], 1'b1};
	
	
	//Assign one button to reset
	assign {Reset_h}=~ (KEY[0]);

	//Our A/D converter is only 12 bit
	assign VGA_R = Red[7:4];
	assign VGA_B = Blue[7:4];
	assign VGA_G = Green[7:4];
	
	assign scl_in = ARDUINO_IO[15];
	assign ARDUINO_IO[15] = scl_out ? 1'b0:1'bz;
	
	assign sda_in = ARDUINO_IO[14];
	assign ARDUINO_IO[14] = sda_out ? 1'b0:1'bz;
	
	logic [1:0] aud_mclk_ctr;
	assign ARDUINO_IO[3] = aud_mclk_ctr[1];
	//generate 12.5MHz CODEC mclk
	always_ff @ (posedge Clk)
	begin
		aud_mclk_ctr <= aud_mclk_ctr +1;
	end
	
	
	lab8_soc u0 (
		.clk_clk                           (Clk),            //clk.clk
		.reset_reset_n                     (1'b1),           //reset.reset_n
		.altpll_0_locked_conduit_export    (),               //altpll_0_locked_conduit.export
		.altpll_0_phasedone_conduit_export (),               //altpll_0_phasedone_conduit.export
		.altpll_0_areset_conduit_export    (),               //altpll_0_areset_conduit.export
		.key_external_connection_export    (KEY),            //key_external_connection.export

		//SDRAM
		.clk_sdram_clk(DRAM_CLK),                            //clk_sdram.clk
		.sdram_wire_addr(DRAM_ADDR),                         //sdram_wire.addr
		.sdram_wire_ba(DRAM_BA),                             //.ba
		.sdram_wire_cas_n(DRAM_CAS_N),                       //.cas_n
		.sdram_wire_cke(DRAM_CKE),                           //.cke
		.sdram_wire_cs_n(DRAM_CS_N),                         //.cs_n
		.sdram_wire_dq(DRAM_DQ),                             //.dq
		.sdram_wire_dqm({DRAM_UDQM,DRAM_LDQM}),              //.dqm
		.sdram_wire_ras_n(DRAM_RAS_N),                       //.ras_n
		.sdram_wire_we_n(DRAM_WE_N),                         //.we_n

		//USB SPI	
		.spi0_SS_n(SPI0_CS_N),
		.spi0_MOSI(SPI0_MOSI),
		.spi0_MISO(SPI0_MISO),
		.spi0_SCLK(SPI0_SCLK),
		
		//USB GPIO
		.usb_rst_export(USB_RST),
		.usb_irq_export(USB_IRQ),
		.usb_gpx_export(USB_GPX),
		
		//LEDs and HEX
		.hex_digits_export({hex_num_4, hex_num_3, hex_num_1, hex_num_0}),
		.leds_export({hundreds, signs, LEDR}),
		.keycode_export(keycode),
		
		.key_two_external_connection_export(keycode_second),
		.temp2_sda_in(sda_in),		
		.temp2_scl_in(scl_in),         
		.temp2_sda_oe(sda_out),              
		.temp2_scl_oe(scl_out)
		
	 );


//instantiate a vga_controller, ball, and color_mapper here with the ports.
curr_score cur1(.total_Score(total_Score[7:0]), .Reset(Reset_h), .frame_clk(VGA_VS), .cur1_color(cur1_color));
curr_score_ten cur2(.total_Score(total_Score[7:0]), .Reset(Reset_h), .frame_clk(VGA_VS), .cur2_color(cur2_color));

vga_controller vga_c1(.keycode(keycode),.Clk(Clk), .Reset(Reset_h), .hs(VGA_HS), .vs(VGA_VS), .pixel_clk(VGA_Clk), .blank(blank), .sync(sync), .DrawX(drawxsig), .DrawY(drawysig));
pika pika1(.keycode(keycode),.Reset(Reset_h), .frame_clk(VGA_VS), .pika_color(pika_color));
left_Score left1(.Reset(Reset_h), .frame_clk(VGA_VS), .score_bar_left(score_bar_left));
start_screen_text_display text_d1(.keycode(keycode),.Reset(Reset_h), .frame_clk(VGA_VS), .startscreen(startscreen));
color_mapper color_m1(
.drop46X_1(drop46xsig_1), .drop46Y_1(drop46ysig_1), .arrow46_1(arrow46_1),.drop45X_1(drop45xsig_1), .drop45Y_1(drop45ysig_1), .arrow45_1(arrow45_1),.drop44X_1(drop44xsig_1),
.drop44Y_1(drop44ysig_1), .arrow44_1(arrow44_1),.drop43X_1(drop43xsig_1), .drop43Y_1(drop43ysig_1), .arrow43_1(arrow43_1),.drop42X_1(drop42xsig_1), .drop42Y_1(drop42ysig_1), 
.arrow42_1(arrow42_1),.drop41X_1(drop41xsig_1), .drop41Y_1(drop41ysig_1), .arrow41_1(arrow41_1),.drop40X_1(drop40xsig_1), .drop40Y_1(drop40ysig_1), .arrow40_1(arrow40_1),
.drop39X_1(drop39xsig_1), .drop39Y_1(drop39ysig_1), .arrow39_1(arrow39_1),.drop38X_1(drop38xsig_1), .drop38Y_1(drop38ysig_1), .arrow38_1(arrow38_1),.drop37X_1(drop37xsig_1), 
.drop37Y_1(drop37ysig_1), .arrow37_1(arrow37_1),.drop36X_1(drop36xsig_1), .drop36Y_1(drop36ysig_1), .arrow36_1(arrow36_1),.drop35X_1(drop35xsig_1), .drop35Y_1(drop35ysig_1), 
.arrow35_1(arrow35_1),.drop34X_1(drop34xsig_1), .drop34Y_1(drop34ysig_1), .arrow34_1(arrow34_1),.drop33X_1(drop33xsig_1), .drop33Y_1(drop33ysig_1), .arrow33_1(arrow33_1),
.drop32X_1(drop32xsig_1), .drop32Y_1(drop32ysig_1), .arrow32_1(arrow32_1),.drop31X_1(drop31xsig_1), .drop31Y_1(drop31ysig_1), .arrow31_1(arrow31_1),.drop30X_1(drop30xsig_1), 
.drop30Y_1(drop30ysig_1), .arrow30_1(arrow30_1), .drop29X_1(drop29xsig_1), .drop29Y_1(drop29ysig_1), .arrow29_1(arrow29_1), .drop28X_1(drop28xsig_1), .drop28Y_1(drop28ysig_1), 
.arrow28_1(arrow28_1), .drop27X_1(drop27xsig_1), .drop27Y_1(drop27ysig_1), .arrow27_1(arrow27_1), .drop26X_1(drop26xsig_1), .drop26Y_1(drop26ysig_1), .arrow26_1(arrow26_1), 
.drop25X_1(drop25xsig_1), .drop25Y_1(drop25ysig_1), .arrow25_1(arrow25_1), .drop24X_1(drop24xsig_1), .drop24Y_1(drop24ysig_1), .arrow24_1(arrow24_1), .drop23X_1(drop23xsig_1), 
.drop23Y_1(drop23ysig_1), .arrow23_1(arrow23_1), .drop22X_1(drop22xsig_1), .drop22Y_1(drop22ysig_1), .arrow22_1(arrow22_1), .drop21X_1(drop21xsig_1), .drop21Y_1(drop21ysig_1), 
.arrow21_1(arrow21_1), .drop20X_1(drop20xsig_1), .drop20Y_1(drop20ysig_1), .arrow20_1(arrow20_1), .drop19X_1(drop19xsig_1), .drop19Y_1(drop19ysig_1), .arrow19_1(arrow19_1), 
.drop18X_1(drop18xsig_1), .drop18Y_1(drop18ysig_1), .arrow18_1(arrow18_1), .drop17X_1(drop17xsig_1), .drop17Y_1(drop17ysig_1), .arrow17_1(arrow17_1), .drop16X_1(drop16xsig_1),
.drop16Y_1(drop16ysig_1), .arrow16_1(arrow16_1), .drop15X_1(drop15xsig_1), .drop15Y_1(drop15ysig_1), .arrow15_1(arrow15_1), .drop14X_1(drop14xsig_1), .drop14Y_1(drop14ysig_1), 
.arrow14_1(arrow14_1), .drop13X_1(drop13xsig_1), .drop13Y_1(drop13ysig_1), .arrow13_1(arrow13_1), .drop12X_1(drop12xsig_1), .drop12Y_1(drop12ysig_1), .arrow12_1(arrow12_1), 
.drop11X_1(drop11xsig_1), .drop11Y_1(drop11ysig_1), .arrow11_1(arrow11_1), .drop10X_1(drop10xsig_1), .drop10Y_1(drop10ysig_1), .arrow10_1(arrow10_1), .drop9X_1(drop9xsig_1), 
.drop9Y_1(drop9ysig_1), .arrow9_1(arrow9_1), .drop8X_1(drop8xsig_1), .drop8Y_1(drop8ysig_1), .arrow8_1(arrow8_1), .drop7X_1(drop7xsig_1), .drop7Y_1(drop7ysig_1), .arrow7_1(arrow7_1),
.drop6X_1(drop6xsig_1), .drop6Y_1(drop6ysig_1), .arrow6_1(arrow6_1), .drop5X_1(drop5xsig_1), .drop5Y_1(drop5ysig_1), .arrow5_1(arrow5_1), .drop4X_1(drop4xsig_1), .drop4Y_1(drop4ysig_1), 
.arrow4_1(arrow4_1), .drop3X_1(drop3xsig_1), .drop3Y_1(drop3ysig_1), .arrow3_1(arrow3_1), .drop2X_1(drop2xsig_1), .drop2Y_1(drop2ysig_1), .arrow2_1(arrow2_1), .arrow1_1(arrow1_1), 
.drop1X_1(drop1xsig_1), .drop1Y_1(drop1ysig_1), 

.cur2_color(cur2_color), .cur1_color(cur1_color), .score_bar_left(score_bar_left), .startscreen(startscreen),.drop46X(drop46xsig), .drop46Y(drop46ysig), .arrow46(arrow46),.drop45X(drop45xsig), .drop45Y(drop45ysig), .arrow45(arrow45),.drop44X(drop44xsig), .drop44Y(drop44ysig), .arrow44(arrow44),.drop43X(drop43xsig), .drop43Y(drop43ysig), .arrow43(arrow43),.drop42X(drop42xsig), .drop42Y(drop42ysig), .arrow42(arrow42),.drop41X(drop41xsig), .drop41Y(drop41ysig), .arrow41(arrow41),.drop40X(drop40xsig), .drop40Y(drop40ysig), .arrow40(arrow40),.drop39X(drop39xsig), .drop39Y(drop39ysig), .arrow39(arrow39),.drop38X(drop38xsig), .drop38Y(drop38ysig), .arrow38(arrow38),.drop37X(drop37xsig), .drop37Y(drop37ysig), .arrow37(arrow37),.drop36X(drop36xsig), .drop36Y(drop36ysig), .arrow36(arrow36),.drop35X(drop35xsig), .drop35Y(drop35ysig), .arrow35(arrow35),.drop34X(drop34xsig), .drop34Y(drop34ysig), .arrow34(arrow34),.drop33X(drop33xsig), .drop33Y(drop33ysig), .arrow33(arrow33),.drop32X(drop32xsig), .drop32Y(drop32ysig), .arrow32(arrow32),.drop31X(drop31xsig), .drop31Y(drop31ysig), .arrow31(arrow31),.drop30X(drop30xsig), .drop30Y(drop30ysig), .arrow30(arrow30), .drop29X(drop29xsig), .drop29Y(drop29ysig), .arrow29(arrow29), .drop28X(drop28xsig), .drop28Y(drop28ysig), .arrow28(arrow28), .drop27X(drop27xsig), .drop27Y(drop27ysig), .arrow27(arrow27), .drop26X(drop26xsig), .drop26Y(drop26ysig), .arrow26(arrow26), .drop25X(drop25xsig), .drop25Y(drop25ysig), .arrow25(arrow25), .drop24X(drop24xsig), .drop24Y(drop24ysig), .arrow24(arrow24), .drop23X(drop23xsig), .drop23Y(drop23ysig), .arrow23(arrow23), .drop22X(drop22xsig), .drop22Y(drop22ysig), .arrow22(arrow22), .drop21X(drop21xsig), .drop21Y(drop21ysig), .arrow21(arrow21), .drop20X(drop20xsig), .drop20Y(drop20ysig), .arrow20(arrow20), .drop19X(drop19xsig), .drop19Y(drop19ysig), .arrow19(arrow19), .drop18X(drop18xsig), .drop18Y(drop18ysig), .arrow18(arrow18), .drop17X(drop17xsig), .drop17Y(drop17ysig), .arrow17(arrow17), .drop16X(drop16xsig), .drop16Y(drop16ysig), .arrow16(arrow16), .drop15X(drop15xsig), .drop15Y(drop15ysig), .arrow15(arrow15), .drop14X(drop14xsig), .drop14Y(drop14ysig), .arrow14(arrow14), .drop13X(drop13xsig), .drop13Y(drop13ysig), .arrow13(arrow13), .drop12X(drop12xsig), .drop12Y(drop12ysig), .arrow12(arrow12), .drop11X(drop11xsig), .drop11Y(drop11ysig), .arrow11(arrow11), .drop10X(drop10xsig), .drop10Y(drop10ysig), .arrow10(arrow10), .drop9X(drop9xsig), .drop9Y(drop9ysig), .arrow9(arrow9), .drop8X(drop8xsig), .drop8Y(drop8ysig), .arrow8(arrow8), .drop7X(drop7xsig), .drop7Y(drop7ysig), .arrow7(arrow7), .drop6X(drop6xsig), .drop6Y(drop6ysig), .arrow6(arrow6), .drop5X(drop5xsig), .drop5Y(drop5ysig), .arrow5(arrow5), .drop4X(drop4xsig), .drop4Y(drop4ysig), .arrow4(arrow4), .drop3X(drop3xsig), .drop3Y(drop3ysig), .arrow3(arrow3), .drop2X(drop2xsig), .drop2Y(drop2ysig), .arrow2(arrow2), .arrow1(arrow1), .drop1X(drop1xsig), .drop1Y(drop1ysig), .pika_color(pika_color), .DrawX(drawxsig), .DrawY(drawysig), .Red(Red), .Green(Green), .Blue(Blue)
);
dropper_one drop1(.keycode_second(keycode_second), .score1(score1), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop1X(drop1xsig), .drop1Y(drop1ysig), .arrow1(arrow1));
dropper_two drop2(.keycode_second(keycode_second), .score2(score2), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop2X(drop2xsig), .drop2Y(drop2ysig), .arrow2(arrow2));
dropper_three drop3(.keycode_second(keycode_second), .score3(score3), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop3X(drop3xsig), .drop3Y(drop3ysig), .arrow3(arrow3));
dropper_four drop4(.keycode_second(keycode_second), .score4(score4), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop4X(drop4xsig), .drop4Y(drop4ysig), .arrow4(arrow4));
dropper_five drop5(.keycode_second(keycode_second), .score5(score5), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop5X(drop5xsig), .drop5Y(drop5ysig), .arrow5(arrow5));
dropper_six drop6(.keycode_second(keycode_second), .score6(score6), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop6X(drop6xsig), .drop6Y(drop6ysig), .arrow6(arrow6));
dropper_seven drop7(.keycode_second(keycode_second), .score7(score7), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop7X(drop7xsig), .drop7Y(drop7ysig), .arrow7(arrow7));
dropper_eight drop8(.keycode_second(keycode_second), .score8(score8), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop8X(drop8xsig), .drop8Y(drop8ysig), .arrow8(arrow8));
dropper_nine drop9(.keycode_second(keycode_second), .score9(score9), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop9X(drop9xsig), .drop9Y(drop9ysig), .arrow9(arrow9));
dropper_ten drop10(.keycode_second(keycode_second), .score10(score10), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop10X(drop10xsig), .drop10Y(drop10ysig), .arrow10(arrow10));
dropper_eleven drop11(.keycode_second(keycode_second), .score11(score11), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop11X(drop11xsig), .drop11Y(drop11ysig), .arrow11(arrow11));
dropper_twelve drop12(.keycode_second(keycode_second), .score12(score12), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop12X(drop12xsig), .drop12Y(drop12ysig), .arrow12(arrow12));
dropper_thirteen drop13(.keycode_second(keycode_second), .score13(score13), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop13X(drop13xsig), .drop13Y(drop13ysig), .arrow13(arrow13));
dropper_fourteen drop14(.keycode_second(keycode_second), .score14(score14), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop14X(drop14xsig), .drop14Y(drop14ysig), .arrow14(arrow14));
dropper_fifteen drop15(.keycode_second(keycode_second), .score15(score15), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop15X(drop15xsig), .drop15Y(drop15ysig), .arrow15(arrow15));
dropper_sixteen drop16(.keycode_second(keycode_second), .score16(score16), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop16X(drop16xsig), .drop16Y(drop16ysig), .arrow16(arrow16));
dropper_seventeen drop17(.keycode_second(keycode_second), .score17(score17), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop17X(drop17xsig), .drop17Y(drop17ysig), .arrow17(arrow17));
dropper_eighteen drop18(.keycode_second(keycode_second), .score18(score18), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop18X(drop18xsig), .drop18Y(drop18ysig), .arrow18(arrow18));
dropper_nineteen drop19(.keycode_second(keycode_second), .score19(score19), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop19X(drop19xsig), .drop19Y(drop19ysig), .arrow19(arrow19));
dropper_twenty drop20(.keycode_second(keycode_second), .score20(score20), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop20X(drop20xsig), .drop20Y(drop20ysig), .arrow20(arrow20));
dropper_twenty_one drop21(.keycode_second(keycode_second), .score21(score21),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop21X(drop21xsig), .drop21Y(drop21ysig), .arrow21(arrow21));
dropper_twenty_two drop22(.keycode_second(keycode_second), .score22(score22),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop22X(drop22xsig), .drop22Y(drop22ysig), .arrow22(arrow22));
dropper_twenty_three drop23(.keycode_second(keycode_second), .score23(score23),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop23X(drop23xsig), .drop23Y(drop23ysig), .arrow23(arrow23));
dropper_twenty_four drop24(.keycode_second(keycode_second), .score24(score24),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop24X(drop24xsig), .drop24Y(drop24ysig), .arrow24(arrow24));
dropper_twenty_five drop25(.keycode_second(keycode_second), .score25(score25),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop25X(drop25xsig), .drop25Y(drop25ysig), .arrow25(arrow25));
dropper_twenty_six drop26(.keycode_second(keycode_second), .score26(score26),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop26X(drop26xsig), .drop26Y(drop26ysig), .arrow26(arrow26));
dropper_twenty_seven drop27(.keycode_second(keycode_second), .score27(score27),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop27X(drop27xsig), .drop27Y(drop27ysig), .arrow27(arrow27));
dropper_twenty_eight drop28(.keycode_second(keycode_second), .score28(score28),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop28X(drop28xsig), .drop28Y(drop28ysig), .arrow28(arrow28));
dropper_twenty_nine drop29(.keycode_second(keycode_second), .score29(score29),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop29X(drop29xsig), .drop29Y(drop29ysig), .arrow29(arrow29));
dropper_thirty drop30(.keycode_second(keycode_second), .score30(score30),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop30X(drop30xsig), .drop30Y(drop30ysig), .arrow30(arrow30));
dropper_thirty_one drop31(.keycode_second(keycode_second), .score31(score31),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop31X(drop31xsig), .drop31Y(drop31ysig), .arrow31(arrow31));
dropper_thirty_two drop32(.keycode_second(keycode_second), .score32(score32),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop32X(drop32xsig), .drop32Y(drop32ysig), .arrow32(arrow32));
dropper_thirty_three drop33(.keycode_second(keycode_second), .score33(score33),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop33X(drop33xsig), .drop33Y(drop33ysig), .arrow33(arrow33));
dropper_thirty_four drop34(.keycode_second(keycode_second), .score34(score34),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop34X(drop34xsig), .drop34Y(drop34ysig), .arrow34(arrow34));
dropper_thirty_five drop35(.keycode_second(keycode_second), .score35(score35),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop35X(drop35xsig), .drop35Y(drop35ysig), .arrow35(arrow35));
dropper_thirty_six drop36(.keycode_second(keycode_second), .score36(score36),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop36X(drop36xsig), .drop36Y(drop36ysig), .arrow36(arrow36));
dropper_thirty_seven drop37(.keycode_second(keycode_second), .score37(score37),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop37X(drop37xsig), .drop37Y(drop37ysig), .arrow37(arrow37));
dropper_thirty_eight drop38(.keycode_second(keycode_second), .score38(score38),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop38X(drop38xsig), .drop38Y(drop38ysig), .arrow38(arrow38));
dropper_thirty_nine drop39(.keycode_second(keycode_second), .score39(score39),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop39X(drop39xsig), .drop39Y(drop39ysig), .arrow39(arrow39));
dropper_forty drop40(.keycode_second(keycode_second), .score40(score40),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop40X(drop40xsig), .drop40Y(drop40ysig), .arrow40(arrow40));
dropper_forty_one drop41(.keycode_second(keycode_second), .score41(score41),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop41X(drop41xsig), .drop41Y(drop41ysig), .arrow41(arrow41));
dropper_forty_two drop42(.keycode_second(keycode_second), .score42(score42),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop42X(drop42xsig), .drop42Y(drop42ysig), .arrow42(arrow42));
dropper_forty_three drop43(.keycode_second(keycode_second), .score43(score43),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop43X(drop43xsig), .drop43Y(drop43ysig), .arrow43(arrow43));
dropper_forty_four drop44(.keycode_second(keycode_second), .score44(score44),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop44X(drop44xsig), .drop44Y(drop44ysig), .arrow44(arrow44));
dropper_forty_five drop45(.keycode_second(keycode_second), .score45(score45),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop45X(drop45xsig), .drop45Y(drop45ysig), .arrow45(arrow45));
dropper_forty_six drop46(.keycode_second(keycode_second), .score46(score46),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop46X(drop46xsig), .drop46Y(drop46ysig), .arrow46(arrow46));
sum_score sum1(.Reset(Reset_h), .frame_clk(VGA_VS), .score1(score1), .score2(score2),.score3(score3), .score4(score4),.score5(score5),.score6(score6), .total_Score(total_Score), .score7(score7), .score8(score8), .score9(score9), .score10(score10), .score11(score11),.score12(score12),.score13(score13),.score14(score14),.score15(score15), .score16(score16),.score17(score17),.score18(score18),.score19(score19),.score20(score20),.score21(score21),.score22(score22),.score23(score23),.score24(score24),.score25(score25), .score26(score26),.score27(score27),.score28(score28),.score29(score29),.score30(score30),.score31(score31),.score32(score32),.score33(score33),.score34(score34),.score35(score35),.score36(score36),.score37(score37),.score38(score38),.score39(score39),.score40(score40),.score41(score41),.score42(score42),.score43(score43), .score44(score44),.score45(score45),.score46(score46));

dropper_one1 drop1_1(.keycode_second(keycode_second), .score1(score1_1), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop1X(drop1xsig_1), .drop1Y(drop1ysig_1), .arrow1(arrow1_1));
dropper_two2 drop2_1(.keycode_second(keycode_second), .score2(score2_1), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop2X(drop2xsig_1), .drop2Y(drop2ysig_1), .arrow2(arrow2_1));
dropper_three3 drop3_1(.keycode_second(keycode_second), .score3(score3_1), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop3X(drop3xsig_1), .drop3Y(drop3ysig_1), .arrow3(arrow3_1));
dropper_four4 drop4_1(.keycode_second(keycode_second), .score4(score4_1), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop4X(drop4xsig_1), .drop4Y(drop4ysig_1), .arrow4(arrow4_1));
dropper_five5 drop5_1(.keycode_second(keycode_second), .score5(score5_1), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop5X(drop5xsig_1), .drop5Y(drop5ysig_1), .arrow5(arrow5_1));
dropper_six6 drop6_1(.keycode_second(keycode_second), .score6(score6_1), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop6X(drop6xsig_1), .drop6Y(drop6ysig_1), .arrow6(arrow6_1));
dropper_seven7 drop7_1(.keycode_second(keycode_second), .score7(score7_1), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop7X(drop7xsig_1), .drop7Y(drop7ysig_1), .arrow7(arrow7_1));
dropper_eight8 drop8_1(.keycode_second(keycode_second), .score8(score8_1), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop8X(drop8xsig_1), .drop8Y(drop8ysig_1), .arrow8(arrow8_1));
dropper_nine9 drop9_1(.keycode_second(keycode_second), .score9(score9_1), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop9X(drop9xsig_1), .drop9Y(drop9ysig_1), .arrow9(arrow9_1));
dropper_ten10 drop10_1(.keycode_second(keycode_second), .score10(score10_1), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop10X(drop10xsig_1), .drop10Y(drop10ysig_1), .arrow10(arrow10_1));
dropper_eleven11 drop11_1(.keycode_second(keycode_second), .score11(score11_1), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop11X(drop11xsig_1), .drop11Y(drop11ysig_1), .arrow11(arrow11_1));
dropper_twelve12 drop12_1(.keycode_second(keycode_second), .score12(score12_1), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop12X(drop12xsig_1), .drop12Y(drop12ysig_1), .arrow12(arrow12_1));
dropper_thirteen13 drop13_1(.keycode_second(keycode_second), .score13(score13_1), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop13X(drop13xsig_1), .drop13Y(drop13ysig_1), .arrow13(arrow13_1));
dropper_fourteen14 drop14_1(.keycode_second(keycode_second), .score14(score14_1), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop14X(drop14xsig_1), .drop14Y(drop14ysig_1), .arrow14(arrow14_1));
dropper_fifteen15 drop15_1(.keycode_second(keycode_second), .score15(score15_1), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop15X(drop15xsig_1), .drop15Y(drop15ysig_1), .arrow15(arrow15_1));
dropper_sixteen16 drop16_1(.keycode_second(keycode_second), .score16(score16_1), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop16X(drop16xsig_1), .drop16Y(drop16ysig_1), .arrow16(arrow16_1));
dropper_seventeen17 drop17_1(.keycode_second(keycode_second), .score17(score17_1), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop17X(drop17xsig_1), .drop17Y(drop17ysig_1), .arrow17(arrow17_1));
dropper_eighteen18 drop18_1(.keycode_second(keycode_second), .score18(score18_1), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop18X(drop18xsig_1), .drop18Y(drop18ysig_1), .arrow18(arrow18_1));
dropper_nineteen19 drop19_1(.keycode_second(keycode_second), .score19(score19_1), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop19X(drop19xsig_1), .drop19Y(drop19ysig_1), .arrow19(arrow19_1));
dropper_twenty20 drop20_1(.keycode_second(keycode_second), .score20(score20_1), .keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop20X(drop20xsig_1), .drop20Y(drop20ysig_1), .arrow20(arrow20_1));
dropper_twenty_one21 drop21_1(.keycode_second(keycode_second), .score21(score21_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop21X(drop21xsig_1), .drop21Y(drop21ysig_1), .arrow21(arrow21_1));
dropper_twenty_two22 drop22_1(.keycode_second(keycode_second), .score22(score22_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop22X(drop22xsig_1), .drop22Y(drop22ysig_1), .arrow22(arrow22_1));
dropper_twenty_three23 drop23_1(.keycode_second(keycode_second), .score23(score23_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop23X(drop23xsig_1), .drop23Y(drop23ysig_1), .arrow23(arrow23_1));
dropper_twenty_four24 drop24_1(.keycode_second(keycode_second), .score24(score24_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop24X(drop24xsig_1), .drop24Y(drop24ysig_1), .arrow24(arrow24_1));
dropper_twenty_five25 drop25_1(.keycode_second(keycode_second), .score25(score25_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop25X(drop25xsig_1), .drop25Y(drop25ysig_1), .arrow25(arrow25_1));
dropper_twenty_six26 drop26_1(.keycode_second(keycode_second), .score26(score26_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop26X(drop26xsig_1), .drop26Y(drop26ysig_1), .arrow26(arrow26_1));
dropper_twenty_seven27 drop27_1(.keycode_second(keycode_second), .score27(score27_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop27X(drop27xsig_1), .drop27Y(drop27ysig_1), .arrow27(arrow27_1));
dropper_twenty_eight28 drop28_1(.keycode_second(keycode_second), .score28(score28_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop28X(drop28xsig_1), .drop28Y(drop28ysig_1), .arrow28(arrow28_1));
dropper_twenty_nine29 drop29_1(.keycode_second(keycode_second), .score29(score29_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop29X(drop29xsig_1), .drop29Y(drop29ysig_1), .arrow29(arrow29_1));
dropper_thirty30 drop30_1(.keycode_second(keycode_second), .score30(score30_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop30X(drop30xsig_1), .drop30Y(drop30ysig_1), .arrow30(arrow30_1));
dropper_thirty_one31 drop31_1(.keycode_second(keycode_second), .score31(score31_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop31X(drop31xsig_1), .drop31Y(drop31ysig_1), .arrow31(arrow31_1));
dropper_thirty_two32 drop32_1(.keycode_second(keycode_second), .score32(score32_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop32X(drop32xsig_1), .drop32Y(drop32ysig_1), .arrow32(arrow32_1));
dropper_thirty_three33 drop33_1(.keycode_second(keycode_second), .score33(score33_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop33X(drop33xsig_1), .drop33Y(drop33ysig_1), .arrow33(arrow33_1));
dropper_thirty_four34 drop34_1(.keycode_second(keycode_second), .score34(score34_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop34X(drop34xsig_1), .drop34Y(drop34ysig_1), .arrow34(arrow34_1));
dropper_thirty_five35 drop35_1(.keycode_second(keycode_second), .score35(score35_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop35X(drop35xsig_1), .drop35Y(drop35ysig_1), .arrow35(arrow35_1));
dropper_thirty_six36 drop36_1(.keycode_second(keycode_second), .score36(score36_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop36X(drop36xsig_1), .drop36Y(drop36ysig_1), .arrow36(arrow36_1));
dropper_thirty_seven37 drop37_1(.keycode_second(keycode_second), .score37(score37_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop37X(drop37xsig_1), .drop37Y(drop37ysig_1), .arrow37(arrow37_1));
dropper_thirty_eight38 drop38_1(.keycode_second(keycode_second), .score38(score38_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop38X(drop38xsig_1), .drop38Y(drop38ysig_1), .arrow38(arrow38_1));
dropper_thirty_nine39 drop39_1(.keycode_second(keycode_second), .score39(score39_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop39X(drop39xsig_1), .drop39Y(drop39ysig_1), .arrow39(arrow39_1));
dropper_forty40 drop40_1(.keycode_second(keycode_second), .score40(score40_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop40X(drop40xsig_1), .drop40Y(drop40ysig_1), .arrow40(arrow40_1));
dropper_forty_one41 drop41_1(.keycode_second(keycode_second), .score41(score41_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop41X(drop41xsig_1), .drop41Y(drop41ysig_1), .arrow41(arrow41_1));
dropper_forty_two42 drop42_1(.keycode_second(keycode_second), .score42(score42_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop42X(drop42xsig_1), .drop42Y(drop42ysig_1), .arrow42(arrow42_1));
dropper_forty_three43 drop43_1(.keycode_second(keycode_second), .score43(score43_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop43X(drop43xsig_1), .drop43Y(drop43ysig_1), .arrow43(arrow43_1));
dropper_forty_four44 drop44_1(.keycode_second(keycode_second), .score44(score44_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop44X(drop44xsig_1), .drop44Y(drop44ysig_1), .arrow44(arrow44_1));
dropper_forty_five45 drop45_1(.keycode_second(keycode_second), .score45(score45_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop45X(drop45xsig_1), .drop45Y(drop45ysig_1), .arrow45(arrow45_1));
dropper_forty_six46 drop46_1(.keycode_second(keycode_second), .score46(score46_1),.keycode(keycode), .Reset(Reset_h), .frame_clk(VGA_VS), .drop46X(drop46xsig_1), .drop46Y(drop46ysig_1), .arrow46(arrow46_1));
sum_score sum2(.Reset(Reset_h), .frame_clk(VGA_VS), .score1(score1_1), .score2(score2_1),.score3(score3_1), .score4(score4_1),.score5(score5_1),.score6(score6_1), .total_Score(total_Score_1), .score7(score7_1), .score8(score8_1), .score9(score9_1), .score10(score10_1), .score11(score11_1),.score12(score12_1),.score13(score13_1),.score14(score14_1),.score15(score15_1), .score16(score16_1),.score17(score17_1),.score18(score18_1),.score19(score19_1),.score20(score20_1),.score21(score21_1),.score22(score22_1),.score23(score23_1),.score24(score24_1),.score25(score25_1), .score26(score26_1),.score27(score27_1),.score28(score28_1),.score29(score29_1),.score30(score30_1),.score31(score31_1),.score32(score32_1),.score33(score33_1),.score34(score34_1),.score35(score35_1),.score36(score36_1),.score37(score37_1),.score38(score38_1),.score39(score39_1),.score40(score40_1),.score41(score41_1),.score42(score42_1),.score43(score43_1), .score44(score44_1),.score45(score45_1),.score46(score46_1));

endmodule
