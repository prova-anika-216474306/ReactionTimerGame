module multiplexer(a,b,switch,result);
	input [3:0]a;
	input [3:0]b;
	input switch;
	output reg [3:0]result;
	
	
	always@(a, b, switch)
	
	case(switch)
			0 : result[3:0] <= a[3:0];
			1 : result[3:0] <= b[3:0];
		endcase
	
	
endmodule 


//multiplexer for highest score in each game

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