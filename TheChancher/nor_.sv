module nor_ #(parameter bus = 4)(
	input [bus-1:0] a, b,

	output [bus-1:0] y
	);

assign y = ~(a | b);

endmodule
