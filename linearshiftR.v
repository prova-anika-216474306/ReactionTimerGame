module linearshiftR(cin,r);
	
	input cin;
	output reg [11:0]r;
	
	
	initial
		r = 12'b010010101101;
	
	
	always@(posedge cin) 
	
	begin
		if (r == 12'b000000000000)
			r[11:0] <= 12'b000000001101;
		
		else 
		
		begin
			r[11] <= r[10];
			r[10] <= r[9];
			r[9] <= r[8];
			r[8] <= r[7];
			r[7] <= r[6];
			r[6] <= r[5];
			r[5] <= r[4];
			r[4] <= r[3];
			r[3] <= r[2];
			r[2] <= r[1];
			r[1] <= r[0];
			r[0] <= r[5]^r[6];
			
		end
	end
	
endmodule 