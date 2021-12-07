module lightdecoder(c1,c2,signal2,cin,light2);
	input [3:0]c1;
	input [3:0]c2;
	input signal2, cin;
	output reg [9:0] light2;
	
	
	initial
	begin
		light2[9:0] = 10'b0000000000;
	end
	
	always@(posedge cin) 
	begin
		if (signal2) 
		begin
			if (light2[7:0] == 8'b00000000) 
begin
				light2[3:0] <= c1[3:0];
				light2[7:4] <= c2[3:0];
				light2[9:8] <= 2'b00;
end
			
			
else
				light2[9:0] <= light2[9:0];
			
end
		
else

//signal2 is off
			light2[9:0] <=10'b0000000000;
		
end
	
endmodule 