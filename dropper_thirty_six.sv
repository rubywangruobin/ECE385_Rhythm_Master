module dropper_thirty_six(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop36X, drop36Y,
						 output [1599:0] arrow36,
						 output logic score36);
	logic [9:0] arrow_X_Pos, arrow_Y_Pos, arrow_Y_Motion;
	logic [11:0] counter;
    parameter [9:0] X_start=40;  // Center position on the X axis
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
			score36 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <2620)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score36 = 1'b0;	
						else if ((keycode == 8'h04|| keycode_second == 8'h04) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score36 = 1'b1;
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
				if(counter < 2620)
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
						 else if ((keycode == 8'h04|| keycode_second == 8'h04) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
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
    assign drop36X = arrow_X_Pos;
   
    assign drop36Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow36 <= 1'b0;
	 if(finish_on == 0)
	 begin
		arrow36[418] <= 1'b1;
		arrow36[419] <= 1'b1;
		arrow36[458] <= 1'b1;
		arrow36[459] <= 1'b1;
		arrow36[496] <= 1'b1;
		arrow36[497] <= 1'b1;
		arrow36[498] <= 1'b1;
		arrow36[499] <= 1'b1;
		arrow36[536] <= 1'b1;
		arrow36[537] <= 1'b1;
		arrow36[538] <= 1'b1;
		arrow36[539] <= 1'b1;
		arrow36[574] <= 1'b1;
		arrow36[575] <= 1'b1;
		arrow36[576] <= 1'b1;
		arrow36[577] <= 1'b1;
		arrow36[578] <= 1'b1;
		arrow36[579] <= 1'b1;
		arrow36[614] <= 1'b1;
		arrow36[615] <= 1'b1;
		arrow36[616] <= 1'b1;
		arrow36[617] <= 1'b1;
		arrow36[618] <= 1'b1;
		arrow36[619] <= 1'b1;
		arrow36[652] <= 1'b1;
		arrow36[653] <= 1'b1;
		arrow36[654] <= 1'b1;
		arrow36[655] <= 1'b1;
		arrow36[656] <= 1'b1;
		arrow36[657] <= 1'b1;
		arrow36[658] <= 1'b1;
		arrow36[659] <= 1'b1;
		arrow36[660] <= 1'b1;
		arrow36[661] <= 1'b1;
		arrow36[662] <= 1'b1;
		arrow36[663] <= 1'b1;
		arrow36[664] <= 1'b1;
		arrow36[665] <= 1'b1;
		arrow36[666] <= 1'b1;
		arrow36[667] <= 1'b1;
		arrow36[668] <= 1'b1;
		arrow36[669] <= 1'b1;
		arrow36[670] <= 1'b1;
		arrow36[671] <= 1'b1;
		arrow36[692] <= 1'b1;
		arrow36[693] <= 1'b1;
		arrow36[694] <= 1'b1;
		arrow36[695] <= 1'b1;
		arrow36[696] <= 1'b1;
		arrow36[697] <= 1'b1;
		arrow36[698] <= 1'b1;
		arrow36[699] <= 1'b1;
		arrow36[700] <= 1'b1;
		arrow36[701] <= 1'b1;
		arrow36[702] <= 1'b1;
		arrow36[703] <= 1'b1;
		arrow36[704] <= 1'b1;
		arrow36[705] <= 1'b1;
		arrow36[706] <= 1'b1;
		arrow36[707] <= 1'b1;
		arrow36[708] <= 1'b1;
		arrow36[709] <= 1'b1;
		arrow36[710] <= 1'b1;
		arrow36[711] <= 1'b1;
		arrow36[730] <= 1'b1;
		arrow36[731] <= 1'b1;
		arrow36[732] <= 1'b1;
		arrow36[733] <= 1'b1;
		arrow36[734] <= 1'b1;
		arrow36[735] <= 1'b1;
		arrow36[736] <= 1'b1;
		arrow36[737] <= 1'b1;
		arrow36[738] <= 1'b1;
		arrow36[739] <= 1'b1;
		arrow36[740] <= 1'b1;
		arrow36[741] <= 1'b1;
		arrow36[742] <= 1'b1;
		arrow36[743] <= 1'b1;
		arrow36[744] <= 1'b1;
		arrow36[745] <= 1'b1;
		arrow36[746] <= 1'b1;
		arrow36[747] <= 1'b1;
		arrow36[748] <= 1'b1;
		arrow36[749] <= 1'b1;
		arrow36[750] <= 1'b1;
		arrow36[751] <= 1'b1;
		arrow36[770] <= 1'b1;
		arrow36[771] <= 1'b1;
		arrow36[772] <= 1'b1;
		arrow36[773] <= 1'b1;
		arrow36[774] <= 1'b1;
		arrow36[775] <= 1'b1;
		arrow36[776] <= 1'b1;
		arrow36[777] <= 1'b1;
		arrow36[778] <= 1'b1;
		arrow36[779] <= 1'b1;
		arrow36[780] <= 1'b1;
		arrow36[781] <= 1'b1;
		arrow36[782] <= 1'b1;
		arrow36[783] <= 1'b1;
		arrow36[784] <= 1'b1;
		arrow36[785] <= 1'b1;
		arrow36[786] <= 1'b1;
		arrow36[787] <= 1'b1;
		arrow36[788] <= 1'b1;
		arrow36[789] <= 1'b1;
		arrow36[790] <= 1'b1;
		arrow36[791] <= 1'b1;
		arrow36[812] <= 1'b1;
		arrow36[813] <= 1'b1;
		arrow36[814] <= 1'b1;
		arrow36[815] <= 1'b1;
		arrow36[816] <= 1'b1;
		arrow36[817] <= 1'b1;
		arrow36[818] <= 1'b1;
		arrow36[819] <= 1'b1;
		arrow36[820] <= 1'b1;
		arrow36[821] <= 1'b1;
		arrow36[822] <= 1'b1;
		arrow36[823] <= 1'b1;
		arrow36[824] <= 1'b1;
		arrow36[825] <= 1'b1;
		arrow36[826] <= 1'b1;
		arrow36[827] <= 1'b1;
		arrow36[828] <= 1'b1;
		arrow36[829] <= 1'b1;
		arrow36[830] <= 1'b1;
		arrow36[831] <= 1'b1;
		arrow36[852] <= 1'b1;
		arrow36[853] <= 1'b1;
		arrow36[854] <= 1'b1;
		arrow36[855] <= 1'b1;
		arrow36[856] <= 1'b1;
		arrow36[857] <= 1'b1;
		arrow36[858] <= 1'b1;
		arrow36[859] <= 1'b1;
		arrow36[860] <= 1'b1;
		arrow36[861] <= 1'b1;
		arrow36[862] <= 1'b1;
		arrow36[863] <= 1'b1;
		arrow36[864] <= 1'b1;
		arrow36[865] <= 1'b1;
		arrow36[866] <= 1'b1;
		arrow36[867] <= 1'b1;
		arrow36[868] <= 1'b1;
		arrow36[869] <= 1'b1;
		arrow36[870] <= 1'b1;
		arrow36[871] <= 1'b1;
		arrow36[894] <= 1'b1;
		arrow36[895] <= 1'b1;
		arrow36[896] <= 1'b1;
		arrow36[897] <= 1'b1;
		arrow36[898] <= 1'b1;
		arrow36[899] <= 1'b1;
		arrow36[934] <= 1'b1;
		arrow36[935] <= 1'b1;
		arrow36[936] <= 1'b1;
		arrow36[937] <= 1'b1;
		arrow36[938] <= 1'b1;
		arrow36[939] <= 1'b1;
		arrow36[976] <= 1'b1;
		arrow36[977] <= 1'b1;
		arrow36[978] <= 1'b1;
		arrow36[979] <= 1'b1;
		arrow36[1016] <= 1'b1;
		arrow36[1017] <= 1'b1;
		arrow36[1018] <= 1'b1;
		arrow36[1019] <= 1'b1;
		arrow36[1058] <= 1'b1;
		arrow36[1059] <= 1'b1;
		arrow36[1098] <= 1'b1;
		arrow36[1099] <= 1'b1;

	 end
	 else
		 arrow36 <= 1'b0;

	 end
   
endmodule