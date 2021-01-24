module dropper_thirteen(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop13X, drop13Y,
						 output [1599:0] arrow13,
						 output logic score13);
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
			score13 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <960)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score13 = 1'b0;	
						else if ((keycode == 8'h04|| keycode_second == 8'h04) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score13 = 1'b1;
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
				if(counter < 960)
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
    assign drop13X = arrow_X_Pos;
   
    assign drop13Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow13 <= 1'b0;
	 if(finish_on == 0)
	 begin
		arrow13[418] <= 1'b1;
		arrow13[419] <= 1'b1;
		arrow13[458] <= 1'b1;
		arrow13[459] <= 1'b1;
		arrow13[496] <= 1'b1;
		arrow13[497] <= 1'b1;
		arrow13[498] <= 1'b1;
		arrow13[499] <= 1'b1;
		arrow13[536] <= 1'b1;
		arrow13[537] <= 1'b1;
		arrow13[538] <= 1'b1;
		arrow13[539] <= 1'b1;
		arrow13[574] <= 1'b1;
		arrow13[575] <= 1'b1;
		arrow13[576] <= 1'b1;
		arrow13[577] <= 1'b1;
		arrow13[578] <= 1'b1;
		arrow13[579] <= 1'b1;
		arrow13[614] <= 1'b1;
		arrow13[615] <= 1'b1;
		arrow13[616] <= 1'b1;
		arrow13[617] <= 1'b1;
		arrow13[618] <= 1'b1;
		arrow13[619] <= 1'b1;
		arrow13[652] <= 1'b1;
		arrow13[653] <= 1'b1;
		arrow13[654] <= 1'b1;
		arrow13[655] <= 1'b1;
		arrow13[656] <= 1'b1;
		arrow13[657] <= 1'b1;
		arrow13[658] <= 1'b1;
		arrow13[659] <= 1'b1;
		arrow13[660] <= 1'b1;
		arrow13[661] <= 1'b1;
		arrow13[662] <= 1'b1;
		arrow13[663] <= 1'b1;
		arrow13[664] <= 1'b1;
		arrow13[665] <= 1'b1;
		arrow13[666] <= 1'b1;
		arrow13[667] <= 1'b1;
		arrow13[668] <= 1'b1;
		arrow13[669] <= 1'b1;
		arrow13[670] <= 1'b1;
		arrow13[671] <= 1'b1;
		arrow13[692] <= 1'b1;
		arrow13[693] <= 1'b1;
		arrow13[694] <= 1'b1;
		arrow13[695] <= 1'b1;
		arrow13[696] <= 1'b1;
		arrow13[697] <= 1'b1;
		arrow13[698] <= 1'b1;
		arrow13[699] <= 1'b1;
		arrow13[700] <= 1'b1;
		arrow13[701] <= 1'b1;
		arrow13[702] <= 1'b1;
		arrow13[703] <= 1'b1;
		arrow13[704] <= 1'b1;
		arrow13[705] <= 1'b1;
		arrow13[706] <= 1'b1;
		arrow13[707] <= 1'b1;
		arrow13[708] <= 1'b1;
		arrow13[709] <= 1'b1;
		arrow13[710] <= 1'b1;
		arrow13[711] <= 1'b1;
		arrow13[730] <= 1'b1;
		arrow13[731] <= 1'b1;
		arrow13[732] <= 1'b1;
		arrow13[733] <= 1'b1;
		arrow13[734] <= 1'b1;
		arrow13[735] <= 1'b1;
		arrow13[736] <= 1'b1;
		arrow13[737] <= 1'b1;
		arrow13[738] <= 1'b1;
		arrow13[739] <= 1'b1;
		arrow13[740] <= 1'b1;
		arrow13[741] <= 1'b1;
		arrow13[742] <= 1'b1;
		arrow13[743] <= 1'b1;
		arrow13[744] <= 1'b1;
		arrow13[745] <= 1'b1;
		arrow13[746] <= 1'b1;
		arrow13[747] <= 1'b1;
		arrow13[748] <= 1'b1;
		arrow13[749] <= 1'b1;
		arrow13[750] <= 1'b1;
		arrow13[751] <= 1'b1;
		arrow13[770] <= 1'b1;
		arrow13[771] <= 1'b1;
		arrow13[772] <= 1'b1;
		arrow13[773] <= 1'b1;
		arrow13[774] <= 1'b1;
		arrow13[775] <= 1'b1;
		arrow13[776] <= 1'b1;
		arrow13[777] <= 1'b1;
		arrow13[778] <= 1'b1;
		arrow13[779] <= 1'b1;
		arrow13[780] <= 1'b1;
		arrow13[781] <= 1'b1;
		arrow13[782] <= 1'b1;
		arrow13[783] <= 1'b1;
		arrow13[784] <= 1'b1;
		arrow13[785] <= 1'b1;
		arrow13[786] <= 1'b1;
		arrow13[787] <= 1'b1;
		arrow13[788] <= 1'b1;
		arrow13[789] <= 1'b1;
		arrow13[790] <= 1'b1;
		arrow13[791] <= 1'b1;
		arrow13[812] <= 1'b1;
		arrow13[813] <= 1'b1;
		arrow13[814] <= 1'b1;
		arrow13[815] <= 1'b1;
		arrow13[816] <= 1'b1;
		arrow13[817] <= 1'b1;
		arrow13[818] <= 1'b1;
		arrow13[819] <= 1'b1;
		arrow13[820] <= 1'b1;
		arrow13[821] <= 1'b1;
		arrow13[822] <= 1'b1;
		arrow13[823] <= 1'b1;
		arrow13[824] <= 1'b1;
		arrow13[825] <= 1'b1;
		arrow13[826] <= 1'b1;
		arrow13[827] <= 1'b1;
		arrow13[828] <= 1'b1;
		arrow13[829] <= 1'b1;
		arrow13[830] <= 1'b1;
		arrow13[831] <= 1'b1;
		arrow13[852] <= 1'b1;
		arrow13[853] <= 1'b1;
		arrow13[854] <= 1'b1;
		arrow13[855] <= 1'b1;
		arrow13[856] <= 1'b1;
		arrow13[857] <= 1'b1;
		arrow13[858] <= 1'b1;
		arrow13[859] <= 1'b1;
		arrow13[860] <= 1'b1;
		arrow13[861] <= 1'b1;
		arrow13[862] <= 1'b1;
		arrow13[863] <= 1'b1;
		arrow13[864] <= 1'b1;
		arrow13[865] <= 1'b1;
		arrow13[866] <= 1'b1;
		arrow13[867] <= 1'b1;
		arrow13[868] <= 1'b1;
		arrow13[869] <= 1'b1;
		arrow13[870] <= 1'b1;
		arrow13[871] <= 1'b1;
		arrow13[894] <= 1'b1;
		arrow13[895] <= 1'b1;
		arrow13[896] <= 1'b1;
		arrow13[897] <= 1'b1;
		arrow13[898] <= 1'b1;
		arrow13[899] <= 1'b1;
		arrow13[934] <= 1'b1;
		arrow13[935] <= 1'b1;
		arrow13[936] <= 1'b1;
		arrow13[937] <= 1'b1;
		arrow13[938] <= 1'b1;
		arrow13[939] <= 1'b1;
		arrow13[976] <= 1'b1;
		arrow13[977] <= 1'b1;
		arrow13[978] <= 1'b1;
		arrow13[979] <= 1'b1;
		arrow13[1016] <= 1'b1;
		arrow13[1017] <= 1'b1;
		arrow13[1018] <= 1'b1;
		arrow13[1019] <= 1'b1;
		arrow13[1058] <= 1'b1;
		arrow13[1059] <= 1'b1;
		arrow13[1098] <= 1'b1;
		arrow13[1099] <= 1'b1;

	 end
	 else
		 arrow13 <= 1'b0;

	 end
   
endmodule