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


//---------------------Suma------------------------------ 
selection = 4'h0; cin = 1'b0; A = 4'h3; B = 4'h2; #10;

// 3 + 2 + cin = 0 == 5
assert (result  === 4'h5) else $error("Suma de 3 + 2 fallo");


// 3 + 2 + cin = 1 == 6

cin = 1'b1; #10;
assert (result  === 4'h6) else $error("Suma de 3 + 2 + cin = 1 fallo");


// 3 + - 2(Complemento en 2) cin = 0 == 1;

cin = 1'b0; B = 4'b1110; #10;
assert (result  === 4'h1) else $error("Suma de 3 + -2  fallo");


// -3(complemento en 2) + 2 + cin = 0 == -1;

A = 4'b1101; B = 4'h2; #10;
assert (result  === 4'b1111) else $error("Suma de -3 + 2  fallo");


// -3(complemento en 2) + 2 + cin = 1 == 0;

cin = 1'b1; #10;
assert (result  === 4'h0) else $error("Suma de -3 + 2  fallo");

// -3 + -2 + cin = 0 == -5

B = 4'b1110; cin = 1'b0; #10;
assert (result  === 4'b1011) else $error("Suma de -3 + -2  fallo");


// 7 + 1 + cin = 0 == Overflow

A = 4'h7; B = 4'h1; #10;
assert (result  === 4'b1000) else $error("Suma de 7 + 1  fallo");
assert (overflow  === 1'h1) else $error("Suma de 7 + 1  fallo overflow");
//----------------------------------------------------------------------


//------------------Resta-----------------------------------------------
selection = 4'h1; 

// 5 - 2

A = 4'h5; B = 4'h2; #10;
assert (result  === 4'h3) else $error("Resta de 5 - 2  fallo");

// 7 - 5

A = 4'h7; B = 4'h5; #10;
assert (result  === 4'h2) else $error("Resta de 7 - 5  fallo");

//-3 - 4

A = 4'b1101; B = 4'h4; #10;
assert (result  === 4'b1001) else $error("Resta de -3 - 4  fallo");

//0 - 2

A = 4'h0; B = 4'h2; #10;
assert (result  === 4'b1110) else $error("Resta de 0 - 2  fallo");

//5 - 0

A = 4'h5; B = 4'h0; #10;
assert (result  === 4'h5) else $error("Resta de 5 - 0  fallo");
//----------------------------------------------------------------------

end
endmodule 