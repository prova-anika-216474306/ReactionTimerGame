
//7 SEGMENT DECODER MODULE

module decoder(a,seg);
	input [3:0]a;
	output reg [6:0]seg;
	//Declare input and output.
	
	always@(a)
		case(a)
			4'b0000 : seg[6:0] = 7'b1000000;
			4'b0001 : seg[6:0] = 7'b1111001;
			4'b0010 : seg[6:0] = 7'b0100100;
			4'b0011 : seg[6:0] = 7'b0110000;
			4'b0100 : seg[6:0] = 7'b0011001;
			4'b0101 : seg[6:0] = 7'b0010010;
			4'b0110 : seg[6:0] = 7'b0000010;
			4'b0111 : seg[6:0] = 7'b1111000;
			4'b1000 : seg[6:0] = 7'b0000000;
			4'b1001 : seg[6:0] = 7'b0010000;
			default : seg[6:0] = 7'b1000000;
		endcase
	
	
endmodule 


//LED Decoder

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