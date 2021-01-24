module dropper_twenty_eight28(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop28X, drop28Y,
						 output [1599:0] arrow28,
						 output logic score28);
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
			score28 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <2000)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score28 = 1'b0;	
						else if ((keycode == 8'h51|| keycode_second == 8'h51) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score28 = 1'b1;
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
				if(counter < 2000)
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
    assign drop28X = arrow_X_Pos;
   
    assign drop28Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow28 <= 1'b0;
	 if(finish_on == 0)
	 begin
	 arrow28[336] <= 1'b1;
arrow28[337] <= 1'b1;
arrow28[338] <= 1'b1;
arrow28[339] <= 1'b1;
arrow28[340] <= 1'b1;
arrow28[341] <= 1'b1;
arrow28[376] <= 1'b1;
arrow28[377] <= 1'b1;
arrow28[378] <= 1'b1;
arrow28[379] <= 1'b1;
arrow28[380] <= 1'b1;
arrow28[381] <= 1'b1;
arrow28[416] <= 1'b1;
arrow28[417] <= 1'b1;
arrow28[418] <= 1'b1;
arrow28[419] <= 1'b1;
arrow28[420] <= 1'b1;
arrow28[421] <= 1'b1;
arrow28[456] <= 1'b1;
arrow28[457] <= 1'b1;
arrow28[458] <= 1'b1;
arrow28[459] <= 1'b1;
arrow28[460] <= 1'b1;
arrow28[461] <= 1'b1;
arrow28[496] <= 1'b1;
arrow28[497] <= 1'b1;
arrow28[498] <= 1'b1;
arrow28[499] <= 1'b1;
arrow28[500] <= 1'b1;
arrow28[501] <= 1'b1;
arrow28[536] <= 1'b1;
arrow28[537] <= 1'b1;
arrow28[538] <= 1'b1;
arrow28[539] <= 1'b1;
arrow28[540] <= 1'b1;
arrow28[541] <= 1'b1;
arrow28[576] <= 1'b1;
arrow28[577] <= 1'b1;
arrow28[578] <= 1'b1;
arrow28[579] <= 1'b1;
arrow28[580] <= 1'b1;
arrow28[581] <= 1'b1;
arrow28[616] <= 1'b1;
arrow28[617] <= 1'b1;
arrow28[618] <= 1'b1;
arrow28[619] <= 1'b1;
arrow28[620] <= 1'b1;
arrow28[621] <= 1'b1;
arrow28[656] <= 1'b1;
arrow28[657] <= 1'b1;
arrow28[658] <= 1'b1;
arrow28[659] <= 1'b1;
arrow28[660] <= 1'b1;
arrow28[661] <= 1'b1;
arrow28[696] <= 1'b1;
arrow28[697] <= 1'b1;
arrow28[698] <= 1'b1;
arrow28[699] <= 1'b1;
arrow28[700] <= 1'b1;
arrow28[701] <= 1'b1;
arrow28[736] <= 1'b1;
arrow28[737] <= 1'b1;
arrow28[738] <= 1'b1;
arrow28[739] <= 1'b1;
arrow28[740] <= 1'b1;
arrow28[741] <= 1'b1;
arrow28[776] <= 1'b1;
arrow28[777] <= 1'b1;
arrow28[778] <= 1'b1;
arrow28[779] <= 1'b1;
arrow28[780] <= 1'b1;
arrow28[781] <= 1'b1;
arrow28[810] <= 1'b1;
arrow28[811] <= 1'b1;
arrow28[812] <= 1'b1;
arrow28[813] <= 1'b1;
arrow28[814] <= 1'b1;
arrow28[815] <= 1'b1;
arrow28[816] <= 1'b1;
arrow28[817] <= 1'b1;
arrow28[818] <= 1'b1;
arrow28[819] <= 1'b1;
arrow28[820] <= 1'b1;
arrow28[821] <= 1'b1;
arrow28[822] <= 1'b1;
arrow28[823] <= 1'b1;
arrow28[824] <= 1'b1;
arrow28[825] <= 1'b1;
arrow28[826] <= 1'b1;
arrow28[827] <= 1'b1;
arrow28[850] <= 1'b1;
arrow28[851] <= 1'b1;
arrow28[852] <= 1'b1;
arrow28[853] <= 1'b1;
arrow28[854] <= 1'b1;
arrow28[855] <= 1'b1;
arrow28[856] <= 1'b1;
arrow28[857] <= 1'b1;
arrow28[858] <= 1'b1;
arrow28[859] <= 1'b1;
arrow28[860] <= 1'b1;
arrow28[861] <= 1'b1;
arrow28[862] <= 1'b1;
arrow28[863] <= 1'b1;
arrow28[864] <= 1'b1;
arrow28[865] <= 1'b1;
arrow28[866] <= 1'b1;
arrow28[867] <= 1'b1;
arrow28[892] <= 1'b1;
arrow28[893] <= 1'b1;
arrow28[894] <= 1'b1;
arrow28[895] <= 1'b1;
arrow28[896] <= 1'b1;
arrow28[897] <= 1'b1;
arrow28[898] <= 1'b1;
arrow28[899] <= 1'b1;
arrow28[900] <= 1'b1;
arrow28[901] <= 1'b1;
arrow28[902] <= 1'b1;
arrow28[903] <= 1'b1;
arrow28[904] <= 1'b1;
arrow28[905] <= 1'b1;
arrow28[932] <= 1'b1;
arrow28[933] <= 1'b1;
arrow28[934] <= 1'b1;
arrow28[935] <= 1'b1;
arrow28[936] <= 1'b1;
arrow28[937] <= 1'b1;
arrow28[938] <= 1'b1;
arrow28[939] <= 1'b1;
arrow28[940] <= 1'b1;
arrow28[941] <= 1'b1;
arrow28[942] <= 1'b1;
arrow28[943] <= 1'b1;
arrow28[944] <= 1'b1;
arrow28[945] <= 1'b1;
arrow28[974] <= 1'b1;
arrow28[975] <= 1'b1;
arrow28[976] <= 1'b1;
arrow28[977] <= 1'b1;
arrow28[978] <= 1'b1;
arrow28[979] <= 1'b1;
arrow28[980] <= 1'b1;
arrow28[981] <= 1'b1;
arrow28[982] <= 1'b1;
arrow28[983] <= 1'b1;
arrow28[1014] <= 1'b1;
arrow28[1015] <= 1'b1;
arrow28[1016] <= 1'b1;
arrow28[1017] <= 1'b1;
arrow28[1018] <= 1'b1;
arrow28[1019] <= 1'b1;
arrow28[1020] <= 1'b1;
arrow28[1021] <= 1'b1;
arrow28[1022] <= 1'b1;
arrow28[1023] <= 1'b1;
arrow28[1056] <= 1'b1;
arrow28[1057] <= 1'b1;
arrow28[1058] <= 1'b1;
arrow28[1059] <= 1'b1;
arrow28[1060] <= 1'b1;
arrow28[1061] <= 1'b1;
arrow28[1096] <= 1'b1;
arrow28[1097] <= 1'b1;
arrow28[1098] <= 1'b1;
arrow28[1099] <= 1'b1;
arrow28[1100] <= 1'b1;
arrow28[1101] <= 1'b1;
arrow28[1138] <= 1'b1;
arrow28[1139] <= 1'b1;
arrow28[1178] <= 1'b1;
arrow28[1179] <= 1'b1;




	 end
   else
		 arrow28 <= 1'b0;
end
endmodule