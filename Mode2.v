module Mode2(selection, key, counter, sw,cin,cout, highscore_mode2, signal2,light2);
	input selection, key, cin, cout;
	input [23:0]counter;
	input [7:0] sw;
	output [23:0] highscore_mode2;
	output [9:0]l light2;
	output reg signal2;
	
	
	wire match, Z, A;
	wire [7:0]c;
	reg W, Match;
	
	
	delayCount dc2(12'b0010111011100, W, cout,A);
	
//	Compare CMP1(cin, sw[7:0], light2[7:0],match);
//	
//	StateMachine S1(W,cin, Match,Z);
//	
//	ShiftReg R1(cin,c[3:0]);
//	
//	ShiftReg R2(cout, c[7:4]);
//	
//	LED_Decoder LD1(c[3:0],c[7:4], signal2,cin, light2[9:0]);
	
	highscore hs2(signal2, counter[23:0],highscore_mode2[23:0]);
	
	
	
	always@(posedge cin) 
	begin
		if(selection) 
		begin
			W <= key;
			Match <= match;
			if(A) 
			begin
				if(Z)
					signal2 = 1'b1;
				else
					signal2 = 1'b0;
			end
			else
				signal2 = 1'b0;
		end
		
		else 
		begin
			signal2 = 1'b0;
			W <= 1'b0;
			Match <= 1'b1;
		end
			
	end
	
endmodule 
