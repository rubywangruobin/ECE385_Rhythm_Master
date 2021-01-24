module dropper_three(input Reset, frame_clk, 
						 input logic [7:0] keycode, keycode_second,
						 output [9:0] drop3X, drop3Y,
						 output [1599:0] arrow3,
						 output logic score3);
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
			score3 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <220)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score3 = 1'b0;	
						else if ((keycode == 8'h07 || keycode_second == 8'h07) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score3 = 1'b1;
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
				if(counter < 220)
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
						 else if ((keycode == 8'h07 || keycode_second == 8'h07) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
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
    assign drop3X = arrow_X_Pos;
   
    assign drop3Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow3 <= 1'b0;
	 if(finish_on == 0)
	 begin
	 arrow3[420] <= 1'b1;
arrow3[421] <= 1'b1;
arrow3[460] <= 1'b1;
arrow3[461] <= 1'b1;
arrow3[500] <= 1'b1;
arrow3[501] <= 1'b1;
arrow3[502] <= 1'b1;
arrow3[503] <= 1'b1;
arrow3[540] <= 1'b1;
arrow3[541] <= 1'b1;
arrow3[542] <= 1'b1;
arrow3[543] <= 1'b1;
arrow3[580] <= 1'b1;
arrow3[581] <= 1'b1;
arrow3[582] <= 1'b1;
arrow3[583] <= 1'b1;
arrow3[584] <= 1'b1;
arrow3[585] <= 1'b1;
arrow3[620] <= 1'b1;
arrow3[621] <= 1'b1;
arrow3[622] <= 1'b1;
arrow3[623] <= 1'b1;
arrow3[624] <= 1'b1;
arrow3[625] <= 1'b1;
arrow3[648] <= 1'b1;
arrow3[649] <= 1'b1;
arrow3[650] <= 1'b1;
arrow3[651] <= 1'b1;
arrow3[652] <= 1'b1;
arrow3[653] <= 1'b1;
arrow3[654] <= 1'b1;
arrow3[655] <= 1'b1;
arrow3[656] <= 1'b1;
arrow3[657] <= 1'b1;
arrow3[658] <= 1'b1;
arrow3[659] <= 1'b1;
arrow3[660] <= 1'b1;
arrow3[661] <= 1'b1;
arrow3[662] <= 1'b1;
arrow3[663] <= 1'b1;
arrow3[664] <= 1'b1;
arrow3[665] <= 1'b1;
arrow3[666] <= 1'b1;
arrow3[667] <= 1'b1;
arrow3[688] <= 1'b1;
arrow3[689] <= 1'b1;
arrow3[690] <= 1'b1;
arrow3[691] <= 1'b1;
arrow3[692] <= 1'b1;
arrow3[693] <= 1'b1;
arrow3[694] <= 1'b1;
arrow3[695] <= 1'b1;
arrow3[696] <= 1'b1;
arrow3[697] <= 1'b1;
arrow3[698] <= 1'b1;
arrow3[699] <= 1'b1;
arrow3[700] <= 1'b1;
arrow3[701] <= 1'b1;
arrow3[702] <= 1'b1;
arrow3[703] <= 1'b1;
arrow3[704] <= 1'b1;
arrow3[705] <= 1'b1;
arrow3[706] <= 1'b1;
arrow3[707] <= 1'b1;
arrow3[728] <= 1'b1;
arrow3[729] <= 1'b1;
arrow3[730] <= 1'b1;
arrow3[731] <= 1'b1;
arrow3[732] <= 1'b1;
arrow3[733] <= 1'b1;
arrow3[734] <= 1'b1;
arrow3[735] <= 1'b1;
arrow3[736] <= 1'b1;
arrow3[737] <= 1'b1;
arrow3[738] <= 1'b1;
arrow3[739] <= 1'b1;
arrow3[740] <= 1'b1;
arrow3[741] <= 1'b1;
arrow3[742] <= 1'b1;
arrow3[743] <= 1'b1;
arrow3[744] <= 1'b1;
arrow3[745] <= 1'b1;
arrow3[746] <= 1'b1;
arrow3[747] <= 1'b1;
arrow3[748] <= 1'b1;
arrow3[749] <= 1'b1;
arrow3[768] <= 1'b1;
arrow3[769] <= 1'b1;
arrow3[770] <= 1'b1;
arrow3[771] <= 1'b1;
arrow3[772] <= 1'b1;
arrow3[773] <= 1'b1;
arrow3[774] <= 1'b1;
arrow3[775] <= 1'b1;
arrow3[776] <= 1'b1;
arrow3[777] <= 1'b1;
arrow3[778] <= 1'b1;
arrow3[779] <= 1'b1;
arrow3[780] <= 1'b1;
arrow3[781] <= 1'b1;
arrow3[782] <= 1'b1;
arrow3[783] <= 1'b1;
arrow3[784] <= 1'b1;
arrow3[785] <= 1'b1;
arrow3[786] <= 1'b1;
arrow3[787] <= 1'b1;
arrow3[788] <= 1'b1;
arrow3[789] <= 1'b1;
arrow3[808] <= 1'b1;
arrow3[809] <= 1'b1;
arrow3[810] <= 1'b1;
arrow3[811] <= 1'b1;
arrow3[812] <= 1'b1;
arrow3[813] <= 1'b1;
arrow3[814] <= 1'b1;
arrow3[815] <= 1'b1;
arrow3[816] <= 1'b1;
arrow3[817] <= 1'b1;
arrow3[818] <= 1'b1;
arrow3[819] <= 1'b1;
arrow3[820] <= 1'b1;
arrow3[821] <= 1'b1;
arrow3[822] <= 1'b1;
arrow3[823] <= 1'b1;
arrow3[824] <= 1'b1;
arrow3[825] <= 1'b1;
arrow3[826] <= 1'b1;
arrow3[827] <= 1'b1;
arrow3[848] <= 1'b1;
arrow3[849] <= 1'b1;
arrow3[850] <= 1'b1;
arrow3[851] <= 1'b1;
arrow3[852] <= 1'b1;
arrow3[853] <= 1'b1;
arrow3[854] <= 1'b1;
arrow3[855] <= 1'b1;
arrow3[856] <= 1'b1;
arrow3[857] <= 1'b1;
arrow3[858] <= 1'b1;
arrow3[859] <= 1'b1;
arrow3[860] <= 1'b1;
arrow3[861] <= 1'b1;
arrow3[862] <= 1'b1;
arrow3[863] <= 1'b1;
arrow3[864] <= 1'b1;
arrow3[865] <= 1'b1;
arrow3[866] <= 1'b1;
arrow3[867] <= 1'b1;
arrow3[900] <= 1'b1;
arrow3[901] <= 1'b1;
arrow3[902] <= 1'b1;
arrow3[903] <= 1'b1;
arrow3[904] <= 1'b1;
arrow3[905] <= 1'b1;
arrow3[940] <= 1'b1;
arrow3[941] <= 1'b1;
arrow3[942] <= 1'b1;
arrow3[943] <= 1'b1;
arrow3[944] <= 1'b1;
arrow3[945] <= 1'b1;
arrow3[980] <= 1'b1;
arrow3[981] <= 1'b1;
arrow3[982] <= 1'b1;
arrow3[983] <= 1'b1;
arrow3[1020] <= 1'b1;
arrow3[1021] <= 1'b1;
arrow3[1022] <= 1'b1;
arrow3[1023] <= 1'b1;
arrow3[1060] <= 1'b1;
arrow3[1061] <= 1'b1;
arrow3[1100] <= 1'b1;
arrow3[1101] <= 1'b1;


	 end
   else
		 arrow3 <= 1'b0;
end
endmodule