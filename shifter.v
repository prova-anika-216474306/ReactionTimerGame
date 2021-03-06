module shifter(clock,c);
	
	input clock;
	output reg [3:0]c;
	
	
	initial
		c = 4'b0001;
	
	
	always@(posedge clock) 
	
	begin
			c[3]<=c[2];
			c[2]<=c[1];
			c[1]<=c[0];
			c[0]<=c[3];
	
	end
	
	
endmodule 