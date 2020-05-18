module ALU_tb ();

logic [3 : 0] A;
logic [3 : 0] B;
logic cin;
logic [3 : 0] selection;
logic [3 : 0] result;

logic zero;
logic overflow;
logic negative;
logic carry_out;
 
ALU #(.NBits(4)) DUT (.A(A),.B(B),.carry_in(cin),
									.zero(zero),.overflow(overflow),
									.negative(negative),.carry_out(carry_out),
									.result(result), .selection(selection));
initial begin


//--------Suma 
selection = 4'h0;
// 3 + 2 + cin = 0 == 5
cin = 1'b0;
A = 4'h3;
B = 4'h2;
assert (result  === 4'h5) else $error("Suma de 3 + 2 fallo");
#10;
// 3 + 2 + cin = 1 == 6
cin = 1'b1;
assert (result  === 4'h6) else $error("Suma de 3 + 2 + cin = 1 fallo");
#10;

// 3 + - 2(Complemento en 2) cin = 0 == 1;
cin = 1'b0;
B = 4'b1110;//-2
assert (result  === 4'h1) else $error("Suma de 3 + -2  fallo");
#10;

// -3(complemento en 2) + 2 + cin = 0 == -1;
A = 4'b1101;//-2
B = 4'h2;
assert (result  === 4'b1111) else $error("Suma de -3 + 2  fallo");
#10;

// -3(complemento en 2) + 2 + cin = 1 == 0;
cin = 1'b1;
assert (result  === 4'h0) else $error("Suma de -3 + 2  fallo");
#10;

// -3 + -2 + cin = 0 == -5
B = 4'b1110;//-2
cin = 1'b0;
assert (result  === 4'h1011) else $error("Suma de -3 + -2  fallo");
#10;
// 7 + 1 + cin = 0 == Overflow
A = 4'h7;
B = 4'h1;
assert (result  === 4'h1000) else $error("Suma de 7 + 1  fallo");
assert (overflow  === 1'h1) else $error("Suma de 7 + 1  fallo overflow");


end
endmodule 