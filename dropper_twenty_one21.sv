module dropper_twenty_one21(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop21X, drop21Y,
						 output [1599:0] arrow21,
						 output logic score21);
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
			score21 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <1440)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score21 = 1'b0;	
						else if ((keycode == 8'h52|| keycode_second == 8'h52) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score21 = 1'b1;
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
				if(counter < 1440)
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
    assign drop21X = arrow_X_Pos;
   
    assign drop21Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow21 <= 1'b0;
	 if(finish_on == 0)
	 begin
	 arrow21[418] <= 1'b1;
arrow21[419] <= 1'b1;
arrow21[458] <= 1'b1;
arrow21[459] <= 1'b1;
arrow21[496] <= 1'b1;
arrow21[497] <= 1'b1;
arrow21[498] <= 1'b1;
arrow21[499] <= 1'b1;
arrow21[500] <= 1'b1;
arrow21[501] <= 1'b1;
arrow21[536] <= 1'b1;
arrow21[537] <= 1'b1;
arrow21[538] <= 1'b1;
arrow21[539] <= 1'b1;
arrow21[540] <= 1'b1;
arrow21[541] <= 1'b1;
arrow21[574] <= 1'b1;
arrow21[575] <= 1'b1;
arrow21[576] <= 1'b1;
arrow21[577] <= 1'b1;
arrow21[578] <= 1'b1;
arrow21[579] <= 1'b1;
arrow21[580] <= 1'b1;
arrow21[581] <= 1'b1;
arrow21[582] <= 1'b1;
arrow21[583] <= 1'b1;
arrow21[614] <= 1'b1;
arrow21[615] <= 1'b1;
arrow21[616] <= 1'b1;
arrow21[617] <= 1'b1;
arrow21[618] <= 1'b1;
arrow21[619] <= 1'b1;
arrow21[620] <= 1'b1;
arrow21[621] <= 1'b1;
arrow21[622] <= 1'b1;
arrow21[623] <= 1'b1;
arrow21[652] <= 1'b1;
arrow21[653] <= 1'b1;
arrow21[654] <= 1'b1;
arrow21[655] <= 1'b1;
arrow21[656] <= 1'b1;
arrow21[657] <= 1'b1;
arrow21[658] <= 1'b1;
arrow21[659] <= 1'b1;
arrow21[660] <= 1'b1;
arrow21[661] <= 1'b1;
arrow21[662] <= 1'b1;
arrow21[663] <= 1'b1;
arrow21[664] <= 1'b1;
arrow21[665] <= 1'b1;
arrow21[692] <= 1'b1;
arrow21[693] <= 1'b1;
arrow21[694] <= 1'b1;
arrow21[695] <= 1'b1;
arrow21[696] <= 1'b1;
arrow21[697] <= 1'b1;
arrow21[698] <= 1'b1;
arrow21[699] <= 1'b1;
arrow21[700] <= 1'b1;
arrow21[701] <= 1'b1;
arrow21[702] <= 1'b1;
arrow21[703] <= 1'b1;
arrow21[704] <= 1'b1;
arrow21[705] <= 1'b1;
arrow21[730] <= 1'b1;
arrow21[731] <= 1'b1;
arrow21[732] <= 1'b1;
arrow21[733] <= 1'b1;
arrow21[734] <= 1'b1;
arrow21[735] <= 1'b1;
arrow21[736] <= 1'b1;
arrow21[737] <= 1'b1;
arrow21[738] <= 1'b1;
arrow21[739] <= 1'b1;
arrow21[740] <= 1'b1;
arrow21[741] <= 1'b1;
arrow21[742] <= 1'b1;
arrow21[743] <= 1'b1;
arrow21[744] <= 1'b1;
arrow21[745] <= 1'b1;
arrow21[746] <= 1'b1;
arrow21[747] <= 1'b1;
arrow21[770] <= 1'b1;
arrow21[771] <= 1'b1;
arrow21[772] <= 1'b1;
arrow21[773] <= 1'b1;
arrow21[774] <= 1'b1;
arrow21[775] <= 1'b1;
arrow21[776] <= 1'b1;
arrow21[777] <= 1'b1;
arrow21[778] <= 1'b1;
arrow21[779] <= 1'b1;
arrow21[780] <= 1'b1;
arrow21[781] <= 1'b1;
arrow21[782] <= 1'b1;
arrow21[783] <= 1'b1;
arrow21[784] <= 1'b1;
arrow21[785] <= 1'b1;
arrow21[786] <= 1'b1;
arrow21[787] <= 1'b1;
arrow21[816] <= 1'b1;
arrow21[817] <= 1'b1;
arrow21[818] <= 1'b1;
arrow21[819] <= 1'b1;
arrow21[820] <= 1'b1;
arrow21[821] <= 1'b1;
arrow21[856] <= 1'b1;
arrow21[857] <= 1'b1;
arrow21[858] <= 1'b1;
arrow21[859] <= 1'b1;
arrow21[860] <= 1'b1;
arrow21[861] <= 1'b1;
arrow21[896] <= 1'b1;
arrow21[897] <= 1'b1;
arrow21[898] <= 1'b1;
arrow21[899] <= 1'b1;
arrow21[900] <= 1'b1;
arrow21[901] <= 1'b1;
arrow21[936] <= 1'b1;
arrow21[937] <= 1'b1;
arrow21[938] <= 1'b1;
arrow21[939] <= 1'b1;
arrow21[940] <= 1'b1;
arrow21[941] <= 1'b1;
arrow21[976] <= 1'b1;
arrow21[977] <= 1'b1;
arrow21[978] <= 1'b1;
arrow21[979] <= 1'b1;
arrow21[980] <= 1'b1;
arrow21[981] <= 1'b1;
arrow21[1016] <= 1'b1;
arrow21[1017] <= 1'b1;
arrow21[1018] <= 1'b1;
arrow21[1019] <= 1'b1;
arrow21[1020] <= 1'b1;
arrow21[1021] <= 1'b1;
arrow21[1056] <= 1'b1;
arrow21[1057] <= 1'b1;
arrow21[1058] <= 1'b1;
arrow21[1059] <= 1'b1;
arrow21[1060] <= 1'b1;
arrow21[1061] <= 1'b1;
arrow21[1096] <= 1'b1;
arrow21[1097] <= 1'b1;
arrow21[1098] <= 1'b1;
arrow21[1099] <= 1'b1;
arrow21[1100] <= 1'b1;
arrow21[1101] <= 1'b1;
arrow21[1136] <= 1'b1;
arrow21[1137] <= 1'b1;
arrow21[1138] <= 1'b1;
arrow21[1139] <= 1'b1;
arrow21[1140] <= 1'b1;
arrow21[1141] <= 1'b1;
arrow21[1176] <= 1'b1;
arrow21[1177] <= 1'b1;
arrow21[1178] <= 1'b1;
arrow21[1179] <= 1'b1;
arrow21[1180] <= 1'b1;
arrow21[1181] <= 1'b1;
arrow21[1216] <= 1'b1;
arrow21[1217] <= 1'b1;
arrow21[1218] <= 1'b1;
arrow21[1219] <= 1'b1;
arrow21[1220] <= 1'b1;
arrow21[1221] <= 1'b1;
arrow21[1256] <= 1'b1;
arrow21[1257] <= 1'b1;
arrow21[1258] <= 1'b1;
arrow21[1259] <= 1'b1;
arrow21[1260] <= 1'b1;
arrow21[1261] <= 1'b1;


	 end
   else
		 arrow21 <= 1'b0;
end
endmodule