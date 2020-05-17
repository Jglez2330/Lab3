module shift_left_arithmetic #(parameter bus = 4)(
	input logic signed [bus-1:0] a,
	input logic [bus-1:0] b,
	
	output logic signed [bus-1:0] y);

assign y = a <<< b;

endmodule    
