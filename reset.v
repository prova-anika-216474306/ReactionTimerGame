module reset(input [32:0] dist, output reg uu);

//wire so = (dist == 33'b000000000000000000000000000001110);
 

	always@(dist) 
	begin
	if(dist == 33'b000000000000000000000000000001110)
	begin
	uu <= 0;
	end
	else
	begin
	uu <= 1;
	end
	
	end
	
	
	
endmodule