module statemachine(key, cin , y , s1);
	input key, cin, y;
	output reg s1;
	
	
	reg a;
	reg b;
	
	
	initial
		s1 = 0;
	
	
	always@(posedge cin) 
	
	begin
		a = key	& ~s1;
		b = ~y & s1;
		s1 = a | b;
	end
	
	
endmodule 