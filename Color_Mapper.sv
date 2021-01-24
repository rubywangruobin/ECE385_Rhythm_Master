//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input        [9:0] DrawX, DrawY, drop1X, drop1Y, drop2X, drop2Y, drop3X, drop3Y, drop4X, drop4Y, drop5X, drop5Y, drop6X, drop6Y,drop7X, drop7Y,drop8X, drop8Y,drop9X, drop9Y,drop10X, drop10Y,drop11X, drop11Y,drop12X, drop12Y,
							  input        [9:0] drop13X, drop13Y,drop14X, drop14Y,drop15X, drop15Y,drop16X, drop16Y,drop17X, drop17Y,drop18X, drop18Y,drop19X, drop19Y,drop20X, drop20Y,drop21X, drop21Y,drop22X, drop22Y,drop23X, drop23Y,
							  input        [9:0] drop24X, drop24Y,drop25X, drop25Y,drop26X, drop26Y,drop27X, drop27Y,drop28X, drop28Y,drop29X, drop29Y,drop30X, drop30Y,drop31X, drop31Y,drop32X, drop32Y,drop33X, drop33Y,drop34X, drop34Y,drop35X, drop35Y,
							  input        [9:0] drop36X, drop36Y,drop37X, drop37Y,drop38X, drop38Y,drop39X, drop39Y,drop40X, drop40Y,drop41X, drop41Y,drop42X, drop42Y,drop43X, drop43Y,drop44X, drop44Y,drop45X, drop45Y,drop46X, drop46Y,
							  
							  input        [9:0] drop1X_1, drop1Y_1, drop2X_1, drop2Y_1, drop3X_1, drop3Y_1, drop4X_1, drop4Y_1, drop5X_1, drop5Y_1, drop6X_1, drop6Y_1,drop7X_1, drop7Y_1,drop8X_1, drop8Y_1,drop9X_1, drop9Y_1,drop10X_1, drop10Y_1,drop11X_1, drop11Y_1,drop12X_1, drop12Y_1,
							  input        [9:0] drop13X_1, drop13Y_1,drop14X_1, drop14Y_1,drop15X_1, drop15Y_1,drop16X_1, drop16Y_1,drop17X_1, drop17Y_1,drop18X_1, drop18Y_1,drop19X_1, drop19Y_1,drop20X_1, drop20Y_1,drop21X_1, drop21Y_1,drop22X_1, drop22Y_1,drop23X_1, drop23Y_1,
							  input        [9:0] drop24X_1, drop24Y_1,drop25X_1, drop25Y_1,drop26X_1, drop26Y_1,drop27X_1, drop27Y_1,drop28X_1, drop28Y_1,drop29X_1, drop29Y_1,drop30X_1, drop30Y_1,drop31X_1, drop31Y_1,drop32X_1, drop32Y_1,drop33X_1, drop33Y_1,drop34X_1, drop34Y_1,drop35X_1, drop35Y_1,
							  input        [9:0] drop36X_1, drop36Y_1,drop37X_1, drop37Y_1,drop38X_1, drop38Y_1,drop39X_1, drop39Y_1,drop40X_1, drop40Y_1,drop41X_1, drop41Y_1,drop42X_1, drop42Y_1,drop43X_1, drop43Y_1,drop44X_1, drop44Y_1,drop45X_1, drop45Y_1,drop46X_1, drop46Y_1,
							  
							  input logic [2249:0] tie_graph,
							  input logic [2374:0] win_graph,
							  input logic [1:0] winner,
							  input [17249:0] pika_color,
							  input [1374:0] score_bar_left, score_bar_right,
							  input [349:0] cur1_color, cur2_color,cur3_color, cur4_color,
							  input [20999:0] startscreen,
							  input [1599:0] arrow1, arrow2, arrow3,arrow4,arrow5, arrow6, arrow7, arrow8, arrow9, arrow10, arrow11, arrow12,arrow13,arrow14,arrow15,arrow16,arrow17,arrow18,arrow19,arrow20,arrow21,arrow22,arrow23,
							  input [1599:0] arrow24, arrow25, arrow26, arrow27, arrow28, arrow29, arrow30, arrow31, arrow32, arrow33, arrow34, arrow35, arrow36, arrow37, arrow38, arrow39, arrow40, arrow41, arrow42, arrow43, arrow44, arrow45, arrow46,
							  
							  input [1599:0] arrow1_1, arrow2_1, arrow3_1, arrow4_1, arrow5_1, arrow6_1, arrow7_1, arrow8_1, arrow9_1, arrow10_1, arrow11_1, arrow12_1,
							  input [1599:0] arrow13_1, arrow14_1, arrow15_1, arrow16_1, arrow17_1, arrow18_1, arrow19_1, arrow20_1, arrow21_1, arrow22_1, arrow23_1,
							  input [1599:0] arrow24_1, arrow25_1, arrow26_1, arrow27_1, arrow28_1, arrow29_1, arrow30_1, arrow31_1, arrow32_1, arrow33_1, arrow34_1, arrow35_1,
						     input [1599:0] arrow36_1, arrow37_1, arrow38_1, arrow39_1, arrow40_1, arrow41_1, arrow42_1, arrow43_1, arrow44_1, arrow45_1, arrow46_1,
								
                       output logic [7:0]  Red, Green, Blue );
    
	 logic tie_on;
	 logic win_on;
	 logic background_on;
	 logic decimal_on;
	 logic ten_on;
	 logic decimal2_on;
	 logic ten2_on;
	 logic start_screen_on;
	 logic floor_on;
	 logic grass_on;
	 logic base_on;
	 logic cloud_on;
	 logic pika_on;
	 logic score_bar_left_on, score_bar_right_on;
	 logic block1_on;
	 logic block2_on;
	 logic block3_on;
	 logic block4_on;
	 logic block5_on;
	 logic block6_on;
	 logic block7_on;
	 logic block8_on;
	 logic block9_on;
	 logic block10_on;
	 logic block11_on;
	 logic block12_on;
	 logic block13_on;
	 logic block14_on;
	 logic block15_on;
	 logic block16_on;
	 logic block17_on;
	 logic block18_on;
	 logic block19_on;
	 logic block20_on;
	 logic block21_on;
	 logic block22_on;
	 logic block23_on;
	 logic block24_on;
	 logic block25_on;
	 logic block26_on;
	 logic block27_on;
	 logic block28_on;
	 logic block29_on;
	 logic block30_on;
	 logic block31_on;
	 logic block32_on;
	 logic block33_on;
	 logic block34_on;
	 logic block35_on;
	 logic block36_on;
	 logic block37_on;
	 logic block38_on;
	 logic block39_on;
	 logic block40_on;
	 logic block41_on;
	 logic block42_on;
	 logic block43_on;
	 logic block44_on;
	 logic block45_on;
	 logic block46_on;
	
	 logic block1_on_1;
	 logic block2_on_1;
	 logic block3_on_1;
	 logic block4_on_1;
	 logic block5_on_1;
	 logic block6_on_1;
	 logic block7_on_1;
	 logic block8_on_1;
	 logic block9_on_1;
	 logic block10_on_1;
	 logic block11_on_1;
	 logic block12_on_1;
	 logic block13_on_1;
	 logic block14_on_1;
	 logic block15_on_1;
	 logic block16_on_1;
	 logic block17_on_1;
	 logic block18_on_1;
	 logic block19_on_1;
	 logic block20_on_1;
	 logic block21_on_1;
	 logic block22_on_1;
	 logic block23_on_1;
	 logic block24_on_1;
	 logic block25_on_1;
	 logic block26_on_1;
	 logic block27_on_1;
	 logic block28_on_1;
	 logic block29_on_1;
	 logic block30_on_1;
	 logic block31_on_1;
	 logic block32_on_1;
	 logic block33_on_1;
	 logic block34_on_1;
	 logic block35_on_1;
	 logic block36_on_1;
	 logic block37_on_1;
	 logic block38_on_1;
	 logic block39_on_1;
	 logic block40_on_1;
	 logic block41_on_1;
	 logic block42_on_1;
	 logic block43_on_1;
	 logic block44_on_1;
	 logic block45_on_1;
	 logic block46_on_1;
 /* Old Ball: Generated square box by checking if the current pixel is within a square of length
    2*Ball_Size, centered at (BallX, BallY).  Note that this requires unsigned comparisons.
	 
    if ((DrawX >= BallX - Ball_size) &&
       (DrawX <= BallX + Ball_size) &&
       (DrawY >= BallY - Ball_size) &&
       (DrawY <= BallY + Ball_size))

     New Ball: Generates (pixelated) circle by using the standard circle formula.  Note that while 
     this single line is quite powerful descriptively, it causes the synthesis tool to use up three
     of the 12 available multipliers on the chip!  Since the multiplicants are required to be signed,
	  we have to first cast them from logic to int (signed by default) before they are multiplied). */
	  
    int DistX, DistY, Size, coloridx;
	 logic[23:0] background_rgb;
	 logic [23:0] RGB;
	 assign coloridx = DrawY* 640 +DrawX;
	  
	  
	  
	  always_comb
	  begin:tie_on_proc
			if((DrawX >=275)&&(DrawX <=365)&&(DrawY >= 215)&&(DrawY <= 240)&&tie_graph[(DrawY*640 + DrawX - 215*640)/640*90+((DrawY*640 + DrawX - 215*640) % 640-275)]==1'b1)
				tie_on = 1'b1;
			else
				tie_on = 1'b0;
	  end
	  always_comb
	  begin:win_on_proc
			if(winner == 2'b01)
			begin
				if((DrawX >=55)&&(DrawX <=150)&&(DrawY >= 215)&&(DrawY <= 240)&&win_graph[(DrawY*640 + DrawX - 215*640)/640*95+((DrawY*640 + DrawX - 215*640) % 640-55)]==1'b1)
				win_on = 1'b1;
				else
				win_on = 1'b0;
			end
			else if(winner == 2'b10)
			begin
			if((DrawX >=480)&&(DrawX <=575)&&(DrawY >= 215)&&(DrawY <= 240)&&win_graph[(DrawY*640 + DrawX - 215*640)/640*95+((DrawY*640 + DrawX - 215*640) % 640-480)]==1'b1)
				win_on = 1'b1;
			else
				win_on = 1'b0;
			end
			else
				win_on = 1'b0;
	  end
	  always_comb
	  begin:score_bar_left_on_proc
			if((DrawX >=0)&&(DrawX <=55)&&(DrawY >= 0)&&(DrawY <= 25)&&score_bar_left[DrawY*55+DrawX]==1'b1)
				score_bar_left_on = 1'b1;
			else
				score_bar_left_on = 1'b0;
	  end
	  always_comb
	  begin:score_bar_right_on_proc
			if((DrawX >=542)&&(DrawX <=597)&&(DrawY >= 0)&&(DrawY <= 25)&&score_bar_right[(DrawY*640 + DrawX)/640*55+((DrawY*640 + DrawX) % 640-542)]==1'b1)
				score_bar_right_on = 1'b1;
			else
				score_bar_right_on = 1'b0;
	  end
	  always_comb
	  begin:tenth_on_proc
			if((DrawX >=60)&&(DrawX <=74)&&(DrawY >= 0)&&(DrawY <= 25)&& cur2_color[(DrawY*640 + DrawX)/640*14+((DrawY*640 + DrawX) % 640-60)]==1'b1)
				ten_on = 1'b1;
			else
				ten_on = 1'b0;
	  end
	  always_comb
	  begin:decimal_on_proc
			if((DrawX >=74)&&(DrawX <=88)&&(DrawY >= 0)&&(DrawY <= 25)&& cur1_color[(DrawY*640 + DrawX)/640*14+((DrawY*640 + DrawX) % 640-74)]==1'b1)
				decimal_on = 1'b1;
			else
				decimal_on = 1'b0;
	  end
	  always_comb
	  begin:tenth2_on_proc
			if((DrawX >=602)&&(DrawX <=616)&&(DrawY >= 0)&&(DrawY <= 25)&& cur4_color[(DrawY*640 + DrawX)/640*14+((DrawY*640 + DrawX) % 640-602)]==1'b1)
				ten2_on = 1'b1;
			else
				ten2_on = 1'b0;
	  end
	  always_comb
	  begin:decimal2_on_proc
			if((DrawX >=616)&&(DrawX <=630)&&(DrawY >= 0)&&(DrawY <= 25)&& cur3_color[(DrawY*640 + DrawX)/640*14+((DrawY*640 + DrawX) % 640-616)]==1'b1)
				decimal2_on = 1'b1;
			else
				decimal2_on = 1'b0;
	  end
	  always_comb
    begin:block1_on_proc
        if (((DrawX - drop1X) <= 40)&& ((DrawX - drop1X) >=0) && ((DrawY - drop1Y) <= 40) && ((DrawY - drop1Y) >=0) && (arrow1[40 * (DrawY - drop1Y) + DrawX - drop1X] == 1'b1)) 
            block1_on = 1'b1;
        else 
            block1_on = 1'b0;
     end 
	  always_comb
    begin:block2_on_proc
        if (((DrawX - drop2X) <= 40)&& ((DrawX - drop2X) >=0) && ((DrawY - drop2Y) <= 40) && ((DrawY - drop2Y) >=0) && (arrow2[40 * (DrawY - drop2Y) + DrawX - drop2X] == 1'b1)) 
            block2_on = 1'b1;
        else 
            block2_on = 1'b0;
     end
	  always_comb
    begin:block3_on_proc
        if (((DrawX - drop3X) <= 40)&& ((DrawX - drop3X) >=0) && ((DrawY - drop3Y) <= 40) && ((DrawY - drop3Y) >=0) && (arrow3[40 * (DrawY - drop3Y) + DrawX - drop3X] == 1'b1)) 
            block3_on = 1'b1;
        else 
            block3_on = 1'b0;
     end
	  always_comb
    begin:block4_on_proc
        if (((DrawX - drop4X) <= 40)&& ((DrawX - drop4X) >=0) && ((DrawY - drop4Y) <= 40) && ((DrawY - drop4Y) >=0) && (arrow4[40 * (DrawY - drop4Y) + DrawX - drop4X] == 1'b1)) 
            block4_on = 1'b1;
        else 
            block4_on = 1'b0;
     end
	  always_comb
    begin:block5_on_proc
        if (((DrawX - drop5X) <= 40)&& ((DrawX - drop5X) >=0) && ((DrawY - drop5Y) <= 40) && ((DrawY - drop5Y) >=0) && (arrow5[40 * (DrawY - drop5Y) + DrawX - drop5X] == 1'b1)) 
            block5_on = 1'b1;
        else 
				block5_on = 1'b0;
	  end
     always_comb
    begin:block6_on_proc
        if (((DrawX - drop6X) <= 40)&& ((DrawX - drop6X) >=0) && ((DrawY - drop6Y) <= 40) && ((DrawY - drop6Y) >=0) && (arrow6[40 * (DrawY - drop6Y) + DrawX - drop6X] == 1'b1)) 
            block6_on = 1'b1;
        else 
				block6_on = 1'b0;
		end
		always_comb
    begin:block7_on_proc
        if (((DrawX - drop7X) <= 40)&& ((DrawX - drop7X) >=0) && ((DrawY - drop7Y) <= 40) && ((DrawY - drop7Y) >=0) && (arrow7[40 * (DrawY - drop7Y) + DrawX - drop7X] == 1'b1)) 
            block7_on = 1'b1;
        else 
				block7_on = 1'b0;
		end
		always_comb
    begin:block8_on_proc
        if (((DrawX - drop8X) <= 40)&& ((DrawX - drop8X) >=0) && ((DrawY - drop8Y) <= 40) && ((DrawY - drop8Y) >=0) && (arrow8[40 * (DrawY - drop8Y) + DrawX - drop8X] == 1'b1)) 
            block8_on = 1'b1;
        else 
				block8_on = 1'b0;
		end
		always_comb
    begin:block9_on_proc
        if (((DrawX - drop9X) <= 40)&& ((DrawX - drop9X) >=0) && ((DrawY - drop9Y) <= 40) && ((DrawY - drop9Y) >=0) && (arrow9[40 * (DrawY - drop9Y) + DrawX - drop9X] == 1'b1)) 
            block9_on = 1'b1;
        else 
				block9_on = 1'b0;
		end
		always_comb
    begin:block10_on_proc
        if (((DrawX - drop10X) <= 40)&& ((DrawX - drop10X) >=0) && ((DrawY - drop10Y) <= 40) && ((DrawY - drop10Y) >=0) && (arrow10[40 * (DrawY - drop10Y) + DrawX - drop10X] == 1'b1)) 
            block10_on = 1'b1;
        else 
				block10_on = 1'b0;
		end
		always_comb
    begin:block11_on_proc
        if (((DrawX - drop11X) <= 40)&& ((DrawX - drop11X) >=0) && ((DrawY - drop11Y) <= 40) && ((DrawY - drop11Y) >=0) && (arrow11[40 * (DrawY - drop11Y) + DrawX - drop11X] == 1'b1)) 
            block11_on = 1'b1;
        else 
				block11_on = 1'b0;
		end
		always_comb
    begin:block12_on_proc
        if (((DrawX - drop12X) <= 40)&& ((DrawX - drop12X) >=0) && ((DrawY - drop12Y) <= 40) && ((DrawY - drop12Y) >=0) && (arrow12[40 * (DrawY - drop12Y) + DrawX - drop12X] == 1'b1)) 
            block12_on = 1'b1;
        else 
				block12_on = 1'b0;
		end
		always_comb
    begin:block13_on_proc
        if (((DrawX - drop13X) <= 40)&& ((DrawX - drop13X) >=0) && ((DrawY - drop13Y) <= 40) && ((DrawY - drop13Y) >=0) && (arrow13[40 * (DrawY - drop13Y) + DrawX - drop13X] == 1'b1)) 
            block13_on = 1'b1;
        else 
				block13_on = 1'b0;
		end
		always_comb
    begin:block14_on_proc
        if (((DrawX - drop14X) <= 40)&& ((DrawX - drop14X) >=0) && ((DrawY - drop14Y) <= 40) && ((DrawY - drop14Y) >=0) && (arrow14[40 * (DrawY - drop14Y) + DrawX - drop14X] == 1'b1)) 
            block14_on = 1'b1;
        else 
				block14_on = 1'b0;
		end
		always_comb
    begin:block15_on_proc
        if (((DrawX - drop15X) <= 40)&& ((DrawX - drop15X) >=0) && ((DrawY - drop15Y) <= 40) && ((DrawY - drop15Y) >=0) && (arrow15[40 * (DrawY - drop15Y) + DrawX - drop15X] == 1'b1)) 
            block15_on = 1'b1;
        else 
				block15_on = 1'b0;
		end
		always_comb
    begin:block16_on_proc
        if (((DrawX - drop16X) <= 40)&& ((DrawX - drop16X) >=0) && ((DrawY - drop16Y) <= 40) && ((DrawY - drop16Y) >=0) && (arrow16[40 * (DrawY - drop16Y) + DrawX - drop16X] == 1'b1)) 
            block16_on = 1'b1;
        else 
				block16_on = 1'b0;
		end
		always_comb
    begin:block17_on_proc
        if (((DrawX - drop17X) <= 40)&& ((DrawX - drop17X) >=0) && ((DrawY - drop17Y) <= 40) && ((DrawY - drop17Y) >=0) && (arrow17[40 * (DrawY - drop17Y) + DrawX - drop17X] == 1'b1)) 
            block17_on = 1'b1;
        else 
				block17_on = 1'b0;
		end
		always_comb
    begin:block18_on_proc
        if (((DrawX - drop18X) <= 40)&& ((DrawX - drop18X) >=0) && ((DrawY - drop18Y) <= 40) && ((DrawY - drop18Y) >=0) && (arrow18[40 * (DrawY - drop18Y) + DrawX - drop18X] == 1'b1)) 
            block18_on = 1'b1;
        else 
				block18_on = 1'b0;
		end
		always_comb
    begin:block19_on_proc
        if (((DrawX - drop19X) <= 40)&& ((DrawX - drop19X) >=0) && ((DrawY - drop19Y) <= 40) && ((DrawY - drop19Y) >=0) && (arrow19[40 * (DrawY - drop19Y) + DrawX - drop19X] == 1'b1)) 
            block19_on = 1'b1;
        else 
				block19_on = 1'b0;
		end
		always_comb
    begin:block20_on_proc
        if (((DrawX - drop20X) <= 40)&& ((DrawX - drop20X) >=0) && ((DrawY - drop20Y) <= 40) && ((DrawY - drop20Y) >=0) && (arrow20[40 * (DrawY - drop20Y) + DrawX - drop20X] == 1'b1)) 
            block20_on = 1'b1;
        else 
				block20_on = 1'b0;
		end
		always_comb
    begin:block21_on_proc
        if (((DrawX - drop21X) <= 40)&& ((DrawX - drop21X) >=0) && ((DrawY - drop21Y) <= 40) && ((DrawY - drop21Y) >=0) && (arrow21[40 * (DrawY - drop21Y) + DrawX - drop21X] == 1'b1)) 
            block21_on = 1'b1;
        else 
				block21_on = 1'b0;
		end
		always_comb
    begin:block22_on_proc
        if (((DrawX - drop22X) <= 40)&& ((DrawX - drop22X) >=0) && ((DrawY - drop22Y) <= 40) && ((DrawY - drop22Y) >=0) && (arrow22[40 * (DrawY - drop22Y) + DrawX - drop22X] == 1'b1)) 
            block22_on = 1'b1;
        else 
				block22_on = 1'b0;
		end
		always_comb
    begin:block23_on_proc
        if (((DrawX - drop23X) <= 40)&& ((DrawX - drop23X) >=0) && ((DrawY - drop23Y) <= 40) && ((DrawY - drop23Y) >=0) && (arrow23[40 * (DrawY - drop23Y) + DrawX - drop23X] == 1'b1)) 
            block23_on = 1'b1;
        else 
				block23_on = 1'b0;
		end
		always_comb
    begin:block24_on_proc
        if (((DrawX - drop24X) <= 40)&& ((DrawX - drop24X) >=0) && ((DrawY - drop24Y) <= 40) && ((DrawY - drop24Y) >=0) && (arrow24[40 * (DrawY - drop24Y) + DrawX - drop24X] == 1'b1)) 
            block24_on = 1'b1;
        else 
				block24_on = 1'b0;
		end
		always_comb
    begin:block25_on_proc
        if (((DrawX - drop25X) <= 40)&& ((DrawX - drop25X) >=0) && ((DrawY - drop25Y) <= 40) && ((DrawY - drop25Y) >=0) && (arrow25[40 * (DrawY - drop25Y) + DrawX - drop25X] == 1'b1)) 
            block25_on = 1'b1;
        else 
				block25_on = 1'b0;
		end
		always_comb
    begin:block26_on_proc
        if (((DrawX - drop26X) <= 40)&& ((DrawX - drop26X) >=0) && ((DrawY - drop26Y) <= 40) && ((DrawY - drop26Y) >=0) && (arrow26[40 * (DrawY - drop26Y) + DrawX - drop26X] == 1'b1)) 
            block26_on = 1'b1;
        else 
				block26_on = 1'b0;
		end
		always_comb
    begin:block27_on_proc
        if (((DrawX - drop27X) <= 40)&& ((DrawX - drop27X) >=0) && ((DrawY - drop27Y) <= 40) && ((DrawY - drop27Y) >=0) && (arrow27[40 * (DrawY - drop27Y) + DrawX - drop27X] == 1'b1)) 
            block27_on = 1'b1;
        else 
				block27_on = 1'b0;
		end
		always_comb
    begin:block28_on_proc
        if (((DrawX - drop28X) <= 40)&& ((DrawX - drop28X) >=0) && ((DrawY - drop28Y) <= 40) && ((DrawY - drop28Y) >=0) && (arrow28[40 * (DrawY - drop28Y) + DrawX - drop28X] == 1'b1)) 
            block28_on = 1'b1;
        else 
				block28_on = 1'b0;
		end
		always_comb
    begin:block29_on_proc
        if (((DrawX - drop29X) <= 40)&& ((DrawX - drop29X) >=0) && ((DrawY - drop29Y) <= 40) && ((DrawY - drop29Y) >=0) && (arrow29[40 * (DrawY - drop29Y) + DrawX - drop29X] == 1'b1)) 
            block29_on = 1'b1;
        else 
				block29_on = 1'b0;
		end
		always_comb
    begin:block30_on_proc
        if (((DrawX - drop30X) <= 40)&& ((DrawX - drop30X) >=0) && ((DrawY - drop30Y) <= 40) && ((DrawY - drop30Y) >=0) && (arrow30[40 * (DrawY - drop30Y) + DrawX - drop30X] == 1'b1)) 
            block30_on = 1'b1;
        else 
				block30_on = 1'b0;
		end
		always_comb
    begin:block31_on_proc
        if (((DrawX - drop31X) <= 40)&& ((DrawX - drop31X) >=0) && ((DrawY - drop31Y) <= 40) && ((DrawY - drop31Y) >=0) && (arrow31[40 * (DrawY - drop31Y) + DrawX - drop31X] == 1'b1)) 
            block31_on = 1'b1;
        else 
				block31_on = 1'b0;
		end
		always_comb
    begin:block32_on_proc
        if (((DrawX - drop32X) <= 40)&& ((DrawX - drop32X) >=0) && ((DrawY - drop32Y) <= 40) && ((DrawY - drop32Y) >=0) && (arrow32[40 * (DrawY - drop32Y) + DrawX - drop32X] == 1'b1)) 
            block32_on = 1'b1;
        else 
				block32_on = 1'b0;
		end
		always_comb
    begin:block33_on_proc
        if (((DrawX - drop33X) <= 40)&& ((DrawX - drop33X) >=0) && ((DrawY - drop33Y) <= 40) && ((DrawY - drop33Y) >=0) && (arrow33[40 * (DrawY - drop33Y) + DrawX - drop33X] == 1'b1)) 
            block33_on = 1'b1;
        else 
				block33_on = 1'b0;
		end
		always_comb
    begin:block34_on_proc
        if (((DrawX - drop34X) <= 40)&& ((DrawX - drop34X) >=0) && ((DrawY - drop34Y) <= 40) && ((DrawY - drop34Y) >=0) && (arrow34[40 * (DrawY - drop34Y) + DrawX - drop34X] == 1'b1)) 
            block34_on = 1'b1;
        else 
				block34_on = 1'b0;
		end
		always_comb
    begin:block35_on_proc
        if (((DrawX - drop35X) <= 40)&& ((DrawX - drop35X) >=0) && ((DrawY - drop35Y) <= 40) && ((DrawY - drop35Y) >=0) && (arrow35[40 * (DrawY - drop35Y) + DrawX - drop35X] == 1'b1)) 
            block35_on = 1'b1;
        else 
				block35_on = 1'b0;
		end
		always_comb
    begin:block36_on_proc
        if (((DrawX - drop36X) <= 40)&& ((DrawX - drop36X) >=0) && ((DrawY - drop36Y) <= 40) && ((DrawY - drop36Y) >=0) && (arrow36[40 * (DrawY - drop36Y) + DrawX - drop36X] == 1'b1)) 
            block36_on = 1'b1;
        else 
				block36_on = 1'b0;
		end
		always_comb
    begin:block37_on_proc
        if (((DrawX - drop37X) <= 40)&& ((DrawX - drop37X) >=0) && ((DrawY - drop37Y) <= 40) && ((DrawY - drop37Y) >=0) && (arrow37[40 * (DrawY - drop37Y) + DrawX - drop37X] == 1'b1)) 
            block37_on = 1'b1;
        else 
				block37_on = 1'b0;
		end
		always_comb
    begin:block38_on_proc
        if (((DrawX - drop38X) <= 40)&& ((DrawX - drop38X) >=0) && ((DrawY - drop38Y) <= 40) && ((DrawY - drop38Y) >=0) && (arrow38[40 * (DrawY - drop38Y) + DrawX - drop38X] == 1'b1)) 
            block38_on = 1'b1;
        else 
				block38_on = 1'b0;
		end
		always_comb
    begin:block39_on_proc
        if (((DrawX - drop39X) <= 40)&& ((DrawX - drop39X) >=0) && ((DrawY - drop39Y) <= 40) && ((DrawY - drop39Y) >=0) && (arrow39[40 * (DrawY - drop39Y) + DrawX - drop39X] == 1'b1)) 
            block39_on = 1'b1;
        else 
				block39_on = 1'b0;
		end
		always_comb
    begin:block40_on_proc
        if (((DrawX - drop40X) <= 40)&& ((DrawX - drop40X) >=0) && ((DrawY - drop40Y) <= 40) && ((DrawY - drop40Y) >=0) && (arrow40[40 * (DrawY - drop40Y) + DrawX - drop40X] == 1'b1)) 
            block40_on = 1'b1;
        else 
				block40_on = 1'b0;
		end
		always_comb
    begin:block41_on_proc
        if (((DrawX - drop41X) <= 40)&& ((DrawX - drop41X) >=0) && ((DrawY - drop41Y) <= 40) && ((DrawY - drop41Y) >=0) && (arrow41[40 * (DrawY - drop41Y) + DrawX - drop41X] == 1'b1)) 
            block41_on = 1'b1;
        else 
				block41_on = 1'b0;
		end
		always_comb
    begin:block42_on_proc
        if (((DrawX - drop42X) <= 40)&& ((DrawX - drop42X) >=0) && ((DrawY - drop42Y) <= 40) && ((DrawY - drop42Y) >=0) && (arrow42[40 * (DrawY - drop42Y) + DrawX - drop42X] == 1'b1)) 
            block42_on = 1'b1;
        else 
				block42_on = 1'b0;
		end
		always_comb
    begin:block43_on_proc
        if (((DrawX - drop43X) <= 40)&& ((DrawX - drop43X) >=0) && ((DrawY - drop43Y) <= 40) && ((DrawY - drop43Y) >=0) && (arrow43[40 * (DrawY - drop43Y) + DrawX - drop43X] == 1'b1)) 
            block43_on = 1'b1;
        else 
				block43_on = 1'b0;
		end
		always_comb
    begin:block44_on_proc
        if (((DrawX - drop44X) <= 40)&& ((DrawX - drop44X) >=0) && ((DrawY - drop44Y) <= 40) && ((DrawY - drop44Y) >=0) && (arrow44[40 * (DrawY - drop44Y) + DrawX - drop44X] == 1'b1)) 
            block44_on = 1'b1;
        else 
				block44_on = 1'b0;
		end
		always_comb
    begin:block45_on_proc
        if (((DrawX - drop45X) <= 40)&& ((DrawX - drop45X) >=0) && ((DrawY - drop45Y) <= 40) && ((DrawY - drop45Y) >=0) && (arrow45[40 * (DrawY - drop45Y) + DrawX - drop45X] == 1'b1)) 
            block45_on = 1'b1;
        else 
				block45_on = 1'b0;
		end
	 always_comb
    begin:block46_on_proc
        if (((DrawX - drop46X) <= 40)&& ((DrawX - drop46X) >=0) && ((DrawY - drop46Y) <= 40) && ((DrawY - drop46Y) >=0) && (arrow46[40 * (DrawY - drop46Y) + DrawX - drop46X] == 1'b1)) 
            block46_on = 1'b1;
        else 
				block46_on = 1'b0;
		end
		
		always_comb
    begin:block1_on_1_proc
        if (((DrawX - drop1X_1) <= 40)&& ((DrawX - drop1X_1) >=0) && ((DrawY - drop1Y_1) <= 40) && ((DrawY - drop1Y_1) >=0) && (arrow1_1[40 * (DrawY - drop1Y_1) + DrawX - drop1X_1] == 1'b1)) 
            block1_on_1 = 1'b1;
        else 
            block1_on_1 = 1'b0;
     end 
	  always_comb
    begin:block2_on_1_proc
        if (((DrawX - drop2X_1) <= 40)&& ((DrawX - drop2X_1) >=0) && ((DrawY - drop2Y_1) <= 40) && ((DrawY - drop2Y_1) >=0) && (arrow2_1[40 * (DrawY - drop2Y_1) + DrawX - drop2X_1] == 1'b1)) 
            block2_on_1 = 1'b1;
        else 
            block2_on_1 = 1'b0;
     end
	  always_comb
    begin:block3_on_1_proc
        if (((DrawX - drop3X_1) <= 40)&& ((DrawX - drop3X_1) >=0) && ((DrawY - drop3Y_1) <= 40) && ((DrawY - drop3Y_1) >=0) && (arrow3_1[40 * (DrawY - drop3Y_1) + DrawX - drop3X_1] == 1'b1)) 
            block3_on_1 = 1'b1;
        else 
            block3_on_1 = 1'b0;
     end
	  always_comb
    begin:block4_on_1_proc
        if (((DrawX - drop4X_1) <= 40)&& ((DrawX - drop4X_1) >=0) && ((DrawY - drop4Y_1) <= 40) && ((DrawY - drop4Y_1) >=0) && (arrow4_1[40 * (DrawY - drop4Y_1) + DrawX - drop4X_1] == 1'b1)) 
            block4_on_1 = 1'b1;
        else 
            block4_on_1 = 1'b0;
     end
	  always_comb
    begin:block5_on_1_proc
        if (((DrawX - drop5X_1) <= 40)&& ((DrawX - drop5X_1) >=0) && ((DrawY - drop5Y_1) <= 40) && ((DrawY - drop5Y_1) >=0) && (arrow5_1[40 * (DrawY - drop5Y_1) + DrawX - drop5X_1] == 1'b1)) 
            block5_on_1 = 1'b1;
        else 
				block5_on_1 = 1'b0;
	  end
     always_comb
    begin:block6_on_1_proc
        if (((DrawX - drop6X_1) <= 40)&& ((DrawX - drop6X_1) >=0) && ((DrawY - drop6Y_1) <= 40) && ((DrawY - drop6Y_1) >=0) && (arrow6_1[40 * (DrawY - drop6Y_1) + DrawX - drop6X_1] == 1'b1)) 
            block6_on_1 = 1'b1;
        else 
				block6_on_1 = 1'b0;
		end
		always_comb
    begin:block7_on_1_proc
        if (((DrawX - drop7X_1) <= 40)&& ((DrawX - drop7X_1) >=0) && ((DrawY - drop7Y_1) <= 40) && ((DrawY - drop7Y_1) >=0) && (arrow7_1[40 * (DrawY - drop7Y_1) + DrawX - drop7X_1] == 1'b1)) 
            block7_on_1 = 1'b1;
        else 
				block7_on_1 = 1'b0;
		end
		always_comb
    begin:block8_on_1_proc
        if (((DrawX - drop8X_1) <= 40)&& ((DrawX - drop8X_1) >=0) && ((DrawY - drop8Y_1) <= 40) && ((DrawY - drop8Y_1) >=0) && (arrow8_1[40 * (DrawY - drop8Y_1) + DrawX - drop8X_1] == 1'b1)) 
            block8_on_1 = 1'b1;
        else 
				block8_on_1 = 1'b0;
		end
		always_comb
    begin:block9_on_1_proc
        if (((DrawX - drop9X_1) <= 40)&& ((DrawX - drop9X_1) >=0) && ((DrawY - drop9Y_1) <= 40) && ((DrawY - drop9Y_1) >=0) && (arrow9_1[40 * (DrawY - drop9Y_1) + DrawX - drop9X_1] == 1'b1)) 
            block9_on_1 = 1'b1;
        else 
				block9_on_1 = 1'b0;
		end
		always_comb
    begin:block10_on_1_proc
        if (((DrawX - drop10X_1) <= 40)&& ((DrawX - drop10X_1) >=0) && ((DrawY - drop10Y_1) <= 40) && ((DrawY - drop10Y_1) >=0) && (arrow10_1[40 * (DrawY - drop10Y_1) + DrawX - drop10X_1] == 1'b1)) 
            block10_on_1 = 1'b1;
        else 
				block10_on_1 = 1'b0;
		end
		always_comb
    begin:block11_on_1_proc
        if (((DrawX - drop11X_1) <= 40)&& ((DrawX - drop11X_1) >=0) && ((DrawY - drop11Y_1) <= 40) && ((DrawY - drop11Y_1) >=0) && (arrow11_1[40 * (DrawY - drop11Y_1) + DrawX - drop11X_1] == 1'b1)) 
            block11_on_1 = 1'b1;
        else 
				block11_on_1 = 1'b0;
		end
		always_comb
    begin:block12_on_1_proc
        if (((DrawX - drop12X_1) <= 40)&& ((DrawX - drop12X_1) >=0) && ((DrawY - drop12Y_1) <= 40) && ((DrawY - drop12Y_1) >=0) && (arrow12_1[40 * (DrawY - drop12Y_1) + DrawX - drop12X_1] == 1'b1)) 
            block12_on_1 = 1'b1;
        else 
				block12_on_1 = 1'b0;
		end
		always_comb
    begin:block13_on_1_proc
        if (((DrawX - drop13X_1) <= 40)&& ((DrawX - drop13X_1) >=0) && ((DrawY - drop13Y_1) <= 40) && ((DrawY - drop13Y_1) >=0) && (arrow13_1[40 * (DrawY - drop13Y_1) + DrawX - drop13X_1] == 1'b1)) 
            block13_on_1 = 1'b1;
        else 
				block13_on_1 = 1'b0;
		end
		always_comb
    begin:block14_on_1_proc
        if (((DrawX - drop14X_1) <= 40)&& ((DrawX - drop14X_1) >=0) && ((DrawY - drop14Y_1) <= 40) && ((DrawY - drop14Y_1) >=0) && (arrow14_1[40 * (DrawY - drop14Y_1) + DrawX - drop14X_1] == 1'b1)) 
            block14_on_1 = 1'b1;
        else 
				block14_on_1 = 1'b0;
		end
		always_comb
    begin:block15_on_1_proc
        if (((DrawX - drop15X_1) <= 40)&& ((DrawX - drop15X_1) >=0) && ((DrawY - drop15Y_1) <= 40) && ((DrawY - drop15Y_1) >=0) && (arrow15_1[40 * (DrawY - drop15Y_1) + DrawX - drop15X_1] == 1'b1)) 
            block15_on_1 = 1'b1;
        else 
				block15_on_1 = 1'b0;
		end
		always_comb
    begin:block16_on_1_proc
        if (((DrawX - drop16X_1) <= 40)&& ((DrawX - drop16X_1) >=0) && ((DrawY - drop16Y_1) <= 40) && ((DrawY - drop16Y_1) >=0) && (arrow16_1[40 * (DrawY - drop16Y_1) + DrawX - drop16X_1] == 1'b1)) 
            block16_on_1 = 1'b1;
        else 
				block16_on_1 = 1'b0;
		end
		always_comb
    begin:block17_on_1_proc
        if (((DrawX - drop17X_1) <= 40)&& ((DrawX - drop17X_1) >=0) && ((DrawY - drop17Y_1) <= 40) && ((DrawY - drop17Y_1) >=0) && (arrow17_1[40 * (DrawY - drop17Y_1) + DrawX - drop17X_1] == 1'b1)) 
            block17_on_1 = 1'b1;
        else 
				block17_on_1 = 1'b0;
		end
		always_comb
    begin:block18_on_1_proc
        if (((DrawX - drop18X_1) <= 40)&& ((DrawX - drop18X_1) >=0) && ((DrawY - drop18Y_1) <= 40) && ((DrawY - drop18Y_1) >=0) && (arrow18_1[40 * (DrawY - drop18Y_1) + DrawX - drop18X_1] == 1'b1)) 
            block18_on_1 = 1'b1;
        else 
				block18_on_1 = 1'b0;
		end
		always_comb
    begin:block19_on_1_proc
        if (((DrawX - drop19X_1) <= 40)&& ((DrawX - drop19X_1) >=0) && ((DrawY - drop19Y_1) <= 40) && ((DrawY - drop19Y_1) >=0) && (arrow19_1[40 * (DrawY - drop19Y_1) + DrawX - drop19X_1] == 1'b1)) 
            block19_on_1 = 1'b1;
        else 
				block19_on_1 = 1'b0;
		end
		always_comb
    begin:block20_on_1_proc
        if (((DrawX - drop20X_1) <= 40)&& ((DrawX - drop20X_1) >=0) && ((DrawY - drop20Y_1) <= 40) && ((DrawY - drop20Y_1) >=0) && (arrow20_1[40 * (DrawY - drop20Y_1) + DrawX - drop20X_1] == 1'b1)) 
            block20_on_1 = 1'b1;
        else 
				block20_on_1 = 1'b0;
		end
		always_comb
    begin:block21_on_1_proc
        if (((DrawX - drop21X_1) <= 40)&& ((DrawX - drop21X_1) >=0) && ((DrawY - drop21Y_1) <= 40) && ((DrawY - drop21Y_1) >=0) && (arrow21_1[40 * (DrawY - drop21Y_1) + DrawX - drop21X_1] == 1'b1)) 
            block21_on_1 = 1'b1;
        else 
				block21_on_1 = 1'b0;
		end
		always_comb
    begin:block22_on_1_proc
        if (((DrawX - drop22X_1) <= 40)&& ((DrawX - drop22X_1) >=0) && ((DrawY - drop22Y_1) <= 40) && ((DrawY - drop22Y_1) >=0) && (arrow22_1[40 * (DrawY - drop22Y_1) + DrawX - drop22X_1] == 1'b1)) 
            block22_on_1 = 1'b1;
        else 
				block22_on_1 = 1'b0;
		end
		always_comb
    begin:block23_on_1_proc
        if (((DrawX - drop23X_1) <= 40)&& ((DrawX - drop23X_1) >=0) && ((DrawY - drop23Y_1) <= 40) && ((DrawY - drop23Y_1) >=0) && (arrow23_1[40 * (DrawY - drop23Y_1) + DrawX - drop23X_1] == 1'b1)) 
            block23_on_1 = 1'b1;
        else 
				block23_on_1 = 1'b0;
		end
		always_comb
    begin:block24_on_1_proc
        if (((DrawX - drop24X_1) <= 40)&& ((DrawX - drop24X_1) >=0) && ((DrawY - drop24Y_1) <= 40) && ((DrawY - drop24Y_1) >=0) && (arrow24_1[40 * (DrawY - drop24Y_1) + DrawX - drop24X_1] == 1'b1)) 
            block24_on_1 = 1'b1;
        else 
				block24_on_1 = 1'b0;
		end
		always_comb
    begin:block25_on_1_proc
        if (((DrawX - drop25X_1) <= 40)&& ((DrawX - drop25X_1) >=0) && ((DrawY - drop25Y_1) <= 40) && ((DrawY - drop25Y_1) >=0) && (arrow25_1[40 * (DrawY - drop25Y_1) + DrawX - drop25X_1] == 1'b1)) 
            block25_on_1 = 1'b1;
        else 
				block25_on_1 = 1'b0;
		end
		always_comb
    begin:block26_on_1_proc
        if (((DrawX - drop26X_1) <= 40)&& ((DrawX - drop26X_1) >=0) && ((DrawY - drop26Y_1) <= 40) && ((DrawY - drop26Y_1) >=0) && (arrow26_1[40 * (DrawY - drop26Y_1) + DrawX - drop26X_1] == 1'b1)) 
            block26_on_1 = 1'b1;
        else 
				block26_on_1 = 1'b0;
		end
		always_comb
    begin:block27_on_1_proc
        if (((DrawX - drop27X_1) <= 40)&& ((DrawX - drop27X_1) >=0) && ((DrawY - drop27Y_1) <= 40) && ((DrawY - drop27Y_1) >=0) && (arrow27_1[40 * (DrawY - drop27Y_1) + DrawX - drop27X_1] == 1'b1)) 
            block27_on_1 = 1'b1;
        else 
				block27_on_1 = 1'b0;
		end
		always_comb
    begin:block28_on_1_proc
        if (((DrawX - drop28X_1) <= 40)&& ((DrawX - drop28X_1) >=0) && ((DrawY - drop28Y_1) <= 40) && ((DrawY - drop28Y_1) >=0) && (arrow28_1[40 * (DrawY - drop28Y_1) + DrawX - drop28X_1] == 1'b1)) 
            block28_on_1 = 1'b1;
        else 
				block28_on_1 = 1'b0;
		end
		always_comb
    begin:block29_on_1_proc
        if (((DrawX - drop29X_1) <= 40)&& ((DrawX - drop29X_1) >=0) && ((DrawY - drop29Y_1) <= 40) && ((DrawY - drop29Y_1) >=0) && (arrow29_1[40 * (DrawY - drop29Y_1) + DrawX - drop29X_1] == 1'b1)) 
            block29_on_1 = 1'b1;
        else 
				block29_on_1 = 1'b0;
		end
		always_comb
    begin:block30_on_1_proc
        if (((DrawX - drop30X_1) <= 40)&& ((DrawX - drop30X_1) >=0) && ((DrawY - drop30Y_1) <= 40) && ((DrawY - drop30Y_1) >=0) && (arrow30_1[40 * (DrawY - drop30Y_1) + DrawX - drop30X_1] == 1'b1)) 
            block30_on_1 = 1'b1;
        else 
				block30_on_1 = 1'b0;
		end
		always_comb
    begin:block31_on_1_proc
        if (((DrawX - drop31X_1) <= 40)&& ((DrawX - drop31X_1) >=0) && ((DrawY - drop31Y_1) <= 40) && ((DrawY - drop31Y_1) >=0) && (arrow31_1[40 * (DrawY - drop31Y_1) + DrawX - drop31X_1] == 1'b1)) 
            block31_on_1 = 1'b1;
        else 
				block31_on_1 = 1'b0;
		end
		always_comb
    begin:block32_on_1_proc
        if (((DrawX - drop32X_1) <= 40)&& ((DrawX - drop32X_1) >=0) && ((DrawY - drop32Y_1) <= 40) && ((DrawY - drop32Y_1) >=0) && (arrow32_1[40 * (DrawY - drop32Y_1) + DrawX - drop32X_1] == 1'b1)) 
            block32_on_1 = 1'b1;
        else 
				block32_on_1 = 1'b0;
		end
		always_comb
    begin:block33_on_1_proc
        if (((DrawX - drop33X_1) <= 40)&& ((DrawX - drop33X_1) >=0) && ((DrawY - drop33Y_1) <= 40) && ((DrawY - drop33Y_1) >=0) && (arrow33_1[40 * (DrawY - drop33Y_1) + DrawX - drop33X_1] == 1'b1)) 
            block33_on_1 = 1'b1;
        else 
				block33_on_1 = 1'b0;
		end
		always_comb
    begin:block34_on_1_proc
        if (((DrawX - drop34X_1) <= 40)&& ((DrawX - drop34X_1) >=0) && ((DrawY - drop34Y_1) <= 40) && ((DrawY - drop34Y_1) >=0) && (arrow34_1[40 * (DrawY - drop34Y_1) + DrawX - drop34X_1] == 1'b1)) 
            block34_on_1 = 1'b1;
        else 
				block34_on_1 = 1'b0;
		end
		always_comb
    begin:block35_on_1_proc
        if (((DrawX - drop35X_1) <= 40)&& ((DrawX - drop35X_1) >=0) && ((DrawY - drop35Y_1) <= 40) && ((DrawY - drop35Y_1) >=0) && (arrow35_1[40 * (DrawY - drop35Y_1) + DrawX - drop35X_1] == 1'b1)) 
            block35_on_1 = 1'b1;
        else 
				block35_on_1 = 1'b0;
		end
		always_comb
    begin:block36_on_1_proc
        if (((DrawX - drop36X_1) <= 40)&& ((DrawX - drop36X_1) >=0) && ((DrawY - drop36Y_1) <= 40) && ((DrawY - drop36Y_1) >=0) && (arrow36_1[40 * (DrawY - drop36Y_1) + DrawX - drop36X_1] == 1'b1)) 
            block36_on_1 = 1'b1;
        else 
				block36_on_1 = 1'b0;
		end
		always_comb
    begin:block37_on_1_proc
        if (((DrawX - drop37X_1) <= 40)&& ((DrawX - drop37X_1) >=0) && ((DrawY - drop37Y_1) <= 40) && ((DrawY - drop37Y_1) >=0) && (arrow37_1[40 * (DrawY - drop37Y_1) + DrawX - drop37X_1] == 1'b1)) 
            block37_on_1 = 1'b1;
        else 
				block37_on_1 = 1'b0;
		end
		always_comb
    begin:block38_on_1_proc
        if (((DrawX - drop38X_1) <= 40)&& ((DrawX - drop38X_1) >=0) && ((DrawY - drop38Y_1) <= 40) && ((DrawY - drop38Y_1) >=0) && (arrow38_1[40 * (DrawY - drop38Y_1) + DrawX - drop38X_1] == 1'b1)) 
            block38_on_1 = 1'b1;
        else 
				block38_on_1 = 1'b0;
		end
		always_comb
    begin:block39_on_1_proc
        if (((DrawX - drop39X_1) <= 40)&& ((DrawX - drop39X_1) >=0) && ((DrawY - drop39Y_1) <= 40) && ((DrawY - drop39Y_1) >=0) && (arrow39_1[40 * (DrawY - drop39Y_1) + DrawX - drop39X_1] == 1'b1)) 
            block39_on_1 = 1'b1;
        else 
				block39_on_1 = 1'b0;
		end
		always_comb
    begin:block40_on_1_proc
        if (((DrawX - drop40X_1) <= 40)&& ((DrawX - drop40X_1) >=0) && ((DrawY - drop40Y_1) <= 40) && ((DrawY - drop40Y_1) >=0) && (arrow40_1[40 * (DrawY - drop40Y_1) + DrawX - drop40X_1] == 1'b1)) 
            block40_on_1 = 1'b1;
        else 
				block40_on_1 = 1'b0;
		end
		always_comb
    begin:block41_on_1_proc
        if (((DrawX - drop41X_1) <= 40)&& ((DrawX - drop41X_1) >=0) && ((DrawY - drop41Y_1) <= 40) && ((DrawY - drop41Y_1) >=0) && (arrow41_1[40 * (DrawY - drop41Y_1) + DrawX - drop41X_1] == 1'b1)) 
            block41_on_1 = 1'b1;
        else 
				block41_on_1 = 1'b0;
		end
		always_comb
    begin:block42_on_1_proc
        if (((DrawX - drop42X_1) <= 40)&& ((DrawX - drop42X_1) >=0) && ((DrawY - drop42Y_1) <= 40) && ((DrawY - drop42Y_1) >=0) && (arrow42_1[40 * (DrawY - drop42Y_1) + DrawX - drop42X_1] == 1'b1)) 
            block42_on_1 = 1'b1;
        else 
				block42_on_1 = 1'b0;
		end
		always_comb
    begin:block43_on_1_proc
        if (((DrawX - drop43X_1) <= 40)&& ((DrawX - drop43X_1) >=0) && ((DrawY - drop43Y_1) <= 40) && ((DrawY - drop43Y_1) >=0) && (arrow43_1[40 * (DrawY - drop43Y_1) + DrawX - drop43X_1] == 1'b1)) 
            block43_on_1 = 1'b1;
        else 
				block43_on_1 = 1'b0;
		end
		always_comb
    begin:block44_on_1_proc
        if (((DrawX - drop44X_1) <= 40)&& ((DrawX - drop44X_1) >=0) && ((DrawY - drop44Y_1) <= 40) && ((DrawY - drop44Y_1) >=0) && (arrow44_1[40 * (DrawY - drop44Y_1) + DrawX - drop44X_1] == 1'b1)) 
            block44_on_1 = 1'b1;
        else 
				block44_on_1 = 1'b0;
		end
		always_comb
    begin:block45_on_1_proc
        if (((DrawX - drop45X_1) <= 40)&& ((DrawX - drop45X_1) >=0) && ((DrawY - drop45Y_1) <= 40) && ((DrawY - drop45Y_1) >=0) && (arrow45_1[40 * (DrawY - drop45Y_1) + DrawX - drop45X_1] == 1'b1)) 
            block45_on_1 = 1'b1;
        else 
				block45_on_1 = 1'b0;
		end
	 always_comb
    begin:block46_on_1_proc
        if (((DrawX - drop46X_1) <= 40)&& ((DrawX - drop46X_1) >=0) && ((DrawY - drop46Y_1) <= 40) && ((DrawY - drop46Y_1) >=0) && (arrow46_1[40 * (DrawY - drop46Y_1) + DrawX - drop46X_1] == 1'b1)) 
            block46_on_1 = 1'b1;
        else 
				block46_on_1 = 1'b0;
		end
		
		always_comb
		begin:start_screen_text_proc
			if((DrawX >=110)&&(DrawX <=530)&&(DrawY >= 215)&&(DrawY <= 265)&&startscreen[(DrawY*640 + DrawX - 215*640)/640*420+((DrawY*640 + DrawX - 215*640) % 640-110)]==1'b1)
				start_screen_on = 1'b1;
			else
				start_screen_on = 1'b0;
		end
	  always_comb
	  begin:Background_on_proc
			if(DrawX <= 630 && DrawX >= 0 && DrawY <= 480 && DrawY >= 0)
				background_on = 1'b1;
			else
				background_on = 1'b0;
	  end
	  always_comb
	  begin:Background_floor_on_proc
				if(DrawX <= 630 && DrawX >= 0 && DrawY <= 480 && DrawY >= 416)
				floor_on = 1'b1;
			else
				floor_on = 1'b0;
	  end
	  always_comb
	  begin:Background_dark_floor_on_proc
				if(DrawX <= 630 && DrawX >= 0 && DrawY <= 416 && DrawY >= 400)
				base_on = 1'b1;
			else
				base_on = 1'b0;
	  end
	  always_comb
	  begin:grass_on_proc
				if(DrawX <= 630 && DrawX >= 0 && DrawY <= 400 && DrawY >= 384)
				grass_on = 1'b1;
			else
				grass_on = 1'b0;
	  end
	  always_comb
	  begin:pika_on_proc
			if(DrawX <= 379 && DrawX >= 264 && DrawY <= 384 && DrawY >= 234 && pika_color[(DrawY*640 + DrawX - 234*640)/640*115+((DrawY*640 + DrawX - 234*640) % 640-264)] == 1'b1)
				pika_on = 1'b1;
			else
				pika_on = 1'b0;
	  end
	  
	  
	  always_comb
	  begin:cloud_on_proc
				if(DrawX <= 74 && DrawX >= 57 && DrawY <= 80 && DrawY >= 70)
				cloud_on = 1'b1;
			else if (DrawX <= 83 && DrawX >= 48 && DrawY <= 98 && DrawY >= 80)
				cloud_on = 1'b1;
			else if (DrawX <= 155 && DrawX >= 120 && DrawY <= 73 && DrawY >= 58)
				cloud_on = 1'b1;
			else if (DrawX <= 171 && DrawX >= 104 && DrawY <= 102 && DrawY >= 73)
				cloud_on = 1'b1;
			else if (DrawX <= 357 && DrawX >= 322 && DrawY <= 190 && DrawY >= 175)
				cloud_on = 1'b1;
			else if (DrawX <= 371 && DrawX >= 305 && DrawY <= 218 && DrawY >= 190)
				cloud_on = 1'b1;
			else if (DrawX <= 480 && DrawX >= 460 && DrawY <= 119 && DrawY >= 109)
				cloud_on = 1'b1;
			else if (DrawX <= 487 && DrawX >= 453 && DrawY <= 138 && DrawY >= 119)
				cloud_on = 1'b1;
			else if (DrawX <= 560 && DrawX >= 525 && DrawY <= 113 && DrawY >= 100)
				cloud_on = 1'b1;
			else if (DrawX <= 575 && DrawX >= 508 && DrawY <= 140 && DrawY >= 113)
				cloud_on = 1'b1;
			else
				cloud_on = 1'b0;
	  end
    always_comb
	 begin:RGB_Display
		  if(((DrawY == 300 || DrawY == 400) && (DrawX >=379 && DrawX < 630)) || ((DrawY == 300 || DrawY == 400) && (DrawX >=0 && DrawX < 264)))
		  begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
		  end
		  else if ((win_on == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
			  end 
			  else if ((tie_on == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
			  end 
		  else if (start_screen_on == 1'b1)
		  begin
				Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
		  end
        else if ((block1_on == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
			  end 
		  else if ((block2_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
		  else if ((block3_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
		  else if ((block4_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
		  else if ((block5_on == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
			  end
		  else if ((block6_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
		  else if ((block7_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
		else if ((block8_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
			  else if ((block9_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block10_on == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block11_on == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
			  end
			  else if ((block12_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
			  else if ((block13_on == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
			  end
			  else if ((block14_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block15_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
			  else if ((block16_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
			  else if ((block17_on == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block18_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
			  else if ((block19_on == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block20_on == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block21_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block22_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block23_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
		  else if ((block24_on == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
			  end 
		  else if ((block25_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
		  else if ((block26_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
		  else if ((block27_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
		  else if ((block28_on == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
			  end
		  else if ((block29_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
		  else if ((block30_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
		else if ((block31_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
			  else if ((block32_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block33_on == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block34_on == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
			  end
			  else if ((block35_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
			  else if ((block36_on == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
			  end
			  else if ((block37_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block38_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
			  else if ((block39_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
			  else if ((block40_on == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block41_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
			  else if ((block42_on == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block43_on == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block44_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block45_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block46_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
			  else if ((block1_on_1 == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
			  end 
		  else if ((block2_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
		  else if ((block3_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
		  else if ((block4_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
		  else if ((block5_on_1 == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
			  end
		  else if ((block6_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
		  else if ((block7_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
		else if ((block8_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
			  else if ((block9_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block10_on_1 == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block11_on_1 == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
			  end
			  else if ((block12_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
			  else if ((block13_on_1 == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
			  end
			  else if ((block14_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block15_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
			  else if ((block16_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
			  else if ((block17_on_1 == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block18_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
			  else if ((block19_on_1 == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block20_on_1 == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block21_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block22_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block23_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
		  else if ((block24_on_1 == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
			  end 
		  else if ((block25_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
		  else if ((block26_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
		  else if ((block27_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
		  else if ((block28_on_1 == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
			  end
		  else if ((block29_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
		  else if ((block30_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
		else if ((block31_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
			  else if ((block32_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block33_on_1 == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block34_on_1 == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
			  end
			  else if ((block35_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
			  else if ((block36_on_1 == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
			  end
			  else if ((block37_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block38_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
			  else if ((block39_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
			  else if ((block40_on_1 == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block41_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
			  else if ((block42_on_1 == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block43_on_1 == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block44_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block45_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
			  end
			  else if ((block46_on_1 == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
			  end
			  else if(score_bar_left_on == 1'b1)
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
			  end
			  else if(score_bar_right_on == 1'b1)
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
			  end
			  else if(ten_on == 1'b1)
			  begin
			  Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
			  end
			  else if(decimal_on == 1'b1)
			  begin
			  Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
			  end
			  else if(ten2_on == 1'b1)
			  begin
			  Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
			  end
			  else if(decimal2_on == 1'b1)
			  begin
			  Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
			  end
		  else if ((pika_on == 1'b1))
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
			  end  
		  else if ((cloud_on == 1'b1))
			  begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'hff;
			  end  
		  else if ((grass_on == 1'b1))
			  begin
					Red = 8'h52;
					Green = 8'he7;
					Blue = 8'h87;
			  end  
		  else if ((base_on == 1'b1))
			  begin
					Red = 8'h91;
					Green = 8'h59;
					Blue = 8'h30;
			  end
		  else if ((floor_on == 1'b1))
			  begin
					Red = 8'hA1;
					Green = 8'h63;
					Blue = 8'h35;
			  end
		  else if ((background_on == 1'b1))
			  begin
					Red = 8'h73;
					Green = 8'hde;
					Blue = 8'hd7;
			  end
		  
        else 
			  begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h7f - DrawX[9:3];
			  end
	 end
endmodule
