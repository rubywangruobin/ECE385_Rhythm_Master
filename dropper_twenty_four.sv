module dropper_twenty_four(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop24X, drop24Y,
						 output [1599:0] arrow24,
						 output logic score24);
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
			score24 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <1760)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score24 = 1'b0;	
						else if ((keycode == 8'h04|| keycode_second == 8'h04) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score24 = 1'b1;
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
				if(counter < 1760)
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
    assign drop24X = arrow_X_Pos;
   
    assign drop24Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow24 <= 1'b0;
	 if(finish_on == 0)
	 begin
		arrow24[418] <= 1'b1;
		arrow24[419] <= 1'b1;
		arrow24[458] <= 1'b1;
		arrow24[459] <= 1'b1;
		arrow24[496] <= 1'b1;
		arrow24[497] <= 1'b1;
		arrow24[498] <= 1'b1;
		arrow24[499] <= 1'b1;
		arrow24[536] <= 1'b1;
		arrow24[537] <= 1'b1;
		arrow24[538] <= 1'b1;
		arrow24[539] <= 1'b1;
		arrow24[574] <= 1'b1;
		arrow24[575] <= 1'b1;
		arrow24[576] <= 1'b1;
		arrow24[577] <= 1'b1;
		arrow24[578] <= 1'b1;
		arrow24[579] <= 1'b1;
		arrow24[614] <= 1'b1;
		arrow24[615] <= 1'b1;
		arrow24[616] <= 1'b1;
		arrow24[617] <= 1'b1;
		arrow24[618] <= 1'b1;
		arrow24[619] <= 1'b1;
		arrow24[652] <= 1'b1;
		arrow24[653] <= 1'b1;
		arrow24[654] <= 1'b1;
		arrow24[655] <= 1'b1;
		arrow24[656] <= 1'b1;
		arrow24[657] <= 1'b1;
		arrow24[658] <= 1'b1;
		arrow24[659] <= 1'b1;
		arrow24[660] <= 1'b1;
		arrow24[661] <= 1'b1;
		arrow24[662] <= 1'b1;
		arrow24[663] <= 1'b1;
		arrow24[664] <= 1'b1;
		arrow24[665] <= 1'b1;
		arrow24[666] <= 1'b1;
		arrow24[667] <= 1'b1;
		arrow24[668] <= 1'b1;
		arrow24[669] <= 1'b1;
		arrow24[670] <= 1'b1;
		arrow24[671] <= 1'b1;
		arrow24[692] <= 1'b1;
		arrow24[693] <= 1'b1;
		arrow24[694] <= 1'b1;
		arrow24[695] <= 1'b1;
		arrow24[696] <= 1'b1;
		arrow24[697] <= 1'b1;
		arrow24[698] <= 1'b1;
		arrow24[699] <= 1'b1;
		arrow24[700] <= 1'b1;
		arrow24[701] <= 1'b1;
		arrow24[702] <= 1'b1;
		arrow24[703] <= 1'b1;
		arrow24[704] <= 1'b1;
		arrow24[705] <= 1'b1;
		arrow24[706] <= 1'b1;
		arrow24[707] <= 1'b1;
		arrow24[708] <= 1'b1;
		arrow24[709] <= 1'b1;
		arrow24[710] <= 1'b1;
		arrow24[711] <= 1'b1;
		arrow24[730] <= 1'b1;
		arrow24[731] <= 1'b1;
		arrow24[732] <= 1'b1;
		arrow24[733] <= 1'b1;
		arrow24[734] <= 1'b1;
		arrow24[735] <= 1'b1;
		arrow24[736] <= 1'b1;
		arrow24[737] <= 1'b1;
		arrow24[738] <= 1'b1;
		arrow24[739] <= 1'b1;
		arrow24[740] <= 1'b1;
		arrow24[741] <= 1'b1;
		arrow24[742] <= 1'b1;
		arrow24[743] <= 1'b1;
		arrow24[744] <= 1'b1;
		arrow24[745] <= 1'b1;
		arrow24[746] <= 1'b1;
		arrow24[747] <= 1'b1;
		arrow24[748] <= 1'b1;
		arrow24[749] <= 1'b1;
		arrow24[750] <= 1'b1;
		arrow24[751] <= 1'b1;
		arrow24[770] <= 1'b1;
		arrow24[771] <= 1'b1;
		arrow24[772] <= 1'b1;
		arrow24[773] <= 1'b1;
		arrow24[774] <= 1'b1;
		arrow24[775] <= 1'b1;
		arrow24[776] <= 1'b1;
		arrow24[777] <= 1'b1;
		arrow24[778] <= 1'b1;
		arrow24[779] <= 1'b1;
		arrow24[780] <= 1'b1;
		arrow24[781] <= 1'b1;
		arrow24[782] <= 1'b1;
		arrow24[783] <= 1'b1;
		arrow24[784] <= 1'b1;
		arrow24[785] <= 1'b1;
		arrow24[786] <= 1'b1;
		arrow24[787] <= 1'b1;
		arrow24[788] <= 1'b1;
		arrow24[789] <= 1'b1;
		arrow24[790] <= 1'b1;
		arrow24[791] <= 1'b1;
		arrow24[812] <= 1'b1;
		arrow24[813] <= 1'b1;
		arrow24[814] <= 1'b1;
		arrow24[815] <= 1'b1;
		arrow24[816] <= 1'b1;
		arrow24[817] <= 1'b1;
		arrow24[818] <= 1'b1;
		arrow24[819] <= 1'b1;
		arrow24[820] <= 1'b1;
		arrow24[821] <= 1'b1;
		arrow24[822] <= 1'b1;
		arrow24[823] <= 1'b1;
		arrow24[824] <= 1'b1;
		arrow24[825] <= 1'b1;
		arrow24[826] <= 1'b1;
		arrow24[827] <= 1'b1;
		arrow24[828] <= 1'b1;
		arrow24[829] <= 1'b1;
		arrow24[830] <= 1'b1;
		arrow24[831] <= 1'b1;
		arrow24[852] <= 1'b1;
		arrow24[853] <= 1'b1;
		arrow24[854] <= 1'b1;
		arrow24[855] <= 1'b1;
		arrow24[856] <= 1'b1;
		arrow24[857] <= 1'b1;
		arrow24[858] <= 1'b1;
		arrow24[859] <= 1'b1;
		arrow24[860] <= 1'b1;
		arrow24[861] <= 1'b1;
		arrow24[862] <= 1'b1;
		arrow24[863] <= 1'b1;
		arrow24[864] <= 1'b1;
		arrow24[865] <= 1'b1;
		arrow24[866] <= 1'b1;
		arrow24[867] <= 1'b1;
		arrow24[868] <= 1'b1;
		arrow24[869] <= 1'b1;
		arrow24[870] <= 1'b1;
		arrow24[871] <= 1'b1;
		arrow24[894] <= 1'b1;
		arrow24[895] <= 1'b1;
		arrow24[896] <= 1'b1;
		arrow24[897] <= 1'b1;
		arrow24[898] <= 1'b1;
		arrow24[899] <= 1'b1;
		arrow24[934] <= 1'b1;
		arrow24[935] <= 1'b1;
		arrow24[936] <= 1'b1;
		arrow24[937] <= 1'b1;
		arrow24[938] <= 1'b1;
		arrow24[939] <= 1'b1;
		arrow24[976] <= 1'b1;
		arrow24[977] <= 1'b1;
		arrow24[978] <= 1'b1;
		arrow24[979] <= 1'b1;
		arrow24[1016] <= 1'b1;
		arrow24[1017] <= 1'b1;
		arrow24[1018] <= 1'b1;
		arrow24[1019] <= 1'b1;
		arrow24[1058] <= 1'b1;
		arrow24[1059] <= 1'b1;
		arrow24[1098] <= 1'b1;
		arrow24[1099] <= 1'b1;

	 end
	 else
		 arrow24 <= 1'b0;

	 end
   
endmodule