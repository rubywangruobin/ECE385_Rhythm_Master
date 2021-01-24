module dropper_thirty_two(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop32X, drop32Y,
						 output [1599:0] arrow32,
						 output logic score32);
	logic [9:0] arrow_X_Pos, arrow_Y_Pos, arrow_Y_Motion;
	logic [11:0] counter;
    parameter [9:0] X_start=100;  // Center position on the X axis
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
			score32 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <2240)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score32 = 1'b0;	
						else if ((keycode == 8'h1a|| keycode_second == 8'h1a) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score32 = 1'b1;
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
				if(counter < 2240)
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
						 else if ((keycode == 8'h1a|| keycode_second == 8'h1a) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
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
    assign drop32X = arrow_X_Pos;
   
    assign drop32Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow32 <= 1'b0;
	 if(finish_on == 0)
	 begin
	 arrow32[418] <= 1'b1;
arrow32[419] <= 1'b1;
arrow32[458] <= 1'b1;
arrow32[459] <= 1'b1;
arrow32[496] <= 1'b1;
arrow32[497] <= 1'b1;
arrow32[498] <= 1'b1;
arrow32[499] <= 1'b1;
arrow32[500] <= 1'b1;
arrow32[501] <= 1'b1;
arrow32[536] <= 1'b1;
arrow32[537] <= 1'b1;
arrow32[538] <= 1'b1;
arrow32[539] <= 1'b1;
arrow32[540] <= 1'b1;
arrow32[541] <= 1'b1;
arrow32[574] <= 1'b1;
arrow32[575] <= 1'b1;
arrow32[576] <= 1'b1;
arrow32[577] <= 1'b1;
arrow32[578] <= 1'b1;
arrow32[579] <= 1'b1;
arrow32[580] <= 1'b1;
arrow32[581] <= 1'b1;
arrow32[582] <= 1'b1;
arrow32[583] <= 1'b1;
arrow32[614] <= 1'b1;
arrow32[615] <= 1'b1;
arrow32[616] <= 1'b1;
arrow32[617] <= 1'b1;
arrow32[618] <= 1'b1;
arrow32[619] <= 1'b1;
arrow32[620] <= 1'b1;
arrow32[621] <= 1'b1;
arrow32[622] <= 1'b1;
arrow32[623] <= 1'b1;
arrow32[652] <= 1'b1;
arrow32[653] <= 1'b1;
arrow32[654] <= 1'b1;
arrow32[655] <= 1'b1;
arrow32[656] <= 1'b1;
arrow32[657] <= 1'b1;
arrow32[658] <= 1'b1;
arrow32[659] <= 1'b1;
arrow32[660] <= 1'b1;
arrow32[661] <= 1'b1;
arrow32[662] <= 1'b1;
arrow32[663] <= 1'b1;
arrow32[664] <= 1'b1;
arrow32[665] <= 1'b1;
arrow32[692] <= 1'b1;
arrow32[693] <= 1'b1;
arrow32[694] <= 1'b1;
arrow32[695] <= 1'b1;
arrow32[696] <= 1'b1;
arrow32[697] <= 1'b1;
arrow32[698] <= 1'b1;
arrow32[699] <= 1'b1;
arrow32[700] <= 1'b1;
arrow32[701] <= 1'b1;
arrow32[702] <= 1'b1;
arrow32[703] <= 1'b1;
arrow32[704] <= 1'b1;
arrow32[705] <= 1'b1;
arrow32[730] <= 1'b1;
arrow32[731] <= 1'b1;
arrow32[732] <= 1'b1;
arrow32[733] <= 1'b1;
arrow32[734] <= 1'b1;
arrow32[735] <= 1'b1;
arrow32[736] <= 1'b1;
arrow32[737] <= 1'b1;
arrow32[738] <= 1'b1;
arrow32[739] <= 1'b1;
arrow32[740] <= 1'b1;
arrow32[741] <= 1'b1;
arrow32[742] <= 1'b1;
arrow32[743] <= 1'b1;
arrow32[744] <= 1'b1;
arrow32[745] <= 1'b1;
arrow32[746] <= 1'b1;
arrow32[747] <= 1'b1;
arrow32[770] <= 1'b1;
arrow32[771] <= 1'b1;
arrow32[772] <= 1'b1;
arrow32[773] <= 1'b1;
arrow32[774] <= 1'b1;
arrow32[775] <= 1'b1;
arrow32[776] <= 1'b1;
arrow32[777] <= 1'b1;
arrow32[778] <= 1'b1;
arrow32[779] <= 1'b1;
arrow32[780] <= 1'b1;
arrow32[781] <= 1'b1;
arrow32[782] <= 1'b1;
arrow32[783] <= 1'b1;
arrow32[784] <= 1'b1;
arrow32[785] <= 1'b1;
arrow32[786] <= 1'b1;
arrow32[787] <= 1'b1;
arrow32[816] <= 1'b1;
arrow32[817] <= 1'b1;
arrow32[818] <= 1'b1;
arrow32[819] <= 1'b1;
arrow32[820] <= 1'b1;
arrow32[821] <= 1'b1;
arrow32[856] <= 1'b1;
arrow32[857] <= 1'b1;
arrow32[858] <= 1'b1;
arrow32[859] <= 1'b1;
arrow32[860] <= 1'b1;
arrow32[861] <= 1'b1;
arrow32[896] <= 1'b1;
arrow32[897] <= 1'b1;
arrow32[898] <= 1'b1;
arrow32[899] <= 1'b1;
arrow32[900] <= 1'b1;
arrow32[901] <= 1'b1;
arrow32[936] <= 1'b1;
arrow32[937] <= 1'b1;
arrow32[938] <= 1'b1;
arrow32[939] <= 1'b1;
arrow32[940] <= 1'b1;
arrow32[941] <= 1'b1;
arrow32[976] <= 1'b1;
arrow32[977] <= 1'b1;
arrow32[978] <= 1'b1;
arrow32[979] <= 1'b1;
arrow32[980] <= 1'b1;
arrow32[981] <= 1'b1;
arrow32[1016] <= 1'b1;
arrow32[1017] <= 1'b1;
arrow32[1018] <= 1'b1;
arrow32[1019] <= 1'b1;
arrow32[1020] <= 1'b1;
arrow32[1021] <= 1'b1;
arrow32[1056] <= 1'b1;
arrow32[1057] <= 1'b1;
arrow32[1058] <= 1'b1;
arrow32[1059] <= 1'b1;
arrow32[1060] <= 1'b1;
arrow32[1061] <= 1'b1;
arrow32[1096] <= 1'b1;
arrow32[1097] <= 1'b1;
arrow32[1098] <= 1'b1;
arrow32[1099] <= 1'b1;
arrow32[1100] <= 1'b1;
arrow32[1101] <= 1'b1;
arrow32[1136] <= 1'b1;
arrow32[1137] <= 1'b1;
arrow32[1138] <= 1'b1;
arrow32[1139] <= 1'b1;
arrow32[1140] <= 1'b1;
arrow32[1141] <= 1'b1;
arrow32[1176] <= 1'b1;
arrow32[1177] <= 1'b1;
arrow32[1178] <= 1'b1;
arrow32[1179] <= 1'b1;
arrow32[1180] <= 1'b1;
arrow32[1181] <= 1'b1;
arrow32[1216] <= 1'b1;
arrow32[1217] <= 1'b1;
arrow32[1218] <= 1'b1;
arrow32[1219] <= 1'b1;
arrow32[1220] <= 1'b1;
arrow32[1221] <= 1'b1;
arrow32[1256] <= 1'b1;
arrow32[1257] <= 1'b1;
arrow32[1258] <= 1'b1;
arrow32[1259] <= 1'b1;
arrow32[1260] <= 1'b1;
arrow32[1261] <= 1'b1;


	 end
   else
		 arrow32 <= 1'b0;
end
endmodule