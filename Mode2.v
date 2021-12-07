module Mode2(selection, selection2, key, counter, sw,cin,cout, highscore_mode2, signal2,light2);
	input selection, key, cin, cout;
	input selection2;
	input [23:0]counter;
	input [7:0] sw;
	output [23:0] highscore_mode2;
	output [9:0]light2;
	output reg signal2;
	
	
	wire match, s1, s2;
	wire [7:0] c;
	reg W, y;
	
		always@(posedge cin) 
	begin
		if(selection) 
		begin
			W <= key;
			y <= match;
			if(s2) 
			begin
				if(s1)
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
			y <= 1'b1;
		end
			
	end
	


shifter register1(cout, c[7:4]);

shifter register2(cin,c[3:0]);

statemachine sm1(W, cin, y, s1);

delayCount dc2(12'b0010111011100, W, cout, s2);
	
compareLED cl1(cin, sw[7:0], light2[7:0], match);

lightdecoder ledseries(c[3:0],c[7:4], signal2,cin, light2[9:0]);
	
highscore hs2(signal2, counter[23:0], selection2, highscore_mode2[23:0]);
	
	
	

	
endmodule 


