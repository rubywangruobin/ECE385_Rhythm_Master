module dropper_thirty_four34(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop34X, drop34Y,
						 output [1599:0] arrow34,
						 output logic score34);
	logic [9:0] arrow_X_Pos, arrow_Y_Pos, arrow_Y_Motion;
	logic [11:0] counter;
    parameter [9:0] X_start=380;  // Center position on the X axis
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
			score34 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <2360)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score34 = 1'b0;	
						else if ((keycode == 8'h50|| keycode_second == 8'h50) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score34 = 1'b1;
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
				if(counter < 2360)
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
						 else if ((keycode == 8'h50|| keycode_second == 8'h50) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
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
    assign drop34X = arrow_X_Pos;
   
    assign drop34Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow34 <= 1'b0;
	 if(finish_on == 0)
	 begin
		arrow34[418] <= 1'b1;
		arrow34[419] <= 1'b1;
		arrow34[458] <= 1'b1;
		arrow34[459] <= 1'b1;
		arrow34[496] <= 1'b1;
		arrow34[497] <= 1'b1;
		arrow34[498] <= 1'b1;
		arrow34[499] <= 1'b1;
		arrow34[536] <= 1'b1;
		arrow34[537] <= 1'b1;
		arrow34[538] <= 1'b1;
		arrow34[539] <= 1'b1;
		arrow34[574] <= 1'b1;
		arrow34[575] <= 1'b1;
		arrow34[576] <= 1'b1;
		arrow34[577] <= 1'b1;
		arrow34[578] <= 1'b1;
		arrow34[579] <= 1'b1;
		arrow34[614] <= 1'b1;
		arrow34[615] <= 1'b1;
		arrow34[616] <= 1'b1;
		arrow34[617] <= 1'b1;
		arrow34[618] <= 1'b1;
		arrow34[619] <= 1'b1;
		arrow34[652] <= 1'b1;
		arrow34[653] <= 1'b1;
		arrow34[654] <= 1'b1;
		arrow34[655] <= 1'b1;
		arrow34[656] <= 1'b1;
		arrow34[657] <= 1'b1;
		arrow34[658] <= 1'b1;
		arrow34[659] <= 1'b1;
		arrow34[660] <= 1'b1;
		arrow34[661] <= 1'b1;
		arrow34[662] <= 1'b1;
		arrow34[663] <= 1'b1;
		arrow34[664] <= 1'b1;
		arrow34[665] <= 1'b1;
		arrow34[666] <= 1'b1;
		arrow34[667] <= 1'b1;
		arrow34[668] <= 1'b1;
		arrow34[669] <= 1'b1;
		arrow34[670] <= 1'b1;
		arrow34[671] <= 1'b1;
		arrow34[692] <= 1'b1;
		arrow34[693] <= 1'b1;
		arrow34[694] <= 1'b1;
		arrow34[695] <= 1'b1;
		arrow34[696] <= 1'b1;
		arrow34[697] <= 1'b1;
		arrow34[698] <= 1'b1;
		arrow34[699] <= 1'b1;
		arrow34[700] <= 1'b1;
		arrow34[701] <= 1'b1;
		arrow34[702] <= 1'b1;
		arrow34[703] <= 1'b1;
		arrow34[704] <= 1'b1;
		arrow34[705] <= 1'b1;
		arrow34[706] <= 1'b1;
		arrow34[707] <= 1'b1;
		arrow34[708] <= 1'b1;
		arrow34[709] <= 1'b1;
		arrow34[710] <= 1'b1;
		arrow34[711] <= 1'b1;
		arrow34[730] <= 1'b1;
		arrow34[731] <= 1'b1;
		arrow34[732] <= 1'b1;
		arrow34[733] <= 1'b1;
		arrow34[734] <= 1'b1;
		arrow34[735] <= 1'b1;
		arrow34[736] <= 1'b1;
		arrow34[737] <= 1'b1;
		arrow34[738] <= 1'b1;
		arrow34[739] <= 1'b1;
		arrow34[740] <= 1'b1;
		arrow34[741] <= 1'b1;
		arrow34[742] <= 1'b1;
		arrow34[743] <= 1'b1;
		arrow34[744] <= 1'b1;
		arrow34[745] <= 1'b1;
		arrow34[746] <= 1'b1;
		arrow34[747] <= 1'b1;
		arrow34[748] <= 1'b1;
		arrow34[749] <= 1'b1;
		arrow34[750] <= 1'b1;
		arrow34[751] <= 1'b1;
		arrow34[770] <= 1'b1;
		arrow34[771] <= 1'b1;
		arrow34[772] <= 1'b1;
		arrow34[773] <= 1'b1;
		arrow34[774] <= 1'b1;
		arrow34[775] <= 1'b1;
		arrow34[776] <= 1'b1;
		arrow34[777] <= 1'b1;
		arrow34[778] <= 1'b1;
		arrow34[779] <= 1'b1;
		arrow34[780] <= 1'b1;
		arrow34[781] <= 1'b1;
		arrow34[782] <= 1'b1;
		arrow34[783] <= 1'b1;
		arrow34[784] <= 1'b1;
		arrow34[785] <= 1'b1;
		arrow34[786] <= 1'b1;
		arrow34[787] <= 1'b1;
		arrow34[788] <= 1'b1;
		arrow34[789] <= 1'b1;
		arrow34[790] <= 1'b1;
		arrow34[791] <= 1'b1;
		arrow34[812] <= 1'b1;
		arrow34[813] <= 1'b1;
		arrow34[814] <= 1'b1;
		arrow34[815] <= 1'b1;
		arrow34[816] <= 1'b1;
		arrow34[817] <= 1'b1;
		arrow34[818] <= 1'b1;
		arrow34[819] <= 1'b1;
		arrow34[820] <= 1'b1;
		arrow34[821] <= 1'b1;
		arrow34[822] <= 1'b1;
		arrow34[823] <= 1'b1;
		arrow34[824] <= 1'b1;
		arrow34[825] <= 1'b1;
		arrow34[826] <= 1'b1;
		arrow34[827] <= 1'b1;
		arrow34[828] <= 1'b1;
		arrow34[829] <= 1'b1;
		arrow34[830] <= 1'b1;
		arrow34[831] <= 1'b1;
		arrow34[852] <= 1'b1;
		arrow34[853] <= 1'b1;
		arrow34[854] <= 1'b1;
		arrow34[855] <= 1'b1;
		arrow34[856] <= 1'b1;
		arrow34[857] <= 1'b1;
		arrow34[858] <= 1'b1;
		arrow34[859] <= 1'b1;
		arrow34[860] <= 1'b1;
		arrow34[861] <= 1'b1;
		arrow34[862] <= 1'b1;
		arrow34[863] <= 1'b1;
		arrow34[864] <= 1'b1;
		arrow34[865] <= 1'b1;
		arrow34[866] <= 1'b1;
		arrow34[867] <= 1'b1;
		arrow34[868] <= 1'b1;
		arrow34[869] <= 1'b1;
		arrow34[870] <= 1'b1;
		arrow34[871] <= 1'b1;
		arrow34[894] <= 1'b1;
		arrow34[895] <= 1'b1;
		arrow34[896] <= 1'b1;
		arrow34[897] <= 1'b1;
		arrow34[898] <= 1'b1;
		arrow34[899] <= 1'b1;
		arrow34[934] <= 1'b1;
		arrow34[935] <= 1'b1;
		arrow34[936] <= 1'b1;
		arrow34[937] <= 1'b1;
		arrow34[938] <= 1'b1;
		arrow34[939] <= 1'b1;
		arrow34[976] <= 1'b1;
		arrow34[977] <= 1'b1;
		arrow34[978] <= 1'b1;
		arrow34[979] <= 1'b1;
		arrow34[1016] <= 1'b1;
		arrow34[1017] <= 1'b1;
		arrow34[1018] <= 1'b1;
		arrow34[1019] <= 1'b1;
		arrow34[1058] <= 1'b1;
		arrow34[1059] <= 1'b1;
		arrow34[1098] <= 1'b1;
		arrow34[1099] <= 1'b1;

	 end
	 else
		 arrow34 <= 1'b0;

	 end
   
endmodule