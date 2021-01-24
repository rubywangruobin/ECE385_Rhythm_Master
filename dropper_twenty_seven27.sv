module dropper_twenty_seven27(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop27X, drop27Y,
						 output [1599:0] arrow27,
						 output logic score27);
	logic [9:0] arrow_X_Pos, arrow_Y_Pos, arrow_Y_Motion;
	logic [11:0] counter;
    parameter [9:0] X_start=440;  // Center position on the X axis
    parameter [9:0] Y_start=100;  // Center position on the Y axis
    parameter [9:0] Y_Max=400;     // Bottommost point on the Y axis
	 logic finish_on;
	 enum logic [3:0] {Halted, Normal, End} State, Next_state;
	 
	 always_ff @ (posedge frame_clk )
    begin
		if(Reset)
		begin
			State <= Halted;
		end	
		else if(State == Halted)
		begin
			counter = 0;
			score27 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <1940)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score27 = 1'b0;	
						else if ((keycode == 8'h52|| keycode_second == 8'h52) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score27 = 1'b1;
						else
						begin
							arrow_Y_Pos = (arrow_Y_Pos + arrow_Y_Motion); 
							counter = counter + 1;
						end
					end
				State <= Next_state;
			end
		else
			State <= Next_state;
    end
	 
	 always_comb
	 begin
		Next_state = State;
		finish_on = 1'b0;
		arrow_X_Pos = X_start;
		unique case(State)
			Halted:
			begin
				finish_on = 1'b0;
				if(keycode == 8'h2c)
					Next_state = Normal;
			end
			Normal:
				begin
				if(counter < 1940)
				begin
					Next_state = Normal;
					end
				else
					begin
						if ( (arrow_Y_Pos + 40) >= Y_Max )  
							begin
									finish_on = 1'b1; 
									Next_state = End;
							end
						 else if ((keycode == 8'h52|| keycode_second == 8'h52) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							begin
									finish_on = 1'b1;
									Next_state = End;
							end
						 else
							begin
								  Next_state = Normal;
							end
					end
				end
			End:
				begin
				finish_on = 1;
				if(keycode == 8'h01)
					Next_state = Halted;
				end
		endcase
					
	 end
    assign drop27X = arrow_X_Pos;
   
    assign drop27Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow27 <= 1'b0;
	 if(finish_on == 0)
	 begin
	 arrow27[418] <= 1'b1;
arrow27[419] <= 1'b1;
arrow27[458] <= 1'b1;
arrow27[459] <= 1'b1;
arrow27[496] <= 1'b1;
arrow27[497] <= 1'b1;
arrow27[498] <= 1'b1;
arrow27[499] <= 1'b1;
arrow27[500] <= 1'b1;
arrow27[501] <= 1'b1;
arrow27[536] <= 1'b1;
arrow27[537] <= 1'b1;
arrow27[538] <= 1'b1;
arrow27[539] <= 1'b1;
arrow27[540] <= 1'b1;
arrow27[541] <= 1'b1;
arrow27[574] <= 1'b1;
arrow27[575] <= 1'b1;
arrow27[576] <= 1'b1;
arrow27[577] <= 1'b1;
arrow27[578] <= 1'b1;
arrow27[579] <= 1'b1;
arrow27[580] <= 1'b1;
arrow27[581] <= 1'b1;
arrow27[582] <= 1'b1;
arrow27[583] <= 1'b1;
arrow27[614] <= 1'b1;
arrow27[615] <= 1'b1;
arrow27[616] <= 1'b1;
arrow27[617] <= 1'b1;
arrow27[618] <= 1'b1;
arrow27[619] <= 1'b1;
arrow27[620] <= 1'b1;
arrow27[621] <= 1'b1;
arrow27[622] <= 1'b1;
arrow27[623] <= 1'b1;
arrow27[652] <= 1'b1;
arrow27[653] <= 1'b1;
arrow27[654] <= 1'b1;
arrow27[655] <= 1'b1;
arrow27[656] <= 1'b1;
arrow27[657] <= 1'b1;
arrow27[658] <= 1'b1;
arrow27[659] <= 1'b1;
arrow27[660] <= 1'b1;
arrow27[661] <= 1'b1;
arrow27[662] <= 1'b1;
arrow27[663] <= 1'b1;
arrow27[664] <= 1'b1;
arrow27[665] <= 1'b1;
arrow27[692] <= 1'b1;
arrow27[693] <= 1'b1;
arrow27[694] <= 1'b1;
arrow27[695] <= 1'b1;
arrow27[696] <= 1'b1;
arrow27[697] <= 1'b1;
arrow27[698] <= 1'b1;
arrow27[699] <= 1'b1;
arrow27[700] <= 1'b1;
arrow27[701] <= 1'b1;
arrow27[702] <= 1'b1;
arrow27[703] <= 1'b1;
arrow27[704] <= 1'b1;
arrow27[705] <= 1'b1;
arrow27[730] <= 1'b1;
arrow27[731] <= 1'b1;
arrow27[732] <= 1'b1;
arrow27[733] <= 1'b1;
arrow27[734] <= 1'b1;
arrow27[735] <= 1'b1;
arrow27[736] <= 1'b1;
arrow27[737] <= 1'b1;
arrow27[738] <= 1'b1;
arrow27[739] <= 1'b1;
arrow27[740] <= 1'b1;
arrow27[741] <= 1'b1;
arrow27[742] <= 1'b1;
arrow27[743] <= 1'b1;
arrow27[744] <= 1'b1;
arrow27[745] <= 1'b1;
arrow27[746] <= 1'b1;
arrow27[747] <= 1'b1;
arrow27[770] <= 1'b1;
arrow27[771] <= 1'b1;
arrow27[772] <= 1'b1;
arrow27[773] <= 1'b1;
arrow27[774] <= 1'b1;
arrow27[775] <= 1'b1;
arrow27[776] <= 1'b1;
arrow27[777] <= 1'b1;
arrow27[778] <= 1'b1;
arrow27[779] <= 1'b1;
arrow27[780] <= 1'b1;
arrow27[781] <= 1'b1;
arrow27[782] <= 1'b1;
arrow27[783] <= 1'b1;
arrow27[784] <= 1'b1;
arrow27[785] <= 1'b1;
arrow27[786] <= 1'b1;
arrow27[787] <= 1'b1;
arrow27[816] <= 1'b1;
arrow27[817] <= 1'b1;
arrow27[818] <= 1'b1;
arrow27[819] <= 1'b1;
arrow27[820] <= 1'b1;
arrow27[821] <= 1'b1;
arrow27[856] <= 1'b1;
arrow27[857] <= 1'b1;
arrow27[858] <= 1'b1;
arrow27[859] <= 1'b1;
arrow27[860] <= 1'b1;
arrow27[861] <= 1'b1;
arrow27[896] <= 1'b1;
arrow27[897] <= 1'b1;
arrow27[898] <= 1'b1;
arrow27[899] <= 1'b1;
arrow27[900] <= 1'b1;
arrow27[901] <= 1'b1;
arrow27[936] <= 1'b1;
arrow27[937] <= 1'b1;
arrow27[938] <= 1'b1;
arrow27[939] <= 1'b1;
arrow27[940] <= 1'b1;
arrow27[941] <= 1'b1;
arrow27[976] <= 1'b1;
arrow27[977] <= 1'b1;
arrow27[978] <= 1'b1;
arrow27[979] <= 1'b1;
arrow27[980] <= 1'b1;
arrow27[981] <= 1'b1;
arrow27[1016] <= 1'b1;
arrow27[1017] <= 1'b1;
arrow27[1018] <= 1'b1;
arrow27[1019] <= 1'b1;
arrow27[1020] <= 1'b1;
arrow27[1021] <= 1'b1;
arrow27[1056] <= 1'b1;
arrow27[1057] <= 1'b1;
arrow27[1058] <= 1'b1;
arrow27[1059] <= 1'b1;
arrow27[1060] <= 1'b1;
arrow27[1061] <= 1'b1;
arrow27[1096] <= 1'b1;
arrow27[1097] <= 1'b1;
arrow27[1098] <= 1'b1;
arrow27[1099] <= 1'b1;
arrow27[1100] <= 1'b1;
arrow27[1101] <= 1'b1;
arrow27[1136] <= 1'b1;
arrow27[1137] <= 1'b1;
arrow27[1138] <= 1'b1;
arrow27[1139] <= 1'b1;
arrow27[1140] <= 1'b1;
arrow27[1141] <= 1'b1;
arrow27[1176] <= 1'b1;
arrow27[1177] <= 1'b1;
arrow27[1178] <= 1'b1;
arrow27[1179] <= 1'b1;
arrow27[1180] <= 1'b1;
arrow27[1181] <= 1'b1;
arrow27[1216] <= 1'b1;
arrow27[1217] <= 1'b1;
arrow27[1218] <= 1'b1;
arrow27[1219] <= 1'b1;
arrow27[1220] <= 1'b1;
arrow27[1221] <= 1'b1;
arrow27[1256] <= 1'b1;
arrow27[1257] <= 1'b1;
arrow27[1258] <= 1'b1;
arrow27[1259] <= 1'b1;
arrow27[1260] <= 1'b1;
arrow27[1261] <= 1'b1;



	 end
   else
		 arrow27 <= 1'b0;
end
endmodule