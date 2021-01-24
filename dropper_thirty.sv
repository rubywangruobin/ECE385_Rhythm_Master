module dropper_thirty(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop30X, drop30Y,
						 output [1599:0] arrow30,
						 output logic score30);
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
			score30 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <2120)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score30 = 1'b0;	
						else if ((keycode == 8'h07|| keycode_second == 8'h07) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score30 = 1'b1;
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
				if(counter < 2120)
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
    assign drop30X = arrow_X_Pos;
   
    assign drop30Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow30 <= 1'b0;
	 if(finish_on == 0)
	 begin
	 arrow30[420] <= 1'b1;
arrow30[421] <= 1'b1;
arrow30[460] <= 1'b1;
arrow30[461] <= 1'b1;
arrow30[500] <= 1'b1;
arrow30[501] <= 1'b1;
arrow30[502] <= 1'b1;
arrow30[503] <= 1'b1;
arrow30[540] <= 1'b1;
arrow30[541] <= 1'b1;
arrow30[542] <= 1'b1;
arrow30[543] <= 1'b1;
arrow30[580] <= 1'b1;
arrow30[581] <= 1'b1;
arrow30[582] <= 1'b1;
arrow30[583] <= 1'b1;
arrow30[584] <= 1'b1;
arrow30[585] <= 1'b1;
arrow30[620] <= 1'b1;
arrow30[621] <= 1'b1;
arrow30[622] <= 1'b1;
arrow30[623] <= 1'b1;
arrow30[624] <= 1'b1;
arrow30[625] <= 1'b1;
arrow30[648] <= 1'b1;
arrow30[649] <= 1'b1;
arrow30[650] <= 1'b1;
arrow30[651] <= 1'b1;
arrow30[652] <= 1'b1;
arrow30[653] <= 1'b1;
arrow30[654] <= 1'b1;
arrow30[655] <= 1'b1;
arrow30[656] <= 1'b1;
arrow30[657] <= 1'b1;
arrow30[658] <= 1'b1;
arrow30[659] <= 1'b1;
arrow30[660] <= 1'b1;
arrow30[661] <= 1'b1;
arrow30[662] <= 1'b1;
arrow30[663] <= 1'b1;
arrow30[664] <= 1'b1;
arrow30[665] <= 1'b1;
arrow30[666] <= 1'b1;
arrow30[667] <= 1'b1;
arrow30[688] <= 1'b1;
arrow30[689] <= 1'b1;
arrow30[690] <= 1'b1;
arrow30[691] <= 1'b1;
arrow30[692] <= 1'b1;
arrow30[693] <= 1'b1;
arrow30[694] <= 1'b1;
arrow30[695] <= 1'b1;
arrow30[696] <= 1'b1;
arrow30[697] <= 1'b1;
arrow30[698] <= 1'b1;
arrow30[699] <= 1'b1;
arrow30[700] <= 1'b1;
arrow30[701] <= 1'b1;
arrow30[702] <= 1'b1;
arrow30[703] <= 1'b1;
arrow30[704] <= 1'b1;
arrow30[705] <= 1'b1;
arrow30[706] <= 1'b1;
arrow30[707] <= 1'b1;
arrow30[728] <= 1'b1;
arrow30[729] <= 1'b1;
arrow30[730] <= 1'b1;
arrow30[731] <= 1'b1;
arrow30[732] <= 1'b1;
arrow30[733] <= 1'b1;
arrow30[734] <= 1'b1;
arrow30[735] <= 1'b1;
arrow30[736] <= 1'b1;
arrow30[737] <= 1'b1;
arrow30[738] <= 1'b1;
arrow30[739] <= 1'b1;
arrow30[740] <= 1'b1;
arrow30[741] <= 1'b1;
arrow30[742] <= 1'b1;
arrow30[743] <= 1'b1;
arrow30[744] <= 1'b1;
arrow30[745] <= 1'b1;
arrow30[746] <= 1'b1;
arrow30[747] <= 1'b1;
arrow30[748] <= 1'b1;
arrow30[749] <= 1'b1;
arrow30[768] <= 1'b1;
arrow30[769] <= 1'b1;
arrow30[770] <= 1'b1;
arrow30[771] <= 1'b1;
arrow30[772] <= 1'b1;
arrow30[773] <= 1'b1;
arrow30[774] <= 1'b1;
arrow30[775] <= 1'b1;
arrow30[776] <= 1'b1;
arrow30[777] <= 1'b1;
arrow30[778] <= 1'b1;
arrow30[779] <= 1'b1;
arrow30[780] <= 1'b1;
arrow30[781] <= 1'b1;
arrow30[782] <= 1'b1;
arrow30[783] <= 1'b1;
arrow30[784] <= 1'b1;
arrow30[785] <= 1'b1;
arrow30[786] <= 1'b1;
arrow30[787] <= 1'b1;
arrow30[788] <= 1'b1;
arrow30[789] <= 1'b1;
arrow30[808] <= 1'b1;
arrow30[809] <= 1'b1;
arrow30[810] <= 1'b1;
arrow30[811] <= 1'b1;
arrow30[812] <= 1'b1;
arrow30[813] <= 1'b1;
arrow30[814] <= 1'b1;
arrow30[815] <= 1'b1;
arrow30[816] <= 1'b1;
arrow30[817] <= 1'b1;
arrow30[818] <= 1'b1;
arrow30[819] <= 1'b1;
arrow30[820] <= 1'b1;
arrow30[821] <= 1'b1;
arrow30[822] <= 1'b1;
arrow30[823] <= 1'b1;
arrow30[824] <= 1'b1;
arrow30[825] <= 1'b1;
arrow30[826] <= 1'b1;
arrow30[827] <= 1'b1;
arrow30[848] <= 1'b1;
arrow30[849] <= 1'b1;
arrow30[850] <= 1'b1;
arrow30[851] <= 1'b1;
arrow30[852] <= 1'b1;
arrow30[853] <= 1'b1;
arrow30[854] <= 1'b1;
arrow30[855] <= 1'b1;
arrow30[856] <= 1'b1;
arrow30[857] <= 1'b1;
arrow30[858] <= 1'b1;
arrow30[859] <= 1'b1;
arrow30[860] <= 1'b1;
arrow30[861] <= 1'b1;
arrow30[862] <= 1'b1;
arrow30[863] <= 1'b1;
arrow30[864] <= 1'b1;
arrow30[865] <= 1'b1;
arrow30[866] <= 1'b1;
arrow30[867] <= 1'b1;
arrow30[900] <= 1'b1;
arrow30[901] <= 1'b1;
arrow30[902] <= 1'b1;
arrow30[903] <= 1'b1;
arrow30[904] <= 1'b1;
arrow30[905] <= 1'b1;
arrow30[940] <= 1'b1;
arrow30[941] <= 1'b1;
arrow30[942] <= 1'b1;
arrow30[943] <= 1'b1;
arrow30[944] <= 1'b1;
arrow30[945] <= 1'b1;
arrow30[980] <= 1'b1;
arrow30[981] <= 1'b1;
arrow30[982] <= 1'b1;
arrow30[983] <= 1'b1;
arrow30[1020] <= 1'b1;
arrow30[1021] <= 1'b1;
arrow30[1022] <= 1'b1;
arrow30[1023] <= 1'b1;
arrow30[1060] <= 1'b1;
arrow30[1061] <= 1'b1;
arrow30[1100] <= 1'b1;
arrow30[1101] <= 1'b1;


	 end
   else
		 arrow30 <= 1'b0;
end
endmodule