module Mode1(selection, selection2, trig, echo, key, counter, cin, cout, highscore_mode1, activation, b,light1);
	
	//selection is mode selection
	//key in the button pressed
	
	
	
	input echo;
	output trig;

	input selection, selection2, key,  cin, cout;
	input [23:0] counter;
	output reg b;
	output reg activation;
	output reg [9:0] light1;
	output [23:0] highscore_mode1;
	
	

	wire [11:0]r;

	
	linearshiftR lsr1(cin, r[11:0]);
	
	delayCount dc(r[11:0], ~key ,cout, a);
	
	wire a;
	
	highscore hs1(b, counter[23:0], selection2, highscore_mode1[23:0]);
	
	
always@(posedge cin) begin
		if (selection) begin
			activation = b && a;
			light1[9] = b && a;
			light1[8] = b && a;
			light1[7] = b && a;
			light1[6] = b && a;
			light1[5] = b && a;
			light1[4] = b && a;
			light1[3] = b && a;
			light1[2] = b && a;
			light1[1] = b && a;
			light1[0] = b && a;
		end
		else begin
			activation = 1'b0;
			light1[9:0] = 10'b0000000000;
		end
	end
	
	
//for stopping
sensor sn1(cin, trig, echo, key, stop);

wire stop;

reg decide;

always@(posedge cin) 
begin
	if(selection2)
	begin
	decide <= stop;
	end
	else
	begin
	decide <= key;
	end
	end
	
always@(posedge decide, negedge selection) 
begin
		if (~selection) //MODE SELECTION
			b <= 1'b0;
		else
			b <= b^1'b1;
	end
	

endmodule 