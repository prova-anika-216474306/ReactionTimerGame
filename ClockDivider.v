module ClockDivider(cin,cout);

	input cin;
	output reg cout;
	reg [14:0]count;
	
	
	always@(posedge cin) begin
		count <= count + 1'b1;
		if (count == 25000) begin
			cout <= cout ^ 1'b1;
			count <= 1'b0;
		end
		
	end

endmodule 