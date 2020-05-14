module NBitsFullSubstractor #(parameter NBits = 4) (input logic [NBits - 1 : 0] A,
																		input logic [NBits - 1 : 0] B,
																		output logic cout,
																		output logic [NBits - 1 : 0] result);
logic [NBits : 0] cins;
assign cins[0] = 1'b1;

genvar i;
generate
for (i = 0; i < NBits; i += 1) begin : GenAdders
OneBitFullAdder U1 (.A(A[i]), .B(~B[i] ), .cin(cins[i]), .cout(cins[i + 1]),
						.result(result[i]));

end
endgenerate 
assign cout = cins[NBits];

endmodule		