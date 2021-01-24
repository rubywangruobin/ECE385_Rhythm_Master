module dropper_twenty_six(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop26X, drop26Y,
						 output [1599:0] arrow26,
						 output logic score26);
	logic [9:0] arrow_X_Pos, arrow_Y_Pos, arrow_Y_Motion;
	logic [11:0] counter;
    parameter [9:0] X_start=160;  // Center position on the X axis
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
			score26 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <1880)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score26 = 1'b0;	
						else if ((keycode == 8'h07|| keycode_second == 8'h07) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score26 = 1'b1;
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
				if(counter < 1880)
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
						 else if ((keycode == 8'h07|| keycode_second == 8'h07) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
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
    assign drop26X = arrow_X_Pos;
   
    assign drop26Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow26 <= 1'b0;
	 if(finish_on == 0)
	 begin
	 arrow26[420] <= 1'b1;
arrow26[421] <= 1'b1;
arrow26[460] <= 1'b1;
arrow26[461] <= 1'b1;
arrow26[500] <= 1'b1;
arrow26[501] <= 1'b1;
arrow26[502] <= 1'b1;
arrow26[503] <= 1'b1;
arrow26[540] <= 1'b1;
arrow26[541] <= 1'b1;
arrow26[542] <= 1'b1;
arrow26[543] <= 1'b1;
arrow26[580] <= 1'b1;
arrow26[581] <= 1'b1;
arrow26[582] <= 1'b1;
arrow26[583] <= 1'b1;
arrow26[584] <= 1'b1;
arrow26[585] <= 1'b1;
arrow26[620] <= 1'b1;
arrow26[621] <= 1'b1;
arrow26[622] <= 1'b1;
arrow26[623] <= 1'b1;
arrow26[624] <= 1'b1;
arrow26[625] <= 1'b1;
arrow26[648] <= 1'b1;
arrow26[649] <= 1'b1;
arrow26[650] <= 1'b1;
arrow26[651] <= 1'b1;
arrow26[652] <= 1'b1;
arrow26[653] <= 1'b1;
arrow26[654] <= 1'b1;
arrow26[655] <= 1'b1;
arrow26[656] <= 1'b1;
arrow26[657] <= 1'b1;
arrow26[658] <= 1'b1;
arrow26[659] <= 1'b1;
arrow26[660] <= 1'b1;
arrow26[661] <= 1'b1;
arrow26[662] <= 1'b1;
arrow26[663] <= 1'b1;
arrow26[664] <= 1'b1;
arrow26[665] <= 1'b1;
arrow26[666] <= 1'b1;
arrow26[667] <= 1'b1;
arrow26[688] <= 1'b1;
arrow26[689] <= 1'b1;
arrow26[690] <= 1'b1;
arrow26[691] <= 1'b1;
arrow26[692] <= 1'b1;
arrow26[693] <= 1'b1;
arrow26[694] <= 1'b1;
arrow26[695] <= 1'b1;
arrow26[696] <= 1'b1;
arrow26[697] <= 1'b1;
arrow26[698] <= 1'b1;
arrow26[699] <= 1'b1;
arrow26[700] <= 1'b1;
arrow26[701] <= 1'b1;
arrow26[702] <= 1'b1;
arrow26[703] <= 1'b1;
arrow26[704] <= 1'b1;
arrow26[705] <= 1'b1;
arrow26[706] <= 1'b1;
arrow26[707] <= 1'b1;
arrow26[728] <= 1'b1;
arrow26[729] <= 1'b1;
arrow26[730] <= 1'b1;
arrow26[731] <= 1'b1;
arrow26[732] <= 1'b1;
arrow26[733] <= 1'b1;
arrow26[734] <= 1'b1;
arrow26[735] <= 1'b1;
arrow26[736] <= 1'b1;
arrow26[737] <= 1'b1;
arrow26[738] <= 1'b1;
arrow26[739] <= 1'b1;
arrow26[740] <= 1'b1;
arrow26[741] <= 1'b1;
arrow26[742] <= 1'b1;
arrow26[743] <= 1'b1;
arrow26[744] <= 1'b1;
arrow26[745] <= 1'b1;
arrow26[746] <= 1'b1;
arrow26[747] <= 1'b1;
arrow26[748] <= 1'b1;
arrow26[749] <= 1'b1;
arrow26[768] <= 1'b1;
arrow26[769] <= 1'b1;
arrow26[770] <= 1'b1;
arrow26[771] <= 1'b1;
arrow26[772] <= 1'b1;
arrow26[773] <= 1'b1;
arrow26[774] <= 1'b1;
arrow26[775] <= 1'b1;
arrow26[776] <= 1'b1;
arrow26[777] <= 1'b1;
arrow26[778] <= 1'b1;
arrow26[779] <= 1'b1;
arrow26[780] <= 1'b1;
arrow26[781] <= 1'b1;
arrow26[782] <= 1'b1;
arrow26[783] <= 1'b1;
arrow26[784] <= 1'b1;
arrow26[785] <= 1'b1;
arrow26[786] <= 1'b1;
arrow26[787] <= 1'b1;
arrow26[788] <= 1'b1;
arrow26[789] <= 1'b1;
arrow26[808] <= 1'b1;
arrow26[809] <= 1'b1;
arrow26[810] <= 1'b1;
arrow26[811] <= 1'b1;
arrow26[812] <= 1'b1;
arrow26[813] <= 1'b1;
arrow26[814] <= 1'b1;
arrow26[815] <= 1'b1;
arrow26[816] <= 1'b1;
arrow26[817] <= 1'b1;
arrow26[818] <= 1'b1;
arrow26[819] <= 1'b1;
arrow26[820] <= 1'b1;
arrow26[821] <= 1'b1;
arrow26[822] <= 1'b1;
arrow26[823] <= 1'b1;
arrow26[824] <= 1'b1;
arrow26[825] <= 1'b1;
arrow26[826] <= 1'b1;
arrow26[827] <= 1'b1;
arrow26[848] <= 1'b1;
arrow26[849] <= 1'b1;
arrow26[850] <= 1'b1;
arrow26[851] <= 1'b1;
arrow26[852] <= 1'b1;
arrow26[853] <= 1'b1;
arrow26[854] <= 1'b1;
arrow26[855] <= 1'b1;
arrow26[856] <= 1'b1;
arrow26[857] <= 1'b1;
arrow26[858] <= 1'b1;
arrow26[859] <= 1'b1;
arrow26[860] <= 1'b1;
arrow26[861] <= 1'b1;
arrow26[862] <= 1'b1;
arrow26[863] <= 1'b1;
arrow26[864] <= 1'b1;
arrow26[865] <= 1'b1;
arrow26[866] <= 1'b1;
arrow26[867] <= 1'b1;
arrow26[900] <= 1'b1;
arrow26[901] <= 1'b1;
arrow26[902] <= 1'b1;
arrow26[903] <= 1'b1;
arrow26[904] <= 1'b1;
arrow26[905] <= 1'b1;
arrow26[940] <= 1'b1;
arrow26[941] <= 1'b1;
arrow26[942] <= 1'b1;
arrow26[943] <= 1'b1;
arrow26[944] <= 1'b1;
arrow26[945] <= 1'b1;
arrow26[980] <= 1'b1;
arrow26[981] <= 1'b1;
arrow26[982] <= 1'b1;
arrow26[983] <= 1'b1;
arrow26[1020] <= 1'b1;
arrow26[1021] <= 1'b1;
arrow26[1022] <= 1'b1;
arrow26[1023] <= 1'b1;
arrow26[1060] <= 1'b1;
arrow26[1061] <= 1'b1;
arrow26[1100] <= 1'b1;
arrow26[1101] <= 1'b1;


	 end
   else
		 arrow26 <= 1'b0;
end
endmodule