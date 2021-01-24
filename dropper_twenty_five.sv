module dropper_twenty_five(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop25X, drop25Y,
						 output [1599:0] arrow25,
						 output logic score25);
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
			score25 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <1820)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score25 = 1'b0;	
						else if ((keycode == 8'h1a|| keycode_second == 8'h1a) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score25 = 1'b1;
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
				if(counter < 1820)
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
    assign drop25X = arrow_X_Pos;
   
    assign drop25Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow25 <= 1'b0;
	 if(finish_on == 0)
	 begin
	 arrow25[418] <= 1'b1;
arrow25[419] <= 1'b1;
arrow25[458] <= 1'b1;
arrow25[459] <= 1'b1;
arrow25[496] <= 1'b1;
arrow25[497] <= 1'b1;
arrow25[498] <= 1'b1;
arrow25[499] <= 1'b1;
arrow25[500] <= 1'b1;
arrow25[501] <= 1'b1;
arrow25[536] <= 1'b1;
arrow25[537] <= 1'b1;
arrow25[538] <= 1'b1;
arrow25[539] <= 1'b1;
arrow25[540] <= 1'b1;
arrow25[541] <= 1'b1;
arrow25[574] <= 1'b1;
arrow25[575] <= 1'b1;
arrow25[576] <= 1'b1;
arrow25[577] <= 1'b1;
arrow25[578] <= 1'b1;
arrow25[579] <= 1'b1;
arrow25[580] <= 1'b1;
arrow25[581] <= 1'b1;
arrow25[582] <= 1'b1;
arrow25[583] <= 1'b1;
arrow25[614] <= 1'b1;
arrow25[615] <= 1'b1;
arrow25[616] <= 1'b1;
arrow25[617] <= 1'b1;
arrow25[618] <= 1'b1;
arrow25[619] <= 1'b1;
arrow25[620] <= 1'b1;
arrow25[621] <= 1'b1;
arrow25[622] <= 1'b1;
arrow25[623] <= 1'b1;
arrow25[652] <= 1'b1;
arrow25[653] <= 1'b1;
arrow25[654] <= 1'b1;
arrow25[655] <= 1'b1;
arrow25[656] <= 1'b1;
arrow25[657] <= 1'b1;
arrow25[658] <= 1'b1;
arrow25[659] <= 1'b1;
arrow25[660] <= 1'b1;
arrow25[661] <= 1'b1;
arrow25[662] <= 1'b1;
arrow25[663] <= 1'b1;
arrow25[664] <= 1'b1;
arrow25[665] <= 1'b1;
arrow25[692] <= 1'b1;
arrow25[693] <= 1'b1;
arrow25[694] <= 1'b1;
arrow25[695] <= 1'b1;
arrow25[696] <= 1'b1;
arrow25[697] <= 1'b1;
arrow25[698] <= 1'b1;
arrow25[699] <= 1'b1;
arrow25[700] <= 1'b1;
arrow25[701] <= 1'b1;
arrow25[702] <= 1'b1;
arrow25[703] <= 1'b1;
arrow25[704] <= 1'b1;
arrow25[705] <= 1'b1;
arrow25[730] <= 1'b1;
arrow25[731] <= 1'b1;
arrow25[732] <= 1'b1;
arrow25[733] <= 1'b1;
arrow25[734] <= 1'b1;
arrow25[735] <= 1'b1;
arrow25[736] <= 1'b1;
arrow25[737] <= 1'b1;
arrow25[738] <= 1'b1;
arrow25[739] <= 1'b1;
arrow25[740] <= 1'b1;
arrow25[741] <= 1'b1;
arrow25[742] <= 1'b1;
arrow25[743] <= 1'b1;
arrow25[744] <= 1'b1;
arrow25[745] <= 1'b1;
arrow25[746] <= 1'b1;
arrow25[747] <= 1'b1;
arrow25[770] <= 1'b1;
arrow25[771] <= 1'b1;
arrow25[772] <= 1'b1;
arrow25[773] <= 1'b1;
arrow25[774] <= 1'b1;
arrow25[775] <= 1'b1;
arrow25[776] <= 1'b1;
arrow25[777] <= 1'b1;
arrow25[778] <= 1'b1;
arrow25[779] <= 1'b1;
arrow25[780] <= 1'b1;
arrow25[781] <= 1'b1;
arrow25[782] <= 1'b1;
arrow25[783] <= 1'b1;
arrow25[784] <= 1'b1;
arrow25[785] <= 1'b1;
arrow25[786] <= 1'b1;
arrow25[787] <= 1'b1;
arrow25[816] <= 1'b1;
arrow25[817] <= 1'b1;
arrow25[818] <= 1'b1;
arrow25[819] <= 1'b1;
arrow25[820] <= 1'b1;
arrow25[821] <= 1'b1;
arrow25[856] <= 1'b1;
arrow25[857] <= 1'b1;
arrow25[858] <= 1'b1;
arrow25[859] <= 1'b1;
arrow25[860] <= 1'b1;
arrow25[861] <= 1'b1;
arrow25[896] <= 1'b1;
arrow25[897] <= 1'b1;
arrow25[898] <= 1'b1;
arrow25[899] <= 1'b1;
arrow25[900] <= 1'b1;
arrow25[901] <= 1'b1;
arrow25[936] <= 1'b1;
arrow25[937] <= 1'b1;
arrow25[938] <= 1'b1;
arrow25[939] <= 1'b1;
arrow25[940] <= 1'b1;
arrow25[941] <= 1'b1;
arrow25[976] <= 1'b1;
arrow25[977] <= 1'b1;
arrow25[978] <= 1'b1;
arrow25[979] <= 1'b1;
arrow25[980] <= 1'b1;
arrow25[981] <= 1'b1;
arrow25[1016] <= 1'b1;
arrow25[1017] <= 1'b1;
arrow25[1018] <= 1'b1;
arrow25[1019] <= 1'b1;
arrow25[1020] <= 1'b1;
arrow25[1021] <= 1'b1;
arrow25[1056] <= 1'b1;
arrow25[1057] <= 1'b1;
arrow25[1058] <= 1'b1;
arrow25[1059] <= 1'b1;
arrow25[1060] <= 1'b1;
arrow25[1061] <= 1'b1;
arrow25[1096] <= 1'b1;
arrow25[1097] <= 1'b1;
arrow25[1098] <= 1'b1;
arrow25[1099] <= 1'b1;
arrow25[1100] <= 1'b1;
arrow25[1101] <= 1'b1;
arrow25[1136] <= 1'b1;
arrow25[1137] <= 1'b1;
arrow25[1138] <= 1'b1;
arrow25[1139] <= 1'b1;
arrow25[1140] <= 1'b1;
arrow25[1141] <= 1'b1;
arrow25[1176] <= 1'b1;
arrow25[1177] <= 1'b1;
arrow25[1178] <= 1'b1;
arrow25[1179] <= 1'b1;
arrow25[1180] <= 1'b1;
arrow25[1181] <= 1'b1;
arrow25[1216] <= 1'b1;
arrow25[1217] <= 1'b1;
arrow25[1218] <= 1'b1;
arrow25[1219] <= 1'b1;
arrow25[1220] <= 1'b1;
arrow25[1221] <= 1'b1;
arrow25[1256] <= 1'b1;
arrow25[1257] <= 1'b1;
arrow25[1258] <= 1'b1;
arrow25[1259] <= 1'b1;
arrow25[1260] <= 1'b1;
arrow25[1261] <= 1'b1;


	 end
   else
		 arrow25 <= 1'b0;
end
endmodule