module dropper_ten(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop10X, drop10Y,
						 output [1599:0] arrow10,
						 output logic score10);
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
			score10 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <640)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score10 = 1'b0;	
						else if ((keycode == 8'h16|| keycode_second == 8'h16) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score10 = 1'b1;
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
				if(counter < 640)
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
    assign drop10X = arrow_X_Pos;
   
    assign drop10Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow10 <= 1'b0;
	 if(finish_on == 0)
	 begin
	 arrow10[336] <= 1'b1;
arrow10[337] <= 1'b1;
arrow10[338] <= 1'b1;
arrow10[339] <= 1'b1;
arrow10[340] <= 1'b1;
arrow10[341] <= 1'b1;
arrow10[376] <= 1'b1;
arrow10[377] <= 1'b1;
arrow10[378] <= 1'b1;
arrow10[379] <= 1'b1;
arrow10[380] <= 1'b1;
arrow10[381] <= 1'b1;
arrow10[416] <= 1'b1;
arrow10[417] <= 1'b1;
arrow10[418] <= 1'b1;
arrow10[419] <= 1'b1;
arrow10[420] <= 1'b1;
arrow10[421] <= 1'b1;
arrow10[456] <= 1'b1;
arrow10[457] <= 1'b1;
arrow10[458] <= 1'b1;
arrow10[459] <= 1'b1;
arrow10[460] <= 1'b1;
arrow10[461] <= 1'b1;
arrow10[496] <= 1'b1;
arrow10[497] <= 1'b1;
arrow10[498] <= 1'b1;
arrow10[499] <= 1'b1;
arrow10[500] <= 1'b1;
arrow10[501] <= 1'b1;
arrow10[536] <= 1'b1;
arrow10[537] <= 1'b1;
arrow10[538] <= 1'b1;
arrow10[539] <= 1'b1;
arrow10[540] <= 1'b1;
arrow10[541] <= 1'b1;
arrow10[576] <= 1'b1;
arrow10[577] <= 1'b1;
arrow10[578] <= 1'b1;
arrow10[579] <= 1'b1;
arrow10[580] <= 1'b1;
arrow10[581] <= 1'b1;
arrow10[616] <= 1'b1;
arrow10[617] <= 1'b1;
arrow10[618] <= 1'b1;
arrow10[619] <= 1'b1;
arrow10[620] <= 1'b1;
arrow10[621] <= 1'b1;
arrow10[656] <= 1'b1;
arrow10[657] <= 1'b1;
arrow10[658] <= 1'b1;
arrow10[659] <= 1'b1;
arrow10[660] <= 1'b1;
arrow10[661] <= 1'b1;
arrow10[696] <= 1'b1;
arrow10[697] <= 1'b1;
arrow10[698] <= 1'b1;
arrow10[699] <= 1'b1;
arrow10[700] <= 1'b1;
arrow10[701] <= 1'b1;
arrow10[736] <= 1'b1;
arrow10[737] <= 1'b1;
arrow10[738] <= 1'b1;
arrow10[739] <= 1'b1;
arrow10[740] <= 1'b1;
arrow10[741] <= 1'b1;
arrow10[776] <= 1'b1;
arrow10[777] <= 1'b1;
arrow10[778] <= 1'b1;
arrow10[779] <= 1'b1;
arrow10[780] <= 1'b1;
arrow10[781] <= 1'b1;
arrow10[810] <= 1'b1;
arrow10[811] <= 1'b1;
arrow10[812] <= 1'b1;
arrow10[813] <= 1'b1;
arrow10[814] <= 1'b1;
arrow10[815] <= 1'b1;
arrow10[816] <= 1'b1;
arrow10[817] <= 1'b1;
arrow10[818] <= 1'b1;
arrow10[819] <= 1'b1;
arrow10[820] <= 1'b1;
arrow10[821] <= 1'b1;
arrow10[822] <= 1'b1;
arrow10[823] <= 1'b1;
arrow10[824] <= 1'b1;
arrow10[825] <= 1'b1;
arrow10[826] <= 1'b1;
arrow10[827] <= 1'b1;
arrow10[850] <= 1'b1;
arrow10[851] <= 1'b1;
arrow10[852] <= 1'b1;
arrow10[853] <= 1'b1;
arrow10[854] <= 1'b1;
arrow10[855] <= 1'b1;
arrow10[856] <= 1'b1;
arrow10[857] <= 1'b1;
arrow10[858] <= 1'b1;
arrow10[859] <= 1'b1;
arrow10[860] <= 1'b1;
arrow10[861] <= 1'b1;
arrow10[862] <= 1'b1;
arrow10[863] <= 1'b1;
arrow10[864] <= 1'b1;
arrow10[865] <= 1'b1;
arrow10[866] <= 1'b1;
arrow10[867] <= 1'b1;
arrow10[892] <= 1'b1;
arrow10[893] <= 1'b1;
arrow10[894] <= 1'b1;
arrow10[895] <= 1'b1;
arrow10[896] <= 1'b1;
arrow10[897] <= 1'b1;
arrow10[898] <= 1'b1;
arrow10[899] <= 1'b1;
arrow10[900] <= 1'b1;
arrow10[901] <= 1'b1;
arrow10[902] <= 1'b1;
arrow10[903] <= 1'b1;
arrow10[904] <= 1'b1;
arrow10[905] <= 1'b1;
arrow10[932] <= 1'b1;
arrow10[933] <= 1'b1;
arrow10[934] <= 1'b1;
arrow10[935] <= 1'b1;
arrow10[936] <= 1'b1;
arrow10[937] <= 1'b1;
arrow10[938] <= 1'b1;
arrow10[939] <= 1'b1;
arrow10[940] <= 1'b1;
arrow10[941] <= 1'b1;
arrow10[942] <= 1'b1;
arrow10[943] <= 1'b1;
arrow10[944] <= 1'b1;
arrow10[945] <= 1'b1;
arrow10[974] <= 1'b1;
arrow10[975] <= 1'b1;
arrow10[976] <= 1'b1;
arrow10[977] <= 1'b1;
arrow10[978] <= 1'b1;
arrow10[979] <= 1'b1;
arrow10[980] <= 1'b1;
arrow10[981] <= 1'b1;
arrow10[982] <= 1'b1;
arrow10[983] <= 1'b1;
arrow10[1014] <= 1'b1;
arrow10[1015] <= 1'b1;
arrow10[1016] <= 1'b1;
arrow10[1017] <= 1'b1;
arrow10[1018] <= 1'b1;
arrow10[1019] <= 1'b1;
arrow10[1020] <= 1'b1;
arrow10[1021] <= 1'b1;
arrow10[1022] <= 1'b1;
arrow10[1023] <= 1'b1;
arrow10[1056] <= 1'b1;
arrow10[1057] <= 1'b1;
arrow10[1058] <= 1'b1;
arrow10[1059] <= 1'b1;
arrow10[1060] <= 1'b1;
arrow10[1061] <= 1'b1;
arrow10[1096] <= 1'b1;
arrow10[1097] <= 1'b1;
arrow10[1098] <= 1'b1;
arrow10[1099] <= 1'b1;
arrow10[1100] <= 1'b1;
arrow10[1101] <= 1'b1;
arrow10[1138] <= 1'b1;
arrow10[1139] <= 1'b1;
arrow10[1178] <= 1'b1;
arrow10[1179] <= 1'b1;




	 end
   else
		 arrow10 <= 1'b0;
end
endmodule