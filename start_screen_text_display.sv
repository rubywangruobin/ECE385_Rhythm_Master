module left_Score(input Reset, frame_clk, output [5499:0] score_bar_left);
								
	 logic display_text;
	 always_ff @ (posedge frame_clk )
    begin
		if(Reset)
			State <= Halted;
		else
			State <= Next_state;
    end
	 
	 always_comb
	 begin
		Next_state = State;
		display_text = 1'b1;
		unique case(State)
			Halted:
			begin
				display_text = 1'b1;
				if(keycode == 8'h2c)
					Next_state = Normal;
			end
			Normal:
				display_text = 1'b0;
		endcase
					
	 end
	 
	 always_comb
	 begin
	 startscreen <= 1'b0;
	 if(display_text == 1'b1)
	 begin
	 end
	 else
		 startscreen <= 1'b0;
	 

	 end
endmodule