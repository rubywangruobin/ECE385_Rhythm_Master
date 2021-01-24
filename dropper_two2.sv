module dropper_two2(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop2X, drop2Y,
						 output [1599:0] arrow2,
						 output logic score2);
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
			score2 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <160)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score2 = 1'b0;	
						else if ((keycode == 8'h52 || keycode_second == 8'h52) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score2 = 1'b1;
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
				if(counter < 160)
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
						 else if ((keycode == 8'h52 || keycode_second == 8'h52) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
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
    assign drop2X = arrow_X_Pos;
   
    assign drop2Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow2 <= 1'b0;
	 if(finish_on == 0)
	 begin
	 arrow2[418] <= 1'b1;
arrow2[419] <= 1'b1;
arrow2[458] <= 1'b1;
arrow2[459] <= 1'b1;
arrow2[496] <= 1'b1;
arrow2[497] <= 1'b1;
arrow2[498] <= 1'b1;
arrow2[499] <= 1'b1;
arrow2[500] <= 1'b1;
arrow2[501] <= 1'b1;
arrow2[536] <= 1'b1;
arrow2[537] <= 1'b1;
arrow2[538] <= 1'b1;
arrow2[539] <= 1'b1;
arrow2[540] <= 1'b1;
arrow2[541] <= 1'b1;
arrow2[574] <= 1'b1;
arrow2[575] <= 1'b1;
arrow2[576] <= 1'b1;
arrow2[577] <= 1'b1;
arrow2[578] <= 1'b1;
arrow2[579] <= 1'b1;
arrow2[580] <= 1'b1;
arrow2[581] <= 1'b1;
arrow2[582] <= 1'b1;
arrow2[583] <= 1'b1;
arrow2[614] <= 1'b1;
arrow2[615] <= 1'b1;
arrow2[616] <= 1'b1;
arrow2[617] <= 1'b1;
arrow2[618] <= 1'b1;
arrow2[619] <= 1'b1;
arrow2[620] <= 1'b1;
arrow2[621] <= 1'b1;
arrow2[622] <= 1'b1;
arrow2[623] <= 1'b1;
arrow2[652] <= 1'b1;
arrow2[653] <= 1'b1;
arrow2[654] <= 1'b1;
arrow2[655] <= 1'b1;
arrow2[656] <= 1'b1;
arrow2[657] <= 1'b1;
arrow2[658] <= 1'b1;
arrow2[659] <= 1'b1;
arrow2[660] <= 1'b1;
arrow2[661] <= 1'b1;
arrow2[662] <= 1'b1;
arrow2[663] <= 1'b1;
arrow2[664] <= 1'b1;
arrow2[665] <= 1'b1;
arrow2[692] <= 1'b1;
arrow2[693] <= 1'b1;
arrow2[694] <= 1'b1;
arrow2[695] <= 1'b1;
arrow2[696] <= 1'b1;
arrow2[697] <= 1'b1;
arrow2[698] <= 1'b1;
arrow2[699] <= 1'b1;
arrow2[700] <= 1'b1;
arrow2[701] <= 1'b1;
arrow2[702] <= 1'b1;
arrow2[703] <= 1'b1;
arrow2[704] <= 1'b1;
arrow2[705] <= 1'b1;
arrow2[730] <= 1'b1;
arrow2[731] <= 1'b1;
arrow2[732] <= 1'b1;
arrow2[733] <= 1'b1;
arrow2[734] <= 1'b1;
arrow2[735] <= 1'b1;
arrow2[736] <= 1'b1;
arrow2[737] <= 1'b1;
arrow2[738] <= 1'b1;
arrow2[739] <= 1'b1;
arrow2[740] <= 1'b1;
arrow2[741] <= 1'b1;
arrow2[742] <= 1'b1;
arrow2[743] <= 1'b1;
arrow2[744] <= 1'b1;
arrow2[745] <= 1'b1;
arrow2[746] <= 1'b1;
arrow2[747] <= 1'b1;
arrow2[770] <= 1'b1;
arrow2[771] <= 1'b1;
arrow2[772] <= 1'b1;
arrow2[773] <= 1'b1;
arrow2[774] <= 1'b1;
arrow2[775] <= 1'b1;
arrow2[776] <= 1'b1;
arrow2[777] <= 1'b1;
arrow2[778] <= 1'b1;
arrow2[779] <= 1'b1;
arrow2[780] <= 1'b1;
arrow2[781] <= 1'b1;
arrow2[782] <= 1'b1;
arrow2[783] <= 1'b1;
arrow2[784] <= 1'b1;
arrow2[785] <= 1'b1;
arrow2[786] <= 1'b1;
arrow2[787] <= 1'b1;
arrow2[816] <= 1'b1;
arrow2[817] <= 1'b1;
arrow2[818] <= 1'b1;
arrow2[819] <= 1'b1;
arrow2[820] <= 1'b1;
arrow2[821] <= 1'b1;
arrow2[856] <= 1'b1;
arrow2[857] <= 1'b1;
arrow2[858] <= 1'b1;
arrow2[859] <= 1'b1;
arrow2[860] <= 1'b1;
arrow2[861] <= 1'b1;
arrow2[896] <= 1'b1;
arrow2[897] <= 1'b1;
arrow2[898] <= 1'b1;
arrow2[899] <= 1'b1;
arrow2[900] <= 1'b1;
arrow2[901] <= 1'b1;
arrow2[936] <= 1'b1;
arrow2[937] <= 1'b1;
arrow2[938] <= 1'b1;
arrow2[939] <= 1'b1;
arrow2[940] <= 1'b1;
arrow2[941] <= 1'b1;
arrow2[976] <= 1'b1;
arrow2[977] <= 1'b1;
arrow2[978] <= 1'b1;
arrow2[979] <= 1'b1;
arrow2[980] <= 1'b1;
arrow2[981] <= 1'b1;
arrow2[1016] <= 1'b1;
arrow2[1017] <= 1'b1;
arrow2[1018] <= 1'b1;
arrow2[1019] <= 1'b1;
arrow2[1020] <= 1'b1;
arrow2[1021] <= 1'b1;
arrow2[1056] <= 1'b1;
arrow2[1057] <= 1'b1;
arrow2[1058] <= 1'b1;
arrow2[1059] <= 1'b1;
arrow2[1060] <= 1'b1;
arrow2[1061] <= 1'b1;
arrow2[1096] <= 1'b1;
arrow2[1097] <= 1'b1;
arrow2[1098] <= 1'b1;
arrow2[1099] <= 1'b1;
arrow2[1100] <= 1'b1;
arrow2[1101] <= 1'b1;
arrow2[1136] <= 1'b1;
arrow2[1137] <= 1'b1;
arrow2[1138] <= 1'b1;
arrow2[1139] <= 1'b1;
arrow2[1140] <= 1'b1;
arrow2[1141] <= 1'b1;
arrow2[1176] <= 1'b1;
arrow2[1177] <= 1'b1;
arrow2[1178] <= 1'b1;
arrow2[1179] <= 1'b1;
arrow2[1180] <= 1'b1;
arrow2[1181] <= 1'b1;
arrow2[1216] <= 1'b1;
arrow2[1217] <= 1'b1;
arrow2[1218] <= 1'b1;
arrow2[1219] <= 1'b1;
arrow2[1220] <= 1'b1;
arrow2[1221] <= 1'b1;
arrow2[1256] <= 1'b1;
arrow2[1257] <= 1'b1;
arrow2[1258] <= 1'b1;
arrow2[1259] <= 1'b1;
arrow2[1260] <= 1'b1;
arrow2[1261] <= 1'b1;


	 end
   else
		 arrow2 <= 1'b0;
end
endmodule