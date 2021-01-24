module dropper_thirty_eight(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop38X, drop38Y,
						 output [1599:0] arrow38,
						 output logic score38);
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
			score38 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <2740)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score38 = 1'b0;	
						else if ((keycode == 8'h07|| keycode_second == 8'h07) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score38 = 1'b1;
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
				if(counter < 2740)
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
    assign drop38X = arrow_X_Pos;
   
    assign drop38Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow38 <= 1'b0;
	 if(finish_on == 0)
	 begin
	 arrow38[420] <= 1'b1;
arrow38[421] <= 1'b1;
arrow38[460] <= 1'b1;
arrow38[461] <= 1'b1;
arrow38[500] <= 1'b1;
arrow38[501] <= 1'b1;
arrow38[502] <= 1'b1;
arrow38[503] <= 1'b1;
arrow38[540] <= 1'b1;
arrow38[541] <= 1'b1;
arrow38[542] <= 1'b1;
arrow38[543] <= 1'b1;
arrow38[580] <= 1'b1;
arrow38[581] <= 1'b1;
arrow38[582] <= 1'b1;
arrow38[583] <= 1'b1;
arrow38[584] <= 1'b1;
arrow38[585] <= 1'b1;
arrow38[620] <= 1'b1;
arrow38[621] <= 1'b1;
arrow38[622] <= 1'b1;
arrow38[623] <= 1'b1;
arrow38[624] <= 1'b1;
arrow38[625] <= 1'b1;
arrow38[648] <= 1'b1;
arrow38[649] <= 1'b1;
arrow38[650] <= 1'b1;
arrow38[651] <= 1'b1;
arrow38[652] <= 1'b1;
arrow38[653] <= 1'b1;
arrow38[654] <= 1'b1;
arrow38[655] <= 1'b1;
arrow38[656] <= 1'b1;
arrow38[657] <= 1'b1;
arrow38[658] <= 1'b1;
arrow38[659] <= 1'b1;
arrow38[660] <= 1'b1;
arrow38[661] <= 1'b1;
arrow38[662] <= 1'b1;
arrow38[663] <= 1'b1;
arrow38[664] <= 1'b1;
arrow38[665] <= 1'b1;
arrow38[666] <= 1'b1;
arrow38[667] <= 1'b1;
arrow38[688] <= 1'b1;
arrow38[689] <= 1'b1;
arrow38[690] <= 1'b1;
arrow38[691] <= 1'b1;
arrow38[692] <= 1'b1;
arrow38[693] <= 1'b1;
arrow38[694] <= 1'b1;
arrow38[695] <= 1'b1;
arrow38[696] <= 1'b1;
arrow38[697] <= 1'b1;
arrow38[698] <= 1'b1;
arrow38[699] <= 1'b1;
arrow38[700] <= 1'b1;
arrow38[701] <= 1'b1;
arrow38[702] <= 1'b1;
arrow38[703] <= 1'b1;
arrow38[704] <= 1'b1;
arrow38[705] <= 1'b1;
arrow38[706] <= 1'b1;
arrow38[707] <= 1'b1;
arrow38[728] <= 1'b1;
arrow38[729] <= 1'b1;
arrow38[730] <= 1'b1;
arrow38[731] <= 1'b1;
arrow38[732] <= 1'b1;
arrow38[733] <= 1'b1;
arrow38[734] <= 1'b1;
arrow38[735] <= 1'b1;
arrow38[736] <= 1'b1;
arrow38[737] <= 1'b1;
arrow38[738] <= 1'b1;
arrow38[739] <= 1'b1;
arrow38[740] <= 1'b1;
arrow38[741] <= 1'b1;
arrow38[742] <= 1'b1;
arrow38[743] <= 1'b1;
arrow38[744] <= 1'b1;
arrow38[745] <= 1'b1;
arrow38[746] <= 1'b1;
arrow38[747] <= 1'b1;
arrow38[748] <= 1'b1;
arrow38[749] <= 1'b1;
arrow38[768] <= 1'b1;
arrow38[769] <= 1'b1;
arrow38[770] <= 1'b1;
arrow38[771] <= 1'b1;
arrow38[772] <= 1'b1;
arrow38[773] <= 1'b1;
arrow38[774] <= 1'b1;
arrow38[775] <= 1'b1;
arrow38[776] <= 1'b1;
arrow38[777] <= 1'b1;
arrow38[778] <= 1'b1;
arrow38[779] <= 1'b1;
arrow38[780] <= 1'b1;
arrow38[781] <= 1'b1;
arrow38[782] <= 1'b1;
arrow38[783] <= 1'b1;
arrow38[784] <= 1'b1;
arrow38[785] <= 1'b1;
arrow38[786] <= 1'b1;
arrow38[787] <= 1'b1;
arrow38[788] <= 1'b1;
arrow38[789] <= 1'b1;
arrow38[808] <= 1'b1;
arrow38[809] <= 1'b1;
arrow38[810] <= 1'b1;
arrow38[811] <= 1'b1;
arrow38[812] <= 1'b1;
arrow38[813] <= 1'b1;
arrow38[814] <= 1'b1;
arrow38[815] <= 1'b1;
arrow38[816] <= 1'b1;
arrow38[817] <= 1'b1;
arrow38[818] <= 1'b1;
arrow38[819] <= 1'b1;
arrow38[820] <= 1'b1;
arrow38[821] <= 1'b1;
arrow38[822] <= 1'b1;
arrow38[823] <= 1'b1;
arrow38[824] <= 1'b1;
arrow38[825] <= 1'b1;
arrow38[826] <= 1'b1;
arrow38[827] <= 1'b1;
arrow38[848] <= 1'b1;
arrow38[849] <= 1'b1;
arrow38[850] <= 1'b1;
arrow38[851] <= 1'b1;
arrow38[852] <= 1'b1;
arrow38[853] <= 1'b1;
arrow38[854] <= 1'b1;
arrow38[855] <= 1'b1;
arrow38[856] <= 1'b1;
arrow38[857] <= 1'b1;
arrow38[858] <= 1'b1;
arrow38[859] <= 1'b1;
arrow38[860] <= 1'b1;
arrow38[861] <= 1'b1;
arrow38[862] <= 1'b1;
arrow38[863] <= 1'b1;
arrow38[864] <= 1'b1;
arrow38[865] <= 1'b1;
arrow38[866] <= 1'b1;
arrow38[867] <= 1'b1;
arrow38[900] <= 1'b1;
arrow38[901] <= 1'b1;
arrow38[902] <= 1'b1;
arrow38[903] <= 1'b1;
arrow38[904] <= 1'b1;
arrow38[905] <= 1'b1;
arrow38[940] <= 1'b1;
arrow38[941] <= 1'b1;
arrow38[942] <= 1'b1;
arrow38[943] <= 1'b1;
arrow38[944] <= 1'b1;
arrow38[945] <= 1'b1;
arrow38[980] <= 1'b1;
arrow38[981] <= 1'b1;
arrow38[982] <= 1'b1;
arrow38[983] <= 1'b1;
arrow38[1020] <= 1'b1;
arrow38[1021] <= 1'b1;
arrow38[1022] <= 1'b1;
arrow38[1023] <= 1'b1;
arrow38[1060] <= 1'b1;
arrow38[1061] <= 1'b1;
arrow38[1100] <= 1'b1;
arrow38[1101] <= 1'b1;


	 end
   else
		 arrow38 <= 1'b0;
end
endmodule