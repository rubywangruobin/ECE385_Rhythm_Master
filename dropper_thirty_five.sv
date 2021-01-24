module dropper_thirty_five(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop35X, drop35Y,
						 output [1599:0] arrow35,
						 output logic score35);
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
			score35 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <2420)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score35 = 1'b0;	
						else if ((keycode == 8'h07|| keycode_second == 8'h07) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score35 = 1'b1;
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
				if(counter < 2420)
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
    assign drop35X = arrow_X_Pos;
   
    assign drop35Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow35 <= 1'b0;
	 if(finish_on == 0)
	 begin
	 arrow35[420] <= 1'b1;
arrow35[421] <= 1'b1;
arrow35[460] <= 1'b1;
arrow35[461] <= 1'b1;
arrow35[500] <= 1'b1;
arrow35[501] <= 1'b1;
arrow35[502] <= 1'b1;
arrow35[503] <= 1'b1;
arrow35[540] <= 1'b1;
arrow35[541] <= 1'b1;
arrow35[542] <= 1'b1;
arrow35[543] <= 1'b1;
arrow35[580] <= 1'b1;
arrow35[581] <= 1'b1;
arrow35[582] <= 1'b1;
arrow35[583] <= 1'b1;
arrow35[584] <= 1'b1;
arrow35[585] <= 1'b1;
arrow35[620] <= 1'b1;
arrow35[621] <= 1'b1;
arrow35[622] <= 1'b1;
arrow35[623] <= 1'b1;
arrow35[624] <= 1'b1;
arrow35[625] <= 1'b1;
arrow35[648] <= 1'b1;
arrow35[649] <= 1'b1;
arrow35[650] <= 1'b1;
arrow35[651] <= 1'b1;
arrow35[652] <= 1'b1;
arrow35[653] <= 1'b1;
arrow35[654] <= 1'b1;
arrow35[655] <= 1'b1;
arrow35[656] <= 1'b1;
arrow35[657] <= 1'b1;
arrow35[658] <= 1'b1;
arrow35[659] <= 1'b1;
arrow35[660] <= 1'b1;
arrow35[661] <= 1'b1;
arrow35[662] <= 1'b1;
arrow35[663] <= 1'b1;
arrow35[664] <= 1'b1;
arrow35[665] <= 1'b1;
arrow35[666] <= 1'b1;
arrow35[667] <= 1'b1;
arrow35[688] <= 1'b1;
arrow35[689] <= 1'b1;
arrow35[690] <= 1'b1;
arrow35[691] <= 1'b1;
arrow35[692] <= 1'b1;
arrow35[693] <= 1'b1;
arrow35[694] <= 1'b1;
arrow35[695] <= 1'b1;
arrow35[696] <= 1'b1;
arrow35[697] <= 1'b1;
arrow35[698] <= 1'b1;
arrow35[699] <= 1'b1;
arrow35[700] <= 1'b1;
arrow35[701] <= 1'b1;
arrow35[702] <= 1'b1;
arrow35[703] <= 1'b1;
arrow35[704] <= 1'b1;
arrow35[705] <= 1'b1;
arrow35[706] <= 1'b1;
arrow35[707] <= 1'b1;
arrow35[728] <= 1'b1;
arrow35[729] <= 1'b1;
arrow35[730] <= 1'b1;
arrow35[731] <= 1'b1;
arrow35[732] <= 1'b1;
arrow35[733] <= 1'b1;
arrow35[734] <= 1'b1;
arrow35[735] <= 1'b1;
arrow35[736] <= 1'b1;
arrow35[737] <= 1'b1;
arrow35[738] <= 1'b1;
arrow35[739] <= 1'b1;
arrow35[740] <= 1'b1;
arrow35[741] <= 1'b1;
arrow35[742] <= 1'b1;
arrow35[743] <= 1'b1;
arrow35[744] <= 1'b1;
arrow35[745] <= 1'b1;
arrow35[746] <= 1'b1;
arrow35[747] <= 1'b1;
arrow35[748] <= 1'b1;
arrow35[749] <= 1'b1;
arrow35[768] <= 1'b1;
arrow35[769] <= 1'b1;
arrow35[770] <= 1'b1;
arrow35[771] <= 1'b1;
arrow35[772] <= 1'b1;
arrow35[773] <= 1'b1;
arrow35[774] <= 1'b1;
arrow35[775] <= 1'b1;
arrow35[776] <= 1'b1;
arrow35[777] <= 1'b1;
arrow35[778] <= 1'b1;
arrow35[779] <= 1'b1;
arrow35[780] <= 1'b1;
arrow35[781] <= 1'b1;
arrow35[782] <= 1'b1;
arrow35[783] <= 1'b1;
arrow35[784] <= 1'b1;
arrow35[785] <= 1'b1;
arrow35[786] <= 1'b1;
arrow35[787] <= 1'b1;
arrow35[788] <= 1'b1;
arrow35[789] <= 1'b1;
arrow35[808] <= 1'b1;
arrow35[809] <= 1'b1;
arrow35[810] <= 1'b1;
arrow35[811] <= 1'b1;
arrow35[812] <= 1'b1;
arrow35[813] <= 1'b1;
arrow35[814] <= 1'b1;
arrow35[815] <= 1'b1;
arrow35[816] <= 1'b1;
arrow35[817] <= 1'b1;
arrow35[818] <= 1'b1;
arrow35[819] <= 1'b1;
arrow35[820] <= 1'b1;
arrow35[821] <= 1'b1;
arrow35[822] <= 1'b1;
arrow35[823] <= 1'b1;
arrow35[824] <= 1'b1;
arrow35[825] <= 1'b1;
arrow35[826] <= 1'b1;
arrow35[827] <= 1'b1;
arrow35[848] <= 1'b1;
arrow35[849] <= 1'b1;
arrow35[850] <= 1'b1;
arrow35[851] <= 1'b1;
arrow35[852] <= 1'b1;
arrow35[853] <= 1'b1;
arrow35[854] <= 1'b1;
arrow35[855] <= 1'b1;
arrow35[856] <= 1'b1;
arrow35[857] <= 1'b1;
arrow35[858] <= 1'b1;
arrow35[859] <= 1'b1;
arrow35[860] <= 1'b1;
arrow35[861] <= 1'b1;
arrow35[862] <= 1'b1;
arrow35[863] <= 1'b1;
arrow35[864] <= 1'b1;
arrow35[865] <= 1'b1;
arrow35[866] <= 1'b1;
arrow35[867] <= 1'b1;
arrow35[900] <= 1'b1;
arrow35[901] <= 1'b1;
arrow35[902] <= 1'b1;
arrow35[903] <= 1'b1;
arrow35[904] <= 1'b1;
arrow35[905] <= 1'b1;
arrow35[940] <= 1'b1;
arrow35[941] <= 1'b1;
arrow35[942] <= 1'b1;
arrow35[943] <= 1'b1;
arrow35[944] <= 1'b1;
arrow35[945] <= 1'b1;
arrow35[980] <= 1'b1;
arrow35[981] <= 1'b1;
arrow35[982] <= 1'b1;
arrow35[983] <= 1'b1;
arrow35[1020] <= 1'b1;
arrow35[1021] <= 1'b1;
arrow35[1022] <= 1'b1;
arrow35[1023] <= 1'b1;
arrow35[1060] <= 1'b1;
arrow35[1061] <= 1'b1;
arrow35[1100] <= 1'b1;
arrow35[1101] <= 1'b1;


	 end
   else
		 arrow35 <= 1'b0;
end
endmodule