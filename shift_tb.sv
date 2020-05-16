`timescale 1ns/ 1ps

module shift_tb;
	localparam period = 20;

	parameter bus = 4;

	logic [bus-1:0] a;
	logic [bus-1:0] b;
	
	logic [bus-1:0] y;

	// shift_right DUT (.a(a), .b(b), .y(y));
	shift_left DUT (.a(a), .b(b), .y(y));

	initial begin
		a = {bus{1'b1}};
		b = {bus{1'b0}};
	end

	initial begin
    	b = 4'b0000; 
    	#period; $assertoff(b,4'b1111);
    	b = 4'b0001; #period;
    	b = 4'b0010; #period;
    	b = 4'b0011; #period;
		b = 4'b0100; #period;
		b = 4'b0101; #period;
	end  

endmodule  