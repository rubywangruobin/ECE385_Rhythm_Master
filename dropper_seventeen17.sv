module dropper_seventeen17(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop17X, drop17Y,
						 output [1599:0] arrow17,
						 output logic score17);
	logic [9:0] arrow_X_Pos, arrow_Y_Pos, arrow_Y_Motion;
	logic [11:0] counter;
    parameter [9:0] X_start=560;  // Center position on the X axis
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
			score17 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <1200)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score17 = 1'b0;	
						else if ((keycode == 8'h51|| keycode_second == 8'h51) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score17 = 1'b1;
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
				if(counter < 1200)
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
						 else if ((keycode == 8'h51|| keycode_second == 8'h51) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
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
    assign drop17X = arrow_X_Pos;
   
    assign drop17Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow17 <= 1'b0;
	 if(finish_on == 0)
	 begin
	 arrow17[336] <= 1'b1;
arrow17[337] <= 1'b1;
arrow17[338] <= 1'b1;
arrow17[339] <= 1'b1;
arrow17[340] <= 1'b1;
arrow17[341] <= 1'b1;
arrow17[376] <= 1'b1;
arrow17[377] <= 1'b1;
arrow17[378] <= 1'b1;
arrow17[379] <= 1'b1;
arrow17[380] <= 1'b1;
arrow17[381] <= 1'b1;
arrow17[416] <= 1'b1;
arrow17[417] <= 1'b1;
arrow17[418] <= 1'b1;
arrow17[419] <= 1'b1;
arrow17[420] <= 1'b1;
arrow17[421] <= 1'b1;
arrow17[456] <= 1'b1;
arrow17[457] <= 1'b1;
arrow17[458] <= 1'b1;
arrow17[459] <= 1'b1;
arrow17[460] <= 1'b1;
arrow17[461] <= 1'b1;
arrow17[496] <= 1'b1;
arrow17[497] <= 1'b1;
arrow17[498] <= 1'b1;
arrow17[499] <= 1'b1;
arrow17[500] <= 1'b1;
arrow17[501] <= 1'b1;
arrow17[536] <= 1'b1;
arrow17[537] <= 1'b1;
arrow17[538] <= 1'b1;
arrow17[539] <= 1'b1;
arrow17[540] <= 1'b1;
arrow17[541] <= 1'b1;
arrow17[576] <= 1'b1;
arrow17[577] <= 1'b1;
arrow17[578] <= 1'b1;
arrow17[579] <= 1'b1;
arrow17[580] <= 1'b1;
arrow17[581] <= 1'b1;
arrow17[616] <= 1'b1;
arrow17[617] <= 1'b1;
arrow17[618] <= 1'b1;
arrow17[619] <= 1'b1;
arrow17[620] <= 1'b1;
arrow17[621] <= 1'b1;
arrow17[656] <= 1'b1;
arrow17[657] <= 1'b1;
arrow17[658] <= 1'b1;
arrow17[659] <= 1'b1;
arrow17[660] <= 1'b1;
arrow17[661] <= 1'b1;
arrow17[696] <= 1'b1;
arrow17[697] <= 1'b1;
arrow17[698] <= 1'b1;
arrow17[699] <= 1'b1;
arrow17[700] <= 1'b1;
arrow17[701] <= 1'b1;
arrow17[736] <= 1'b1;
arrow17[737] <= 1'b1;
arrow17[738] <= 1'b1;
arrow17[739] <= 1'b1;
arrow17[740] <= 1'b1;
arrow17[741] <= 1'b1;
arrow17[776] <= 1'b1;
arrow17[777] <= 1'b1;
arrow17[778] <= 1'b1;
arrow17[779] <= 1'b1;
arrow17[780] <= 1'b1;
arrow17[781] <= 1'b1;
arrow17[810] <= 1'b1;
arrow17[811] <= 1'b1;
arrow17[812] <= 1'b1;
arrow17[813] <= 1'b1;
arrow17[814] <= 1'b1;
arrow17[815] <= 1'b1;
arrow17[816] <= 1'b1;
arrow17[817] <= 1'b1;
arrow17[818] <= 1'b1;
arrow17[819] <= 1'b1;
arrow17[820] <= 1'b1;
arrow17[821] <= 1'b1;
arrow17[822] <= 1'b1;
arrow17[823] <= 1'b1;
arrow17[824] <= 1'b1;
arrow17[825] <= 1'b1;
arrow17[826] <= 1'b1;
arrow17[827] <= 1'b1;
arrow17[850] <= 1'b1;
arrow17[851] <= 1'b1;
arrow17[852] <= 1'b1;
arrow17[853] <= 1'b1;
arrow17[854] <= 1'b1;
arrow17[855] <= 1'b1;
arrow17[856] <= 1'b1;
arrow17[857] <= 1'b1;
arrow17[858] <= 1'b1;
arrow17[859] <= 1'b1;
arrow17[860] <= 1'b1;
arrow17[861] <= 1'b1;
arrow17[862] <= 1'b1;
arrow17[863] <= 1'b1;
arrow17[864] <= 1'b1;
arrow17[865] <= 1'b1;
arrow17[866] <= 1'b1;
arrow17[867] <= 1'b1;
arrow17[892] <= 1'b1;
arrow17[893] <= 1'b1;
arrow17[894] <= 1'b1;
arrow17[895] <= 1'b1;
arrow17[896] <= 1'b1;
arrow17[897] <= 1'b1;
arrow17[898] <= 1'b1;
arrow17[899] <= 1'b1;
arrow17[900] <= 1'b1;
arrow17[901] <= 1'b1;
arrow17[902] <= 1'b1;
arrow17[903] <= 1'b1;
arrow17[904] <= 1'b1;
arrow17[905] <= 1'b1;
arrow17[932] <= 1'b1;
arrow17[933] <= 1'b1;
arrow17[934] <= 1'b1;
arrow17[935] <= 1'b1;
arrow17[936] <= 1'b1;
arrow17[937] <= 1'b1;
arrow17[938] <= 1'b1;
arrow17[939] <= 1'b1;
arrow17[940] <= 1'b1;
arrow17[941] <= 1'b1;
arrow17[942] <= 1'b1;
arrow17[943] <= 1'b1;
arrow17[944] <= 1'b1;
arrow17[945] <= 1'b1;
arrow17[974] <= 1'b1;
arrow17[975] <= 1'b1;
arrow17[976] <= 1'b1;
arrow17[977] <= 1'b1;
arrow17[978] <= 1'b1;
arrow17[979] <= 1'b1;
arrow17[980] <= 1'b1;
arrow17[981] <= 1'b1;
arrow17[982] <= 1'b1;
arrow17[983] <= 1'b1;
arrow17[1014] <= 1'b1;
arrow17[1015] <= 1'b1;
arrow17[1016] <= 1'b1;
arrow17[1017] <= 1'b1;
arrow17[1018] <= 1'b1;
arrow17[1019] <= 1'b1;
arrow17[1020] <= 1'b1;
arrow17[1021] <= 1'b1;
arrow17[1022] <= 1'b1;
arrow17[1023] <= 1'b1;
arrow17[1056] <= 1'b1;
arrow17[1057] <= 1'b1;
arrow17[1058] <= 1'b1;
arrow17[1059] <= 1'b1;
arrow17[1060] <= 1'b1;
arrow17[1061] <= 1'b1;
arrow17[1096] <= 1'b1;
arrow17[1097] <= 1'b1;
arrow17[1098] <= 1'b1;
arrow17[1099] <= 1'b1;
arrow17[1100] <= 1'b1;
arrow17[1101] <= 1'b1;
arrow17[1138] <= 1'b1;
arrow17[1139] <= 1'b1;
arrow17[1178] <= 1'b1;
arrow17[1179] <= 1'b1;




	 end
   else
		 arrow17 <= 1'b0;
end
endmodule