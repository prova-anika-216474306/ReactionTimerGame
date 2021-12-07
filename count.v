module count(reset_button, act,clock,cout,outnum);
	
	input reset_button, act, clock;
	output reg cout;
	output reg [3:0] outnum;
	
	
	
	always@(posedge clock, posedge reset_button) 
	begin
		if(reset_button)
			outnum <= 4'b0000;
		
		else if (act) 
		
		begin
			if (outnum == 4'b0100)
				cout <= 1'b0;
			if (outnum == 4'b1001) 
			
			begin
				cout <= 1'b1;
				outnum <= 1'b0000;
			end
			else
				outnum <= outnum + 1'b1;
		end
		else
			outnum = outnum;
		
	end

endmodule 