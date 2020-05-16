`timescale 1ns/ 1ps

module shift_tb;
	localparam period = 20;

	parameter bus = 4;

	logic signed [bus-1:0] a;
	logic [bus-1:0] b;
	
	logic signed [bus-1:0] y;

	// shift_right DUT (.a(a), .b(b), .y(y));
	// shift_left DUT (.a(a), .b(b), .y(y));
	// shift_left_arithmetic DUT (.a(a), .b(b), .y(y));
	shift_right_arithmetic DUT (.a(a), .b(b), .y(y));

	initial begin
		a = 4'b1001;

    	b = 4'b0000; #period;
    	b = 4'b0001; #period;
    	b = 4'b0010; #period;
    	b = 4'b0011; #period;
		b = 4'b0100; #period;
	end  

endmodule     