module curr_score_ten(input [7:0] total_Score, input Reset, frame_clk, output [349:0] cur2_color);
	logic [3:0] display;
	always_ff @ (posedge frame_clk )
    begin
		display <= (total_Score / 10);
    end
	 always_comb
	 begin
	 cur2_color <= 0;
	 if(display == 4'b0000)
	 begin
		cur2_color[75] <= 1'b1;
cur2_color[76] <= 1'b1;
cur2_color[77] <= 1'b1;
cur2_color[78] <= 1'b1;
cur2_color[88] <= 1'b1;
cur2_color[89] <= 1'b1;
cur2_color[92] <= 1'b1;
cur2_color[93] <= 1'b1;
cur2_color[101] <= 1'b1;
cur2_color[102] <= 1'b1;
cur2_color[107] <= 1'b1;
cur2_color[108] <= 1'b1;
cur2_color[115] <= 1'b1;
cur2_color[122] <= 1'b1;
cur2_color[129] <= 1'b1;
cur2_color[136] <= 1'b1;
cur2_color[143] <= 1'b1;
cur2_color[150] <= 1'b1;
cur2_color[157] <= 1'b1;
cur2_color[164] <= 1'b1;
cur2_color[171] <= 1'b1;
cur2_color[178] <= 1'b1;
cur2_color[185] <= 1'b1;
cur2_color[192] <= 1'b1;
cur2_color[199] <= 1'b1;
cur2_color[206] <= 1'b1;
cur2_color[213] <= 1'b1;
cur2_color[220] <= 1'b1;
cur2_color[227] <= 1'b1;
cur2_color[228] <= 1'b1;
cur2_color[233] <= 1'b1;
cur2_color[234] <= 1'b1;
cur2_color[242] <= 1'b1;
cur2_color[243] <= 1'b1;
cur2_color[246] <= 1'b1;
cur2_color[247] <= 1'b1;
cur2_color[257] <= 1'b1;
cur2_color[258] <= 1'b1;
cur2_color[259] <= 1'b1;
cur2_color[260] <= 1'b1;


	 end
	 else if(display == 4'b0001)
	 begin
	 cur2_color[77] <= 1'b1;
cur2_color[78] <= 1'b1;
cur2_color[90] <= 1'b1;
cur2_color[91] <= 1'b1;
cur2_color[92] <= 1'b1;
cur2_color[102] <= 1'b1;
cur2_color[103] <= 1'b1;
cur2_color[104] <= 1'b1;
cur2_color[105] <= 1'b1;
cur2_color[106] <= 1'b1;
cur2_color[116] <= 1'b1;
cur2_color[119] <= 1'b1;
cur2_color[120] <= 1'b1;
cur2_color[133] <= 1'b1;
cur2_color[134] <= 1'b1;
cur2_color[147] <= 1'b1;
cur2_color[148] <= 1'b1;
cur2_color[161] <= 1'b1;
cur2_color[162] <= 1'b1;
cur2_color[175] <= 1'b1;
cur2_color[176] <= 1'b1;
cur2_color[189] <= 1'b1;
cur2_color[190] <= 1'b1;
cur2_color[203] <= 1'b1;
cur2_color[204] <= 1'b1;
cur2_color[217] <= 1'b1;
cur2_color[218] <= 1'b1;
cur2_color[231] <= 1'b1;
cur2_color[232] <= 1'b1;
cur2_color[245] <= 1'b1;
cur2_color[246] <= 1'b1;
cur2_color[259] <= 1'b1;
cur2_color[260] <= 1'b1;

	 end
	 else if(display == 4'b0010)
	 begin
	 cur2_color[74] <= 1'b1;
cur2_color[75] <= 1'b1;
cur2_color[76] <= 1'b1;
cur2_color[77] <= 1'b1;
cur2_color[78] <= 1'b1;
cur2_color[87] <= 1'b1;
cur2_color[88] <= 1'b1;
cur2_color[92] <= 1'b1;
cur2_color[93] <= 1'b1;
cur2_color[101] <= 1'b1;
cur2_color[107] <= 1'b1;
cur2_color[108] <= 1'b1;
cur2_color[121] <= 1'b1;
cur2_color[122] <= 1'b1;
cur2_color[135] <= 1'b1;
cur2_color[136] <= 1'b1;
cur2_color[149] <= 1'b1;
cur2_color[150] <= 1'b1;
cur2_color[162] <= 1'b1;
cur2_color[163] <= 1'b1;
cur2_color[175] <= 1'b1;
cur2_color[176] <= 1'b1;
cur2_color[187] <= 1'b1;
cur2_color[188] <= 1'b1;
cur2_color[189] <= 1'b1;
cur2_color[200] <= 1'b1;
cur2_color[201] <= 1'b1;
cur2_color[213] <= 1'b1;
cur2_color[214] <= 1'b1;
cur2_color[227] <= 1'b1;
cur2_color[228] <= 1'b1;
cur2_color[241] <= 1'b1;
cur2_color[242] <= 1'b1;
cur2_color[255] <= 1'b1;
cur2_color[256] <= 1'b1;
cur2_color[257] <= 1'b1;
cur2_color[258] <= 1'b1;
cur2_color[259] <= 1'b1;
cur2_color[260] <= 1'b1;
cur2_color[261] <= 1'b1;
cur2_color[262] <= 1'b1;

end
else if(display == 4'b0011)
	 begin
	 cur2_color[74] <= 1'b1;
cur2_color[75] <= 1'b1;
cur2_color[76] <= 1'b1;
cur2_color[77] <= 1'b1;
cur2_color[78] <= 1'b1;
cur2_color[87] <= 1'b1;
cur2_color[88] <= 1'b1;
cur2_color[92] <= 1'b1;
cur2_color[93] <= 1'b1;
cur2_color[101] <= 1'b1;
cur2_color[107] <= 1'b1;
cur2_color[121] <= 1'b1;
cur2_color[135] <= 1'b1;
cur2_color[148] <= 1'b1;
cur2_color[149] <= 1'b1;
cur2_color[158] <= 1'b1;
cur2_color[159] <= 1'b1;
cur2_color[160] <= 1'b1;
cur2_color[161] <= 1'b1;
cur2_color[162] <= 1'b1;
cur2_color[176] <= 1'b1;
cur2_color[177] <= 1'b1;
cur2_color[191] <= 1'b1;
cur2_color[192] <= 1'b1;
cur2_color[206] <= 1'b1;
cur2_color[220] <= 1'b1;
cur2_color[227] <= 1'b1;
cur2_color[233] <= 1'b1;
cur2_color[234] <= 1'b1;
cur2_color[241] <= 1'b1;
cur2_color[246] <= 1'b1;
cur2_color[247] <= 1'b1;
cur2_color[255] <= 1'b1;
cur2_color[256] <= 1'b1;
cur2_color[257] <= 1'b1;
cur2_color[258] <= 1'b1;
cur2_color[259] <= 1'b1;
cur2_color[260] <= 1'b1;

end
else if(display == 4'b0100)
	 begin
	 cur2_color[78] <= 1'b1;
cur2_color[79] <= 1'b1;
cur2_color[92] <= 1'b1;
cur2_color[93] <= 1'b1;
cur2_color[105] <= 1'b1;
cur2_color[106] <= 1'b1;
cur2_color[107] <= 1'b1;
cur2_color[118] <= 1'b1;
cur2_color[119] <= 1'b1;
cur2_color[121] <= 1'b1;
cur2_color[132] <= 1'b1;
cur2_color[135] <= 1'b1;
cur2_color[145] <= 1'b1;
cur2_color[146] <= 1'b1;
cur2_color[149] <= 1'b1;
cur2_color[158] <= 1'b1;
cur2_color[159] <= 1'b1;
cur2_color[163] <= 1'b1;
cur2_color[171] <= 1'b1;
cur2_color[172] <= 1'b1;
cur2_color[177] <= 1'b1;
cur2_color[184] <= 1'b1;
cur2_color[185] <= 1'b1;
cur2_color[191] <= 1'b1;
cur2_color[198] <= 1'b1;
cur2_color[199] <= 1'b1;
cur2_color[200] <= 1'b1;
cur2_color[201] <= 1'b1;
cur2_color[202] <= 1'b1;
cur2_color[203] <= 1'b1;
cur2_color[204] <= 1'b1;
cur2_color[205] <= 1'b1;
cur2_color[206] <= 1'b1;
cur2_color[207] <= 1'b1;
cur2_color[219] <= 1'b1;
cur2_color[233] <= 1'b1;
cur2_color[247] <= 1'b1;
cur2_color[261] <= 1'b1;


end
else if(display == 4'b0101)
	 begin
	 cur2_color[74] <= 1'b1;
cur2_color[75] <= 1'b1;
cur2_color[76] <= 1'b1;
cur2_color[77] <= 1'b1;
cur2_color[78] <= 1'b1;
cur2_color[79] <= 1'b1;
cur2_color[80] <= 1'b1;
cur2_color[88] <= 1'b1;
cur2_color[102] <= 1'b1;
cur2_color[116] <= 1'b1;
cur2_color[130] <= 1'b1;
cur2_color[144] <= 1'b1;
cur2_color[158] <= 1'b1;
cur2_color[159] <= 1'b1;
cur2_color[160] <= 1'b1;
cur2_color[161] <= 1'b1;
cur2_color[162] <= 1'b1;
cur2_color[163] <= 1'b1;
cur2_color[177] <= 1'b1;
cur2_color[178] <= 1'b1;
cur2_color[192] <= 1'b1;
cur2_color[206] <= 1'b1;
cur2_color[220] <= 1'b1;
cur2_color[227] <= 1'b1;
cur2_color[233] <= 1'b1;
cur2_color[234] <= 1'b1;
cur2_color[241] <= 1'b1;
cur2_color[242] <= 1'b1;
cur2_color[246] <= 1'b1;
cur2_color[247] <= 1'b1;
cur2_color[256] <= 1'b1;
cur2_color[257] <= 1'b1;
cur2_color[258] <= 1'b1;
cur2_color[259] <= 1'b1;
cur2_color[260] <= 1'b1;

end
else if(display == 4'b0110)
	 begin
	 cur2_color[76] <= 1'b1;
cur2_color[77] <= 1'b1;
cur2_color[78] <= 1'b1;
cur2_color[79] <= 1'b1;
cur2_color[80] <= 1'b1;
cur2_color[89] <= 1'b1;
cur2_color[90] <= 1'b1;
cur2_color[102] <= 1'b1;
cur2_color[103] <= 1'b1;
cur2_color[116] <= 1'b1;
cur2_color[129] <= 1'b1;
cur2_color[130] <= 1'b1;
cur2_color[143] <= 1'b1;
cur2_color[157] <= 1'b1;
cur2_color[159] <= 1'b1;
cur2_color[160] <= 1'b1;
cur2_color[161] <= 1'b1;
cur2_color[162] <= 1'b1;
cur2_color[163] <= 1'b1;
cur2_color[171] <= 1'b1;
cur2_color[172] <= 1'b1;
cur2_color[173] <= 1'b1;
cur2_color[177] <= 1'b1;
cur2_color[178] <= 1'b1;
cur2_color[185] <= 1'b1;
cur2_color[186] <= 1'b1;
cur2_color[192] <= 1'b1;
cur2_color[193] <= 1'b1;
cur2_color[199] <= 1'b1;
cur2_color[207] <= 1'b1;
cur2_color[213] <= 1'b1;
cur2_color[221] <= 1'b1;
cur2_color[227] <= 1'b1;
cur2_color[228] <= 1'b1;
cur2_color[234] <= 1'b1;
cur2_color[235] <= 1'b1;
cur2_color[242] <= 1'b1;
cur2_color[243] <= 1'b1;
cur2_color[247] <= 1'b1;
cur2_color[248] <= 1'b1;
cur2_color[257] <= 1'b1;
cur2_color[258] <= 1'b1;
cur2_color[259] <= 1'b1;
cur2_color[260] <= 1'b1;
cur2_color[261] <= 1'b1;

end
else if(display == 4'b0111)
	 begin
cur2_color[73] <= 1'b1;
cur2_color[74] <= 1'b1;
cur2_color[75] <= 1'b1;
cur2_color[76] <= 1'b1;
cur2_color[77] <= 1'b1;
cur2_color[78] <= 1'b1;
cur2_color[79] <= 1'b1;
cur2_color[80] <= 1'b1;
cur2_color[81] <= 1'b1;
cur2_color[94] <= 1'b1;
cur2_color[95] <= 1'b1;
cur2_color[107] <= 1'b1;
cur2_color[108] <= 1'b1;
cur2_color[121] <= 1'b1;
cur2_color[134] <= 1'b1;
cur2_color[135] <= 1'b1;
cur2_color[148] <= 1'b1;
cur2_color[161] <= 1'b1;
cur2_color[162] <= 1'b1;
cur2_color[175] <= 1'b1;
cur2_color[188] <= 1'b1;
cur2_color[189] <= 1'b1;
cur2_color[202] <= 1'b1;
cur2_color[216] <= 1'b1;
cur2_color[229] <= 1'b1;
cur2_color[230] <= 1'b1;
cur2_color[243] <= 1'b1;
cur2_color[257] <= 1'b1;

end
else if(display == 4'b1000)
	 begin
	 cur2_color[75] <= 1'b1;
cur2_color[76] <= 1'b1;
cur2_color[77] <= 1'b1;
cur2_color[78] <= 1'b1;
cur2_color[88] <= 1'b1;
cur2_color[89] <= 1'b1;
cur2_color[92] <= 1'b1;
cur2_color[93] <= 1'b1;
cur2_color[101] <= 1'b1;
cur2_color[102] <= 1'b1;
cur2_color[107] <= 1'b1;
cur2_color[108] <= 1'b1;
cur2_color[115] <= 1'b1;
cur2_color[122] <= 1'b1;
cur2_color[129] <= 1'b1;
cur2_color[130] <= 1'b1;
cur2_color[135] <= 1'b1;
cur2_color[136] <= 1'b1;
cur2_color[144] <= 1'b1;
cur2_color[145] <= 1'b1;
cur2_color[148] <= 1'b1;
cur2_color[149] <= 1'b1;
cur2_color[159] <= 1'b1;
cur2_color[160] <= 1'b1;
cur2_color[161] <= 1'b1;
cur2_color[162] <= 1'b1;
cur2_color[172] <= 1'b1;
cur2_color[173] <= 1'b1;
cur2_color[176] <= 1'b1;
cur2_color[177] <= 1'b1;
cur2_color[185] <= 1'b1;
cur2_color[186] <= 1'b1;
cur2_color[191] <= 1'b1;
cur2_color[192] <= 1'b1;
cur2_color[199] <= 1'b1;
cur2_color[206] <= 1'b1;
cur2_color[213] <= 1'b1;
cur2_color[220] <= 1'b1;
cur2_color[227] <= 1'b1;
cur2_color[228] <= 1'b1;
cur2_color[233] <= 1'b1;
cur2_color[234] <= 1'b1;
cur2_color[242] <= 1'b1;
cur2_color[243] <= 1'b1;
cur2_color[246] <= 1'b1;
cur2_color[247] <= 1'b1;
cur2_color[257] <= 1'b1;
cur2_color[258] <= 1'b1;
cur2_color[259] <= 1'b1;
cur2_color[260] <= 1'b1;

end
else if(display == 4'b1001)
	 begin
	 cur2_color[75] <= 1'b1;
cur2_color[76] <= 1'b1;
cur2_color[77] <= 1'b1;
cur2_color[78] <= 1'b1;
cur2_color[88] <= 1'b1;
cur2_color[89] <= 1'b1;
cur2_color[92] <= 1'b1;
cur2_color[93] <= 1'b1;
cur2_color[101] <= 1'b1;
cur2_color[102] <= 1'b1;
cur2_color[107] <= 1'b1;
cur2_color[108] <= 1'b1;
cur2_color[115] <= 1'b1;
cur2_color[122] <= 1'b1;
cur2_color[129] <= 1'b1;
cur2_color[136] <= 1'b1;
cur2_color[143] <= 1'b1;
cur2_color[150] <= 1'b1;
cur2_color[157] <= 1'b1;
cur2_color[158] <= 1'b1;
cur2_color[163] <= 1'b1;
cur2_color[164] <= 1'b1;
cur2_color[172] <= 1'b1;
cur2_color[173] <= 1'b1;
cur2_color[176] <= 1'b1;
cur2_color[177] <= 1'b1;
cur2_color[178] <= 1'b1;
cur2_color[187] <= 1'b1;
cur2_color[188] <= 1'b1;
cur2_color[189] <= 1'b1;
cur2_color[190] <= 1'b1;
cur2_color[192] <= 1'b1;
cur2_color[206] <= 1'b1;
cur2_color[219] <= 1'b1;
cur2_color[220] <= 1'b1;
cur2_color[233] <= 1'b1;
cur2_color[241] <= 1'b1;
cur2_color[242] <= 1'b1;
cur2_color[245] <= 1'b1;
cur2_color[246] <= 1'b1;
cur2_color[247] <= 1'b1;
cur2_color[256] <= 1'b1;
cur2_color[257] <= 1'b1;
cur2_color[258] <= 1'b1;
cur2_color[259] <= 1'b1;


	 end
else
	 cur2_color <= 0;
	 end
endmodule
