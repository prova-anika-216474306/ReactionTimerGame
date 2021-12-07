module sensor(clock, trig, echo, reset, stop);


input clock;
input reset;
output trig;
output reg stop;
input echo;



sonic s(clock, trig, echo, distance);

wire [32:0] distance;
ClockDivider(clock,cout);

wire cout;
//reg p;
//record of 0

reg[3:0] digit1 = 4'd0;


reg [32:0] b =1;
//assign stop = 0;

//always @(posedge cout)
//begin
//	b <= distance;
//end


always @(posedge cout) //counter logic
begin

b <= distance;

if (reset == 0) //reset is 0 means button pushed 
	begin
	
	stop <= 0;
	//digit1 = 4'd0;
	end
	
else if(b > 32'b000000000000000000000000000001111)
	begin
		stop <= 1;
	
		//digit1 <= digit1;
		
	end
	
else if (reset != 0)
	begin
		stop <=0;
       //digit1 <= digit1 + 1;
       end

end

//decoder d1(digit1, light);

endmodule