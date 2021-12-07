module statereset(switch,clock,r);
	
	input switch, clock;
	output reg r;
	
	reg s[1:0];
	
	always@(posedge clock) 
	begin
		s[1] <= s[0] & switch;
		s[0] <= switch;
		r    <= ~s[1] & s[0];
	end
	
endmodule 