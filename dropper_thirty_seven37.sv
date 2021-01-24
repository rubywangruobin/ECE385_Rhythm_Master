module dropper_thirty_seven37(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop37X, drop37Y,
						 output [1599:0] arrow37,
						 output logic score37);
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
			score37 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <2680)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score37 = 1'b0;	
						else if ((keycode == 8'h52|| keycode_second == 8'h52) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score37 = 1'b1;
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
				if(counter < 2680)
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
    assign drop37X = arrow_X_Pos;
   
    assign drop37Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow37 <= 1'b0;
	 if(finish_on == 0)
	 begin
	 arrow37[418] <= 1'b1;
arrow37[419] <= 1'b1;
arrow37[458] <= 1'b1;
arrow37[459] <= 1'b1;
arrow37[496] <= 1'b1;
arrow37[497] <= 1'b1;
arrow37[498] <= 1'b1;
arrow37[499] <= 1'b1;
arrow37[500] <= 1'b1;
arrow37[501] <= 1'b1;
arrow37[536] <= 1'b1;
arrow37[537] <= 1'b1;
arrow37[538] <= 1'b1;
arrow37[539] <= 1'b1;
arrow37[540] <= 1'b1;
arrow37[541] <= 1'b1;
arrow37[574] <= 1'b1;
arrow37[575] <= 1'b1;
arrow37[576] <= 1'b1;
arrow37[577] <= 1'b1;
arrow37[578] <= 1'b1;
arrow37[579] <= 1'b1;
arrow37[580] <= 1'b1;
arrow37[581] <= 1'b1;
arrow37[582] <= 1'b1;
arrow37[583] <= 1'b1;
arrow37[614] <= 1'b1;
arrow37[615] <= 1'b1;
arrow37[616] <= 1'b1;
arrow37[617] <= 1'b1;
arrow37[618] <= 1'b1;
arrow37[619] <= 1'b1;
arrow37[620] <= 1'b1;
arrow37[621] <= 1'b1;
arrow37[622] <= 1'b1;
arrow37[623] <= 1'b1;
arrow37[652] <= 1'b1;
arrow37[653] <= 1'b1;
arrow37[654] <= 1'b1;
arrow37[655] <= 1'b1;
arrow37[656] <= 1'b1;
arrow37[657] <= 1'b1;
arrow37[658] <= 1'b1;
arrow37[659] <= 1'b1;
arrow37[660] <= 1'b1;
arrow37[661] <= 1'b1;
arrow37[662] <= 1'b1;
arrow37[663] <= 1'b1;
arrow37[664] <= 1'b1;
arrow37[665] <= 1'b1;
arrow37[692] <= 1'b1;
arrow37[693] <= 1'b1;
arrow37[694] <= 1'b1;
arrow37[695] <= 1'b1;
arrow37[696] <= 1'b1;
arrow37[697] <= 1'b1;
arrow37[698] <= 1'b1;
arrow37[699] <= 1'b1;
arrow37[700] <= 1'b1;
arrow37[701] <= 1'b1;
arrow37[702] <= 1'b1;
arrow37[703] <= 1'b1;
arrow37[704] <= 1'b1;
arrow37[705] <= 1'b1;
arrow37[730] <= 1'b1;
arrow37[731] <= 1'b1;
arrow37[732] <= 1'b1;
arrow37[733] <= 1'b1;
arrow37[734] <= 1'b1;
arrow37[735] <= 1'b1;
arrow37[736] <= 1'b1;
arrow37[737] <= 1'b1;
arrow37[738] <= 1'b1;
arrow37[739] <= 1'b1;
arrow37[740] <= 1'b1;
arrow37[741] <= 1'b1;
arrow37[742] <= 1'b1;
arrow37[743] <= 1'b1;
arrow37[744] <= 1'b1;
arrow37[745] <= 1'b1;
arrow37[746] <= 1'b1;
arrow37[747] <= 1'b1;
arrow37[770] <= 1'b1;
arrow37[771] <= 1'b1;
arrow37[772] <= 1'b1;
arrow37[773] <= 1'b1;
arrow37[774] <= 1'b1;
arrow37[775] <= 1'b1;
arrow37[776] <= 1'b1;
arrow37[777] <= 1'b1;
arrow37[778] <= 1'b1;
arrow37[779] <= 1'b1;
arrow37[780] <= 1'b1;
arrow37[781] <= 1'b1;
arrow37[782] <= 1'b1;
arrow37[783] <= 1'b1;
arrow37[784] <= 1'b1;
arrow37[785] <= 1'b1;
arrow37[786] <= 1'b1;
arrow37[787] <= 1'b1;
arrow37[816] <= 1'b1;
arrow37[817] <= 1'b1;
arrow37[818] <= 1'b1;
arrow37[819] <= 1'b1;
arrow37[820] <= 1'b1;
arrow37[821] <= 1'b1;
arrow37[856] <= 1'b1;
arrow37[857] <= 1'b1;
arrow37[858] <= 1'b1;
arrow37[859] <= 1'b1;
arrow37[860] <= 1'b1;
arrow37[861] <= 1'b1;
arrow37[896] <= 1'b1;
arrow37[897] <= 1'b1;
arrow37[898] <= 1'b1;
arrow37[899] <= 1'b1;
arrow37[900] <= 1'b1;
arrow37[901] <= 1'b1;
arrow37[936] <= 1'b1;
arrow37[937] <= 1'b1;
arrow37[938] <= 1'b1;
arrow37[939] <= 1'b1;
arrow37[940] <= 1'b1;
arrow37[941] <= 1'b1;
arrow37[976] <= 1'b1;
arrow37[977] <= 1'b1;
arrow37[978] <= 1'b1;
arrow37[979] <= 1'b1;
arrow37[980] <= 1'b1;
arrow37[981] <= 1'b1;
arrow37[1016] <= 1'b1;
arrow37[1017] <= 1'b1;
arrow37[1018] <= 1'b1;
arrow37[1019] <= 1'b1;
arrow37[1020] <= 1'b1;
arrow37[1021] <= 1'b1;
arrow37[1056] <= 1'b1;
arrow37[1057] <= 1'b1;
arrow37[1058] <= 1'b1;
arrow37[1059] <= 1'b1;
arrow37[1060] <= 1'b1;
arrow37[1061] <= 1'b1;
arrow37[1096] <= 1'b1;
arrow37[1097] <= 1'b1;
arrow37[1098] <= 1'b1;
arrow37[1099] <= 1'b1;
arrow37[1100] <= 1'b1;
arrow37[1101] <= 1'b1;
arrow37[1136] <= 1'b1;
arrow37[1137] <= 1'b1;
arrow37[1138] <= 1'b1;
arrow37[1139] <= 1'b1;
arrow37[1140] <= 1'b1;
arrow37[1141] <= 1'b1;
arrow37[1176] <= 1'b1;
arrow37[1177] <= 1'b1;
arrow37[1178] <= 1'b1;
arrow37[1179] <= 1'b1;
arrow37[1180] <= 1'b1;
arrow37[1181] <= 1'b1;
arrow37[1216] <= 1'b1;
arrow37[1217] <= 1'b1;
arrow37[1218] <= 1'b1;
arrow37[1219] <= 1'b1;
arrow37[1220] <= 1'b1;
arrow37[1221] <= 1'b1;
arrow37[1256] <= 1'b1;
arrow37[1257] <= 1'b1;
arrow37[1258] <= 1'b1;
arrow37[1259] <= 1'b1;
arrow37[1260] <= 1'b1;
arrow37[1261] <= 1'b1;


	 end
   else
		 arrow37 <= 1'b0;
end
endmodule