module dropper_thirty_three(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop33X, drop33Y,
						 output [1599:0] arrow33,
						 output logic score33);
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
			score33 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <2300)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score33 = 1'b0;	
						else if ((keycode == 8'h16|| keycode_second == 8'h16) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score33 = 1'b1;
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
				if(counter < 2300)
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
    assign drop33X = arrow_X_Pos;
   
    assign drop33Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow33 <= 1'b0;
	 if(finish_on == 0)
	 begin
	 arrow33[336] <= 1'b1;
arrow33[337] <= 1'b1;
arrow33[338] <= 1'b1;
arrow33[339] <= 1'b1;
arrow33[340] <= 1'b1;
arrow33[341] <= 1'b1;
arrow33[376] <= 1'b1;
arrow33[377] <= 1'b1;
arrow33[378] <= 1'b1;
arrow33[379] <= 1'b1;
arrow33[380] <= 1'b1;
arrow33[381] <= 1'b1;
arrow33[416] <= 1'b1;
arrow33[417] <= 1'b1;
arrow33[418] <= 1'b1;
arrow33[419] <= 1'b1;
arrow33[420] <= 1'b1;
arrow33[421] <= 1'b1;
arrow33[456] <= 1'b1;
arrow33[457] <= 1'b1;
arrow33[458] <= 1'b1;
arrow33[459] <= 1'b1;
arrow33[460] <= 1'b1;
arrow33[461] <= 1'b1;
arrow33[496] <= 1'b1;
arrow33[497] <= 1'b1;
arrow33[498] <= 1'b1;
arrow33[499] <= 1'b1;
arrow33[500] <= 1'b1;
arrow33[501] <= 1'b1;
arrow33[536] <= 1'b1;
arrow33[537] <= 1'b1;
arrow33[538] <= 1'b1;
arrow33[539] <= 1'b1;
arrow33[540] <= 1'b1;
arrow33[541] <= 1'b1;
arrow33[576] <= 1'b1;
arrow33[577] <= 1'b1;
arrow33[578] <= 1'b1;
arrow33[579] <= 1'b1;
arrow33[580] <= 1'b1;
arrow33[581] <= 1'b1;
arrow33[616] <= 1'b1;
arrow33[617] <= 1'b1;
arrow33[618] <= 1'b1;
arrow33[619] <= 1'b1;
arrow33[620] <= 1'b1;
arrow33[621] <= 1'b1;
arrow33[656] <= 1'b1;
arrow33[657] <= 1'b1;
arrow33[658] <= 1'b1;
arrow33[659] <= 1'b1;
arrow33[660] <= 1'b1;
arrow33[661] <= 1'b1;
arrow33[696] <= 1'b1;
arrow33[697] <= 1'b1;
arrow33[698] <= 1'b1;
arrow33[699] <= 1'b1;
arrow33[700] <= 1'b1;
arrow33[701] <= 1'b1;
arrow33[736] <= 1'b1;
arrow33[737] <= 1'b1;
arrow33[738] <= 1'b1;
arrow33[739] <= 1'b1;
arrow33[740] <= 1'b1;
arrow33[741] <= 1'b1;
arrow33[776] <= 1'b1;
arrow33[777] <= 1'b1;
arrow33[778] <= 1'b1;
arrow33[779] <= 1'b1;
arrow33[780] <= 1'b1;
arrow33[781] <= 1'b1;
arrow33[810] <= 1'b1;
arrow33[811] <= 1'b1;
arrow33[812] <= 1'b1;
arrow33[813] <= 1'b1;
arrow33[814] <= 1'b1;
arrow33[815] <= 1'b1;
arrow33[816] <= 1'b1;
arrow33[817] <= 1'b1;
arrow33[818] <= 1'b1;
arrow33[819] <= 1'b1;
arrow33[820] <= 1'b1;
arrow33[821] <= 1'b1;
arrow33[822] <= 1'b1;
arrow33[823] <= 1'b1;
arrow33[824] <= 1'b1;
arrow33[825] <= 1'b1;
arrow33[826] <= 1'b1;
arrow33[827] <= 1'b1;
arrow33[850] <= 1'b1;
arrow33[851] <= 1'b1;
arrow33[852] <= 1'b1;
arrow33[853] <= 1'b1;
arrow33[854] <= 1'b1;
arrow33[855] <= 1'b1;
arrow33[856] <= 1'b1;
arrow33[857] <= 1'b1;
arrow33[858] <= 1'b1;
arrow33[859] <= 1'b1;
arrow33[860] <= 1'b1;
arrow33[861] <= 1'b1;
arrow33[862] <= 1'b1;
arrow33[863] <= 1'b1;
arrow33[864] <= 1'b1;
arrow33[865] <= 1'b1;
arrow33[866] <= 1'b1;
arrow33[867] <= 1'b1;
arrow33[892] <= 1'b1;
arrow33[893] <= 1'b1;
arrow33[894] <= 1'b1;
arrow33[895] <= 1'b1;
arrow33[896] <= 1'b1;
arrow33[897] <= 1'b1;
arrow33[898] <= 1'b1;
arrow33[899] <= 1'b1;
arrow33[900] <= 1'b1;
arrow33[901] <= 1'b1;
arrow33[902] <= 1'b1;
arrow33[903] <= 1'b1;
arrow33[904] <= 1'b1;
arrow33[905] <= 1'b1;
arrow33[932] <= 1'b1;
arrow33[933] <= 1'b1;
arrow33[934] <= 1'b1;
arrow33[935] <= 1'b1;
arrow33[936] <= 1'b1;
arrow33[937] <= 1'b1;
arrow33[938] <= 1'b1;
arrow33[939] <= 1'b1;
arrow33[940] <= 1'b1;
arrow33[941] <= 1'b1;
arrow33[942] <= 1'b1;
arrow33[943] <= 1'b1;
arrow33[944] <= 1'b1;
arrow33[945] <= 1'b1;
arrow33[974] <= 1'b1;
arrow33[975] <= 1'b1;
arrow33[976] <= 1'b1;
arrow33[977] <= 1'b1;
arrow33[978] <= 1'b1;
arrow33[979] <= 1'b1;
arrow33[980] <= 1'b1;
arrow33[981] <= 1'b1;
arrow33[982] <= 1'b1;
arrow33[983] <= 1'b1;
arrow33[1014] <= 1'b1;
arrow33[1015] <= 1'b1;
arrow33[1016] <= 1'b1;
arrow33[1017] <= 1'b1;
arrow33[1018] <= 1'b1;
arrow33[1019] <= 1'b1;
arrow33[1020] <= 1'b1;
arrow33[1021] <= 1'b1;
arrow33[1022] <= 1'b1;
arrow33[1023] <= 1'b1;
arrow33[1056] <= 1'b1;
arrow33[1057] <= 1'b1;
arrow33[1058] <= 1'b1;
arrow33[1059] <= 1'b1;
arrow33[1060] <= 1'b1;
arrow33[1061] <= 1'b1;
arrow33[1096] <= 1'b1;
arrow33[1097] <= 1'b1;
arrow33[1098] <= 1'b1;
arrow33[1099] <= 1'b1;
arrow33[1100] <= 1'b1;
arrow33[1101] <= 1'b1;
arrow33[1138] <= 1'b1;
arrow33[1139] <= 1'b1;
arrow33[1178] <= 1'b1;
arrow33[1179] <= 1'b1;




	 end
   else
		 arrow33 <= 1'b0;
end
endmodule