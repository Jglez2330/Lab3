module ALU #(parameter NBits = 8) (input logic [3 : 0] selection, 
												input logic [NBits - 1 : 0] A,
												input logic [NBits - 1 : 0] B,
												input logic carry_in,
												output logic zero,
												output logic overflow,
												output logic negative,
												output logic carry_out,
												output logic [NBits - 1: 0] result);
												
logic [1:0] cout;
logic [NBits - 1 : 0] resultAdder;
logic [NBits - 1 : 0] resultSubstractor;
logic [NBits - 1 : 0] resultAND;
logic [NBits - 1 : 0] resultOR;
logic [NBits - 1 : 0] resultNOT;
logic [NBits - 1 : 0] resultXOR;
logic [NBits - 1 : 0] g;
logic [NBits - 1 : 0] h;
logic [NBits - 1 : 0] i;
logic [NBits - 1 : 0] j;
logic [NBits - 1 : 0] k;
logic [NBits - 1 : 0] l;
logic [NBits - 1 : 0] m;
logic [NBits - 1 : 0] n;
logic [NBits - 1 : 0] o;
logic [NBits - 1 : 0] p;
NBitsFullAdder #(.NBits(NBits)) Adder  (.A(A), .B(B), .cin(carry_in), .cout(cout[0]), .result(resultAdder));
NBitsFullSubstractor #(.NBits(NBits)) Substractor  (.A(A), .B(B), .cout(cout[1]), .result(resultSubstractor));

MUX_N #(.NBITS(NBits)) Mux  (.A(resultAdder), .B(resultSubstractor),
										.C(resultAND), .D(resultOR), 
										.E(resultNOT), .F(resultXOR), .nOUT(result), .selection(selection));
MUX_N #(.NBITS(1)) MuxCarryOut  (.A(cout[0]), .B(cout[1]),
										.nOUT(carry_out), .selection(selection));
and_N	#(.N(NBits)) And (.a(A), .b(B), .y(resultAND));	
or_N	#(.N(NBits)) OR (.a(A), .b(B), .y(resultOR));
notA_N #(.N(NBits)) NOT (.a(A),.y(resultNOT));
xor_N	#(.N(NBits)) XOR (.a(A), .b(B), .y(resultXOR));
										
flagZero_logic #(.N(NBits)) ZeroFlag (.y(result),.z(zero));										
assign negative = result[NBits - 1];
endmodule 