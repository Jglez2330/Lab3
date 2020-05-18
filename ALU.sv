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
logic [NBits - 1 : 0] resultLShiftLogic;
logic [NBits - 1 : 0] resultRShiftLogic;
logic [NBits - 1 : 0] resultRShiftArithmetic;


//Operaciones Aritméticas

NBitsFullAdder #(.NBits(NBits)) Adder  (.A(A), .B(B), .cin(carry_in), .cout(cout[0]), .result(resultAdder));
NBitsFullSubstractor #(.NBits(NBits)) Substractor  (.A(A), .B(B), .cout(cout[1]), .result(resultSubstractor));

//Operaciones Lógicas

and_N	#(.N(NBits)) And (.a(A), .b(B), .y(resultAND));	
or_N	#(.N(NBits)) OR (.a(A), .b(B), .y(resultOR));
notA_N #(.N(NBits)) NOT (.a(A),.y(resultNOT));
xor_N	#(.N(NBits)) XOR (.a(A), .b(B), .y(resultXOR));

//Selección de Operación

MUX_N #(.NBITS(NBits)) Mux  (.A(resultAdder), .B(resultSubstractor),
										.C(resultAND), .D(resultOR), 
										.E(resultNOT), .F(resultXOR),
										.G(resultLShiftLogic), .H(resultRShiftLogic),
										.I(resultRShiftArithmetic),.nOUT(result), .selection(selection));
										
MUX_N #(.NBITS(1)) MuxCarryOut  (.A(cout[0]), .B(cout[1]),
										.nOUT(carry_out), .selection(selection));
																	

//Lógica de Banderas
										
flagZero_logic #(.N(NBits)) ZeroFlag (.y(result),.z(zero));										
assign negative = result[NBits - 1];
flagVB_logic VFlag (.so3(selection[3]), .so2(selection[2]), .so1(selection[1]), .yn1(result[NBits-1]), .an1(A[NBits-1]), .bn1(B[NBits-1]), .V(overflow));

shift_left #(.bus(NBits)) LeftShiftLogic (.a(A),.b(B), .y(resultLShiftLogic));

shift_right #(.bus(NBits)) RightShiftLogic (.a(A),.b(B), .y(resultRShiftLogic));

shift_right_arithmetic #(.bus(NBits)) RightShiftArithmetic (.a(A),.b(B), .y(resultRShiftArithmetic));
endmodule 