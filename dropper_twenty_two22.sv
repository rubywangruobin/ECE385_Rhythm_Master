module dropper_twenty_two22(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop22X, drop22Y,
						 output [1599:0] arrow22,
						 output logic score22);
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
			score22 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <1500)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score22 = 1'b0;	
						else if ((keycode == 8'h52|| keycode_second == 8'h52) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score22 = 1'b1;
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
				if(counter < 1500)
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
    assign drop22X = arrow_X_Pos;
   
    assign drop22Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow22 <= 1'b0;
	 if(finish_on == 0)
	 begin
	 arrow22[418] <= 1'b1;
arrow22[419] <= 1'b1;
arrow22[458] <= 1'b1;
arrow22[459] <= 1'b1;
arrow22[496] <= 1'b1;
arrow22[497] <= 1'b1;
arrow22[498] <= 1'b1;
arrow22[499] <= 1'b1;
arrow22[500] <= 1'b1;
arrow22[501] <= 1'b1;
arrow22[536] <= 1'b1;
arrow22[537] <= 1'b1;
arrow22[538] <= 1'b1;
arrow22[539] <= 1'b1;
arrow22[540] <= 1'b1;
arrow22[541] <= 1'b1;
arrow22[574] <= 1'b1;
arrow22[575] <= 1'b1;
arrow22[576] <= 1'b1;
arrow22[577] <= 1'b1;
arrow22[578] <= 1'b1;
arrow22[579] <= 1'b1;
arrow22[580] <= 1'b1;
arrow22[581] <= 1'b1;
arrow22[582] <= 1'b1;
arrow22[583] <= 1'b1;
arrow22[614] <= 1'b1;
arrow22[615] <= 1'b1;
arrow22[616] <= 1'b1;
arrow22[617] <= 1'b1;
arrow22[618] <= 1'b1;
arrow22[619] <= 1'b1;
arrow22[620] <= 1'b1;
arrow22[621] <= 1'b1;
arrow22[622] <= 1'b1;
arrow22[623] <= 1'b1;
arrow22[652] <= 1'b1;
arrow22[653] <= 1'b1;
arrow22[654] <= 1'b1;
arrow22[655] <= 1'b1;
arrow22[656] <= 1'b1;
arrow22[657] <= 1'b1;
arrow22[658] <= 1'b1;
arrow22[659] <= 1'b1;
arrow22[660] <= 1'b1;
arrow22[661] <= 1'b1;
arrow22[662] <= 1'b1;
arrow22[663] <= 1'b1;
arrow22[664] <= 1'b1;
arrow22[665] <= 1'b1;
arrow22[692] <= 1'b1;
arrow22[693] <= 1'b1;
arrow22[694] <= 1'b1;
arrow22[695] <= 1'b1;
arrow22[696] <= 1'b1;
arrow22[697] <= 1'b1;
arrow22[698] <= 1'b1;
arrow22[699] <= 1'b1;
arrow22[700] <= 1'b1;
arrow22[701] <= 1'b1;
arrow22[702] <= 1'b1;
arrow22[703] <= 1'b1;
arrow22[704] <= 1'b1;
arrow22[705] <= 1'b1;
arrow22[730] <= 1'b1;
arrow22[731] <= 1'b1;
arrow22[732] <= 1'b1;
arrow22[733] <= 1'b1;
arrow22[734] <= 1'b1;
arrow22[735] <= 1'b1;
arrow22[736] <= 1'b1;
arrow22[737] <= 1'b1;
arrow22[738] <= 1'b1;
arrow22[739] <= 1'b1;
arrow22[740] <= 1'b1;
arrow22[741] <= 1'b1;
arrow22[742] <= 1'b1;
arrow22[743] <= 1'b1;
arrow22[744] <= 1'b1;
arrow22[745] <= 1'b1;
arrow22[746] <= 1'b1;
arrow22[747] <= 1'b1;
arrow22[770] <= 1'b1;
arrow22[771] <= 1'b1;
arrow22[772] <= 1'b1;
arrow22[773] <= 1'b1;
arrow22[774] <= 1'b1;
arrow22[775] <= 1'b1;
arrow22[776] <= 1'b1;
arrow22[777] <= 1'b1;
arrow22[778] <= 1'b1;
arrow22[779] <= 1'b1;
arrow22[780] <= 1'b1;
arrow22[781] <= 1'b1;
arrow22[782] <= 1'b1;
arrow22[783] <= 1'b1;
arrow22[784] <= 1'b1;
arrow22[785] <= 1'b1;
arrow22[786] <= 1'b1;
arrow22[787] <= 1'b1;
arrow22[816] <= 1'b1;
arrow22[817] <= 1'b1;
arrow22[818] <= 1'b1;
arrow22[819] <= 1'b1;
arrow22[820] <= 1'b1;
arrow22[821] <= 1'b1;
arrow22[856] <= 1'b1;
arrow22[857] <= 1'b1;
arrow22[858] <= 1'b1;
arrow22[859] <= 1'b1;
arrow22[860] <= 1'b1;
arrow22[861] <= 1'b1;
arrow22[896] <= 1'b1;
arrow22[897] <= 1'b1;
arrow22[898] <= 1'b1;
arrow22[899] <= 1'b1;
arrow22[900] <= 1'b1;
arrow22[901] <= 1'b1;
arrow22[936] <= 1'b1;
arrow22[937] <= 1'b1;
arrow22[938] <= 1'b1;
arrow22[939] <= 1'b1;
arrow22[940] <= 1'b1;
arrow22[941] <= 1'b1;
arrow22[976] <= 1'b1;
arrow22[977] <= 1'b1;
arrow22[978] <= 1'b1;
arrow22[979] <= 1'b1;
arrow22[980] <= 1'b1;
arrow22[981] <= 1'b1;
arrow22[1016] <= 1'b1;
arrow22[1017] <= 1'b1;
arrow22[1018] <= 1'b1;
arrow22[1019] <= 1'b1;
arrow22[1020] <= 1'b1;
arrow22[1021] <= 1'b1;
arrow22[1056] <= 1'b1;
arrow22[1057] <= 1'b1;
arrow22[1058] <= 1'b1;
arrow22[1059] <= 1'b1;
arrow22[1060] <= 1'b1;
arrow22[1061] <= 1'b1;
arrow22[1096] <= 1'b1;
arrow22[1097] <= 1'b1;
arrow22[1098] <= 1'b1;
arrow22[1099] <= 1'b1;
arrow22[1100] <= 1'b1;
arrow22[1101] <= 1'b1;
arrow22[1136] <= 1'b1;
arrow22[1137] <= 1'b1;
arrow22[1138] <= 1'b1;
arrow22[1139] <= 1'b1;
arrow22[1140] <= 1'b1;
arrow22[1141] <= 1'b1;
arrow22[1176] <= 1'b1;
arrow22[1177] <= 1'b1;
arrow22[1178] <= 1'b1;
arrow22[1179] <= 1'b1;
arrow22[1180] <= 1'b1;
arrow22[1181] <= 1'b1;
arrow22[1216] <= 1'b1;
arrow22[1217] <= 1'b1;
arrow22[1218] <= 1'b1;
arrow22[1219] <= 1'b1;
arrow22[1220] <= 1'b1;
arrow22[1221] <= 1'b1;
arrow22[1256] <= 1'b1;
arrow22[1257] <= 1'b1;
arrow22[1258] <= 1'b1;
arrow22[1259] <= 1'b1;
arrow22[1260] <= 1'b1;
arrow22[1261] <= 1'b1;


	 end
   else
		 arrow22 <= 1'b0;
end
endmodule