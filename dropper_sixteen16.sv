module dropper_sixteen16(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop16X, drop16Y,
						 output [1599:0] arrow16,
						 output logic score16);
	logic [9:0] arrow_X_Pos, arrow_Y_Pos, arrow_Y_Motion;
	logic [11:0] counter;
    parameter [9:0] X_start=500;  // Center position on the X axis
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
			score16 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <1140)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score16 = 1'b0;	
						else if ((keycode == 8'h4f|| keycode_second == 8'h4f) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score16 = 1'b1;
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
				if(counter < 1140)
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
						 else if ((keycode == 8'h4f|| keycode_second == 8'h4f) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
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
    assign drop16X = arrow_X_Pos;
   
    assign drop16Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow16 <= 1'b0;
	 if(finish_on == 0)
	 begin
	 arrow16[420] <= 1'b1;
arrow16[421] <= 1'b1;
arrow16[460] <= 1'b1;
arrow16[461] <= 1'b1;
arrow16[500] <= 1'b1;
arrow16[501] <= 1'b1;
arrow16[502] <= 1'b1;
arrow16[503] <= 1'b1;
arrow16[540] <= 1'b1;
arrow16[541] <= 1'b1;
arrow16[542] <= 1'b1;
arrow16[543] <= 1'b1;
arrow16[580] <= 1'b1;
arrow16[581] <= 1'b1;
arrow16[582] <= 1'b1;
arrow16[583] <= 1'b1;
arrow16[584] <= 1'b1;
arrow16[585] <= 1'b1;
arrow16[620] <= 1'b1;
arrow16[621] <= 1'b1;
arrow16[622] <= 1'b1;
arrow16[623] <= 1'b1;
arrow16[624] <= 1'b1;
arrow16[625] <= 1'b1;
arrow16[648] <= 1'b1;
arrow16[649] <= 1'b1;
arrow16[650] <= 1'b1;
arrow16[651] <= 1'b1;
arrow16[652] <= 1'b1;
arrow16[653] <= 1'b1;
arrow16[654] <= 1'b1;
arrow16[655] <= 1'b1;
arrow16[656] <= 1'b1;
arrow16[657] <= 1'b1;
arrow16[658] <= 1'b1;
arrow16[659] <= 1'b1;
arrow16[660] <= 1'b1;
arrow16[661] <= 1'b1;
arrow16[662] <= 1'b1;
arrow16[663] <= 1'b1;
arrow16[664] <= 1'b1;
arrow16[665] <= 1'b1;
arrow16[666] <= 1'b1;
arrow16[667] <= 1'b1;
arrow16[688] <= 1'b1;
arrow16[689] <= 1'b1;
arrow16[690] <= 1'b1;
arrow16[691] <= 1'b1;
arrow16[692] <= 1'b1;
arrow16[693] <= 1'b1;
arrow16[694] <= 1'b1;
arrow16[695] <= 1'b1;
arrow16[696] <= 1'b1;
arrow16[697] <= 1'b1;
arrow16[698] <= 1'b1;
arrow16[699] <= 1'b1;
arrow16[700] <= 1'b1;
arrow16[701] <= 1'b1;
arrow16[702] <= 1'b1;
arrow16[703] <= 1'b1;
arrow16[704] <= 1'b1;
arrow16[705] <= 1'b1;
arrow16[706] <= 1'b1;
arrow16[707] <= 1'b1;
arrow16[728] <= 1'b1;
arrow16[729] <= 1'b1;
arrow16[730] <= 1'b1;
arrow16[731] <= 1'b1;
arrow16[732] <= 1'b1;
arrow16[733] <= 1'b1;
arrow16[734] <= 1'b1;
arrow16[735] <= 1'b1;
arrow16[736] <= 1'b1;
arrow16[737] <= 1'b1;
arrow16[738] <= 1'b1;
arrow16[739] <= 1'b1;
arrow16[740] <= 1'b1;
arrow16[741] <= 1'b1;
arrow16[742] <= 1'b1;
arrow16[743] <= 1'b1;
arrow16[744] <= 1'b1;
arrow16[745] <= 1'b1;
arrow16[746] <= 1'b1;
arrow16[747] <= 1'b1;
arrow16[748] <= 1'b1;
arrow16[749] <= 1'b1;
arrow16[768] <= 1'b1;
arrow16[769] <= 1'b1;
arrow16[770] <= 1'b1;
arrow16[771] <= 1'b1;
arrow16[772] <= 1'b1;
arrow16[773] <= 1'b1;
arrow16[774] <= 1'b1;
arrow16[775] <= 1'b1;
arrow16[776] <= 1'b1;
arrow16[777] <= 1'b1;
arrow16[778] <= 1'b1;
arrow16[779] <= 1'b1;
arrow16[780] <= 1'b1;
arrow16[781] <= 1'b1;
arrow16[782] <= 1'b1;
arrow16[783] <= 1'b1;
arrow16[784] <= 1'b1;
arrow16[785] <= 1'b1;
arrow16[786] <= 1'b1;
arrow16[787] <= 1'b1;
arrow16[788] <= 1'b1;
arrow16[789] <= 1'b1;
arrow16[808] <= 1'b1;
arrow16[809] <= 1'b1;
arrow16[810] <= 1'b1;
arrow16[811] <= 1'b1;
arrow16[812] <= 1'b1;
arrow16[813] <= 1'b1;
arrow16[814] <= 1'b1;
arrow16[815] <= 1'b1;
arrow16[816] <= 1'b1;
arrow16[817] <= 1'b1;
arrow16[818] <= 1'b1;
arrow16[819] <= 1'b1;
arrow16[820] <= 1'b1;
arrow16[821] <= 1'b1;
arrow16[822] <= 1'b1;
arrow16[823] <= 1'b1;
arrow16[824] <= 1'b1;
arrow16[825] <= 1'b1;
arrow16[826] <= 1'b1;
arrow16[827] <= 1'b1;
arrow16[848] <= 1'b1;
arrow16[849] <= 1'b1;
arrow16[850] <= 1'b1;
arrow16[851] <= 1'b1;
arrow16[852] <= 1'b1;
arrow16[853] <= 1'b1;
arrow16[854] <= 1'b1;
arrow16[855] <= 1'b1;
arrow16[856] <= 1'b1;
arrow16[857] <= 1'b1;
arrow16[858] <= 1'b1;
arrow16[859] <= 1'b1;
arrow16[860] <= 1'b1;
arrow16[861] <= 1'b1;
arrow16[862] <= 1'b1;
arrow16[863] <= 1'b1;
arrow16[864] <= 1'b1;
arrow16[865] <= 1'b1;
arrow16[866] <= 1'b1;
arrow16[867] <= 1'b1;
arrow16[900] <= 1'b1;
arrow16[901] <= 1'b1;
arrow16[902] <= 1'b1;
arrow16[903] <= 1'b1;
arrow16[904] <= 1'b1;
arrow16[905] <= 1'b1;
arrow16[940] <= 1'b1;
arrow16[941] <= 1'b1;
arrow16[942] <= 1'b1;
arrow16[943] <= 1'b1;
arrow16[944] <= 1'b1;
arrow16[945] <= 1'b1;
arrow16[980] <= 1'b1;
arrow16[981] <= 1'b1;
arrow16[982] <= 1'b1;
arrow16[983] <= 1'b1;
arrow16[1020] <= 1'b1;
arrow16[1021] <= 1'b1;
arrow16[1022] <= 1'b1;
arrow16[1023] <= 1'b1;
arrow16[1060] <= 1'b1;
arrow16[1061] <= 1'b1;
arrow16[1100] <= 1'b1;
arrow16[1101] <= 1'b1;


	 end
   else
		 arrow16 <= 1'b0;
end
endmodule