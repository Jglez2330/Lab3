module adder_1bit (
	input logic a, b, carry_in, 

	output logic result, carry_out
	);

// assign {carry_out, result} = carry_in + a + b;

assign result = (a ^ b) ^ carry_in;
assign carry_out = (a & b) | (carry_in & (a ^ b));

endmodule 
 