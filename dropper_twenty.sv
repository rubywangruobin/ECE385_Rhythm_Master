module dropper_twenty(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop20X, drop20Y,
						 output [1599:0] arrow20,
						 output logic score20);
	logic [9:0] arrow_X_Pos, arrow_Y_Pos, arrow_Y_Motion;
	logic [11:0] counter;
    parameter [9:0] X_start=220;  // Center position on the X axis
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
			score20 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <1380)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score20 = 1'b0;	
						else if ((keycode == 8'h16|| keycode_second == 8'h16) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score20 = 1'b1;
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
				if(counter < 1380)
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
						 else if ((keycode == 8'h16|| keycode_second == 8'h16) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
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
    assign drop20X = arrow_X_Pos;
   
    assign drop20Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow20 <= 1'b0;
	 if(finish_on == 0)
	 begin
	 arrow20[336] <= 1'b1;
arrow20[337] <= 1'b1;
arrow20[338] <= 1'b1;
arrow20[339] <= 1'b1;
arrow20[340] <= 1'b1;
arrow20[341] <= 1'b1;
arrow20[376] <= 1'b1;
arrow20[377] <= 1'b1;
arrow20[378] <= 1'b1;
arrow20[379] <= 1'b1;
arrow20[380] <= 1'b1;
arrow20[381] <= 1'b1;
arrow20[416] <= 1'b1;
arrow20[417] <= 1'b1;
arrow20[418] <= 1'b1;
arrow20[419] <= 1'b1;
arrow20[420] <= 1'b1;
arrow20[421] <= 1'b1;
arrow20[456] <= 1'b1;
arrow20[457] <= 1'b1;
arrow20[458] <= 1'b1;
arrow20[459] <= 1'b1;
arrow20[460] <= 1'b1;
arrow20[461] <= 1'b1;
arrow20[496] <= 1'b1;
arrow20[497] <= 1'b1;
arrow20[498] <= 1'b1;
arrow20[499] <= 1'b1;
arrow20[500] <= 1'b1;
arrow20[501] <= 1'b1;
arrow20[536] <= 1'b1;
arrow20[537] <= 1'b1;
arrow20[538] <= 1'b1;
arrow20[539] <= 1'b1;
arrow20[540] <= 1'b1;
arrow20[541] <= 1'b1;
arrow20[576] <= 1'b1;
arrow20[577] <= 1'b1;
arrow20[578] <= 1'b1;
arrow20[579] <= 1'b1;
arrow20[580] <= 1'b1;
arrow20[581] <= 1'b1;
arrow20[616] <= 1'b1;
arrow20[617] <= 1'b1;
arrow20[618] <= 1'b1;
arrow20[619] <= 1'b1;
arrow20[620] <= 1'b1;
arrow20[621] <= 1'b1;
arrow20[656] <= 1'b1;
arrow20[657] <= 1'b1;
arrow20[658] <= 1'b1;
arrow20[659] <= 1'b1;
arrow20[660] <= 1'b1;
arrow20[661] <= 1'b1;
arrow20[696] <= 1'b1;
arrow20[697] <= 1'b1;
arrow20[698] <= 1'b1;
arrow20[699] <= 1'b1;
arrow20[700] <= 1'b1;
arrow20[701] <= 1'b1;
arrow20[736] <= 1'b1;
arrow20[737] <= 1'b1;
arrow20[738] <= 1'b1;
arrow20[739] <= 1'b1;
arrow20[740] <= 1'b1;
arrow20[741] <= 1'b1;
arrow20[776] <= 1'b1;
arrow20[777] <= 1'b1;
arrow20[778] <= 1'b1;
arrow20[779] <= 1'b1;
arrow20[780] <= 1'b1;
arrow20[781] <= 1'b1;
arrow20[810] <= 1'b1;
arrow20[811] <= 1'b1;
arrow20[812] <= 1'b1;
arrow20[813] <= 1'b1;
arrow20[814] <= 1'b1;
arrow20[815] <= 1'b1;
arrow20[816] <= 1'b1;
arrow20[817] <= 1'b1;
arrow20[818] <= 1'b1;
arrow20[819] <= 1'b1;
arrow20[820] <= 1'b1;
arrow20[821] <= 1'b1;
arrow20[822] <= 1'b1;
arrow20[823] <= 1'b1;
arrow20[824] <= 1'b1;
arrow20[825] <= 1'b1;
arrow20[826] <= 1'b1;
arrow20[827] <= 1'b1;
arrow20[850] <= 1'b1;
arrow20[851] <= 1'b1;
arrow20[852] <= 1'b1;
arrow20[853] <= 1'b1;
arrow20[854] <= 1'b1;
arrow20[855] <= 1'b1;
arrow20[856] <= 1'b1;
arrow20[857] <= 1'b1;
arrow20[858] <= 1'b1;
arrow20[859] <= 1'b1;
arrow20[860] <= 1'b1;
arrow20[861] <= 1'b1;
arrow20[862] <= 1'b1;
arrow20[863] <= 1'b1;
arrow20[864] <= 1'b1;
arrow20[865] <= 1'b1;
arrow20[866] <= 1'b1;
arrow20[867] <= 1'b1;
arrow20[892] <= 1'b1;
arrow20[893] <= 1'b1;
arrow20[894] <= 1'b1;
arrow20[895] <= 1'b1;
arrow20[896] <= 1'b1;
arrow20[897] <= 1'b1;
arrow20[898] <= 1'b1;
arrow20[899] <= 1'b1;
arrow20[900] <= 1'b1;
arrow20[901] <= 1'b1;
arrow20[902] <= 1'b1;
arrow20[903] <= 1'b1;
arrow20[904] <= 1'b1;
arrow20[905] <= 1'b1;
arrow20[932] <= 1'b1;
arrow20[933] <= 1'b1;
arrow20[934] <= 1'b1;
arrow20[935] <= 1'b1;
arrow20[936] <= 1'b1;
arrow20[937] <= 1'b1;
arrow20[938] <= 1'b1;
arrow20[939] <= 1'b1;
arrow20[940] <= 1'b1;
arrow20[941] <= 1'b1;
arrow20[942] <= 1'b1;
arrow20[943] <= 1'b1;
arrow20[944] <= 1'b1;
arrow20[945] <= 1'b1;
arrow20[974] <= 1'b1;
arrow20[975] <= 1'b1;
arrow20[976] <= 1'b1;
arrow20[977] <= 1'b1;
arrow20[978] <= 1'b1;
arrow20[979] <= 1'b1;
arrow20[980] <= 1'b1;
arrow20[981] <= 1'b1;
arrow20[982] <= 1'b1;
arrow20[983] <= 1'b1;
arrow20[1014] <= 1'b1;
arrow20[1015] <= 1'b1;
arrow20[1016] <= 1'b1;
arrow20[1017] <= 1'b1;
arrow20[1018] <= 1'b1;
arrow20[1019] <= 1'b1;
arrow20[1020] <= 1'b1;
arrow20[1021] <= 1'b1;
arrow20[1022] <= 1'b1;
arrow20[1023] <= 1'b1;
arrow20[1056] <= 1'b1;
arrow20[1057] <= 1'b1;
arrow20[1058] <= 1'b1;
arrow20[1059] <= 1'b1;
arrow20[1060] <= 1'b1;
arrow20[1061] <= 1'b1;
arrow20[1096] <= 1'b1;
arrow20[1097] <= 1'b1;
arrow20[1098] <= 1'b1;
arrow20[1099] <= 1'b1;
arrow20[1100] <= 1'b1;
arrow20[1101] <= 1'b1;
arrow20[1138] <= 1'b1;
arrow20[1139] <= 1'b1;
arrow20[1178] <= 1'b1;
arrow20[1179] <= 1'b1;




	 end
   else
		 arrow20 <= 1'b0;
end
endmodule