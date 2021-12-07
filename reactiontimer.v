module reactiontimer(keybutton, selection, trig, echo, cin,segments,d,led);
	
	input cin;
	input [1:0]keybutton;
	input [9:0]selection;
	output [41:0]segments;
	output d;
	output [9:0]led;
	input echo;
	output trig;
	
	wire cout, clk100, clk10, clk1, clk01, clk001, clkn, activation1, activation2, acivationALL, b;
	wire [23:0] highscoreone;
	wire [23:0] highscoretwo;
	wire [9:0]light1;
	wire [9:0]light2;
	wire [23:0]highscoreALL;
	wire [23:0]o;
	wire [23:0]C;
	wire R3, R4;
	reg R1, R2, R;
	
	
 	ClockDivider cd(cin,cout);
	
	Mode1 m1(~selection[9], selection[0], trig, echo,  keybutton,o[23:0],cin,cout,highscoreone[23:0],activation1,b,light1[9:0]);
	
	
	Mode2 m2(selection[9], selection[0], ~keybutton[1],o[23:0],selection[7:0],cin,cout, highscoretwo[23:0],activation2,light2[9:0]);
	
	statereset sr1(selection[9],cout,R3);
	statereset sr2(~selection[9],cout,R4);
	
	assign activationALL = activation1 | activation2;
	
	assign led[9] = light1[9] | light2[9];
	assign led[8] = light1[8] | light2[8];
	assign led[7] = light1[7] | light2[7];
	assign led[6] = light1[6] | light2[6];
	assign led[5] = light1[5] | light2[5];
	assign led[4] = light1[4] | light2[4];
	assign led[3] = light1[3] | light2[3];
	assign led[2] = light1[2] | light2[2];
	assign led[1] = light1[1] | light2[1];
	assign led[0] = light1[0] | light2[0];
	
	count counter0(R,activationALL,cout,clk100,o[3:0]);
	count counter1(R,activationALL,clk100,clk10,o[7:4]);
	count counter2(R,activationALL,clk10,clk1,o[11:8]);
	count counter3(R,activationALL,clk1,clk01,o[15:12]);
	count counter4(R,activationALL,clk01,clk001,o[19:16]);
	count counter5(R,activationALL,clk001,clkn,o[23:20]);

	multiplexer mux0(o[3:0],highscoreALL[3:0],selection[8],C[3:0]);
	multiplexer mux1(o[7:4],highscoreALL[7:4],selection[8],C[7:4]);
	multiplexer mux2(o[11:8],highscoreALL[11:8],selection[8],C[11:8]);
	multiplexer mux3(o[15:12],highscoreALL[15:12],selection[8],C[15:12]);
	multiplexer mux4(o[19:16],highscoreALL[19:16],selection[8],C[19:16]);
	multiplexer mux5(o[23:20],highscoreALL[23:20],selection[8],C[23:20]);

	highscoreMUX hsmux(highscoreone[23:0],highscoretwo[23:0],selection[9],highscoreALL[23:0]);

	
	always@(posedge cin) 
	
	begin
	
		R1 = ~b & ~keybutton[0] & ~selection[9];  //for mode1
		R2 = ~activation2 & ~keybutton[1] & selection[9];
		R = R1 | R2 | R3 | R4;
	end
	
	
	
	
	
	assign d = 0;
	
	decoder digit0(C[3:0],segments[6:0]); //hex0
	decoder digit1(C[7:4],segments[13:7]); //hex1
	decoder digit2(C[11:8],segments[20:14]); //hex2
	decoder digit3(C[15:12],segments[27:21]); //hex3
	decoder digit4(C[19:16],segments[34:28]); //hex4
	decoder digit5(C[23:20],segments[41:35]); //hex5
	

endmodule
