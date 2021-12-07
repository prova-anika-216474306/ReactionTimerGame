module highscore (b, timecount, switch, hs);
	input b,switch;
	
	input [23:0] timecount;
	output reg [23:0] hs;
	

	
	always@(negedge b) 
	
	begin

		if (hs == 0 && timecount != 0)
			hs = timecount;
			
		
		
		else 
		
		begin
		
		//new time is less than the current highscore, replce
		//highscore with the current value
		//lowest value wins
		
			if(timecount < hs && timecount != 0)
				hs[23:0] = timecount[23:0];
			else if(switch == 1 && x == 1)
			hs =0;
		
			else
				hs[23:0] = hs[23:0];
			
			
		end
	end
	
	reg x = 0;
	always@(posedge switch)

begin
x = x + 1;
	end
endmodule 
