module or_ #(parameter bus = 4)(
	input logic [bus-1:0] a, b,

	output logic [bus-1:0] y);

assign y = a | b;

endmodule
