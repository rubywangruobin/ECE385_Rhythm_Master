module dropper_twelve(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop12X, drop12Y,
						 output [1599:0] arrow12,
						 output logic score12);
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
			score12 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <760)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score12 = 1'b0;	
						else if ((keycode == 8'h07|| keycode_second == 8'h07) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score12 = 1'b1;
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
				if(counter < 760)
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
    assign drop12X = arrow_X_Pos;
   
    assign drop12Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow12 <= 1'b0;
	 if(finish_on == 0)
	 begin
	 arrow12[420] <= 1'b1;
arrow12[421] <= 1'b1;
arrow12[460] <= 1'b1;
arrow12[461] <= 1'b1;
arrow12[500] <= 1'b1;
arrow12[501] <= 1'b1;
arrow12[502] <= 1'b1;
arrow12[503] <= 1'b1;
arrow12[540] <= 1'b1;
arrow12[541] <= 1'b1;
arrow12[542] <= 1'b1;
arrow12[543] <= 1'b1;
arrow12[580] <= 1'b1;
arrow12[581] <= 1'b1;
arrow12[582] <= 1'b1;
arrow12[583] <= 1'b1;
arrow12[584] <= 1'b1;
arrow12[585] <= 1'b1;
arrow12[620] <= 1'b1;
arrow12[621] <= 1'b1;
arrow12[622] <= 1'b1;
arrow12[623] <= 1'b1;
arrow12[624] <= 1'b1;
arrow12[625] <= 1'b1;
arrow12[648] <= 1'b1;
arrow12[649] <= 1'b1;
arrow12[650] <= 1'b1;
arrow12[651] <= 1'b1;
arrow12[652] <= 1'b1;
arrow12[653] <= 1'b1;
arrow12[654] <= 1'b1;
arrow12[655] <= 1'b1;
arrow12[656] <= 1'b1;
arrow12[657] <= 1'b1;
arrow12[658] <= 1'b1;
arrow12[659] <= 1'b1;
arrow12[660] <= 1'b1;
arrow12[661] <= 1'b1;
arrow12[662] <= 1'b1;
arrow12[663] <= 1'b1;
arrow12[664] <= 1'b1;
arrow12[665] <= 1'b1;
arrow12[666] <= 1'b1;
arrow12[667] <= 1'b1;
arrow12[688] <= 1'b1;
arrow12[689] <= 1'b1;
arrow12[690] <= 1'b1;
arrow12[691] <= 1'b1;
arrow12[692] <= 1'b1;
arrow12[693] <= 1'b1;
arrow12[694] <= 1'b1;
arrow12[695] <= 1'b1;
arrow12[696] <= 1'b1;
arrow12[697] <= 1'b1;
arrow12[698] <= 1'b1;
arrow12[699] <= 1'b1;
arrow12[700] <= 1'b1;
arrow12[701] <= 1'b1;
arrow12[702] <= 1'b1;
arrow12[703] <= 1'b1;
arrow12[704] <= 1'b1;
arrow12[705] <= 1'b1;
arrow12[706] <= 1'b1;
arrow12[707] <= 1'b1;
arrow12[728] <= 1'b1;
arrow12[729] <= 1'b1;
arrow12[730] <= 1'b1;
arrow12[731] <= 1'b1;
arrow12[732] <= 1'b1;
arrow12[733] <= 1'b1;
arrow12[734] <= 1'b1;
arrow12[735] <= 1'b1;
arrow12[736] <= 1'b1;
arrow12[737] <= 1'b1;
arrow12[738] <= 1'b1;
arrow12[739] <= 1'b1;
arrow12[740] <= 1'b1;
arrow12[741] <= 1'b1;
arrow12[742] <= 1'b1;
arrow12[743] <= 1'b1;
arrow12[744] <= 1'b1;
arrow12[745] <= 1'b1;
arrow12[746] <= 1'b1;
arrow12[747] <= 1'b1;
arrow12[748] <= 1'b1;
arrow12[749] <= 1'b1;
arrow12[768] <= 1'b1;
arrow12[769] <= 1'b1;
arrow12[770] <= 1'b1;
arrow12[771] <= 1'b1;
arrow12[772] <= 1'b1;
arrow12[773] <= 1'b1;
arrow12[774] <= 1'b1;
arrow12[775] <= 1'b1;
arrow12[776] <= 1'b1;
arrow12[777] <= 1'b1;
arrow12[778] <= 1'b1;
arrow12[779] <= 1'b1;
arrow12[780] <= 1'b1;
arrow12[781] <= 1'b1;
arrow12[782] <= 1'b1;
arrow12[783] <= 1'b1;
arrow12[784] <= 1'b1;
arrow12[785] <= 1'b1;
arrow12[786] <= 1'b1;
arrow12[787] <= 1'b1;
arrow12[788] <= 1'b1;
arrow12[789] <= 1'b1;
arrow12[808] <= 1'b1;
arrow12[809] <= 1'b1;
arrow12[810] <= 1'b1;
arrow12[811] <= 1'b1;
arrow12[812] <= 1'b1;
arrow12[813] <= 1'b1;
arrow12[814] <= 1'b1;
arrow12[815] <= 1'b1;
arrow12[816] <= 1'b1;
arrow12[817] <= 1'b1;
arrow12[818] <= 1'b1;
arrow12[819] <= 1'b1;
arrow12[820] <= 1'b1;
arrow12[821] <= 1'b1;
arrow12[822] <= 1'b1;
arrow12[823] <= 1'b1;
arrow12[824] <= 1'b1;
arrow12[825] <= 1'b1;
arrow12[826] <= 1'b1;
arrow12[827] <= 1'b1;
arrow12[848] <= 1'b1;
arrow12[849] <= 1'b1;
arrow12[850] <= 1'b1;
arrow12[851] <= 1'b1;
arrow12[852] <= 1'b1;
arrow12[853] <= 1'b1;
arrow12[854] <= 1'b1;
arrow12[855] <= 1'b1;
arrow12[856] <= 1'b1;
arrow12[857] <= 1'b1;
arrow12[858] <= 1'b1;
arrow12[859] <= 1'b1;
arrow12[860] <= 1'b1;
arrow12[861] <= 1'b1;
arrow12[862] <= 1'b1;
arrow12[863] <= 1'b1;
arrow12[864] <= 1'b1;
arrow12[865] <= 1'b1;
arrow12[866] <= 1'b1;
arrow12[867] <= 1'b1;
arrow12[900] <= 1'b1;
arrow12[901] <= 1'b1;
arrow12[902] <= 1'b1;
arrow12[903] <= 1'b1;
arrow12[904] <= 1'b1;
arrow12[905] <= 1'b1;
arrow12[940] <= 1'b1;
arrow12[941] <= 1'b1;
arrow12[942] <= 1'b1;
arrow12[943] <= 1'b1;
arrow12[944] <= 1'b1;
arrow12[945] <= 1'b1;
arrow12[980] <= 1'b1;
arrow12[981] <= 1'b1;
arrow12[982] <= 1'b1;
arrow12[983] <= 1'b1;
arrow12[1020] <= 1'b1;
arrow12[1021] <= 1'b1;
arrow12[1022] <= 1'b1;
arrow12[1023] <= 1'b1;
arrow12[1060] <= 1'b1;
arrow12[1061] <= 1'b1;
arrow12[1100] <= 1'b1;
arrow12[1101] <= 1'b1;


	 end
   else
		 arrow12 <= 1'b0;
end
endmodule