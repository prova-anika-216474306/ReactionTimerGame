module delayCount (r, key, clock1 ,output_signal);
	input [11:0]r;
	input key;
	input clock1;
	output reg output_signal;
	
	reg [11:0] counter;
	
	always@(posedge clock1, posedge key) 
	begin
		if (key) 
		begin
			counter[11:0] <= r[11:0];
			output_signal <= 1'b0;
		end
		
		//only when counter is zero, output signal is one
		else 
		begin
			if (counter == 12'b000000000000)
			begin
				output_signal <= 1'b1;
			end
		//else the counter keeps decrementing and signal continues to be 0
			else 
			begin
				counter <= counter - 1'b1;
				output_signal <= 1'b0;
			end
		end
	end
	
	initial
	begin
		output_signal = 1'b0;
	end
	
	
	endmodule
