module highscoreMUX (a,b,switch,finalhs);
	
	input switch;
	input [23:0]a;
	input [23:0]b;
	
	output reg [23:0]finalhs;
	
	
	always@(a, b, switch)
		case(switch)
			0 : finalhs[23:0] <= a[23:0];
			1 : finalhs[23:0] <= b[23:0];
		endcase
	
	
endmodule 