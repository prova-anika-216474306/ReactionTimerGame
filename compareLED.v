module compareLED (cin, switch, light2, flag);
	
	input [7:0]switch;
	input [7:0]light2;
	
	input cin;
	output reg flag;
	
	
	always@(posedge cin) 
	
	begin
		if (light2 == 8'b00000000)
			flag = 1'b0;
		
		else 
		
		begin
			if (switch[7:0] == light2[7:0])
				flag = 1'b1;
			
			
			else
				flag = 1'b0;
			
		end
	end
	
endmodule 