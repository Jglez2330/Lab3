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

// 5 - 1

A = 4'h5; B = 4'h1; #10;
assert (result  === 4'h4) else $error("Resta de 5 - 1  fallo");

//----------------------------------------------------------------------

//---------------------------Corrimiento Logico/Aritmetico Izquierdo---------------

selection = 4'h6; A = 4'b1100; B = 4'h2; #10;

// 1100 << 2

assert (result  === 4'b0000) else $error("Corrimiento izquierdo 1100 << 2  fallo");

// 0001 << 1

A = 4'b0001; B = 4'h1; #10;
assert (result  === 4'b0010) else $error("Corrimiento izquierdo 0001 << 1  fallo");

// 0101 << 1

A = 4'b0101; #10;
assert (result  === 4'b1010) else $error("Corrimiento izquierdo 0101 << 1  fallo");

// 0001 << 3

A = 4'b0001; B = 4'h3; #10;
assert (result  === 4'b1000) else $error("Corrimiento izquierdo 0001 << 3  fallo");

// 0001 << 5

A = 4'b0001; B = 4'h5; #10;
assert (result  === 4'h0) else $error("Corrimiento izquierdo 0001 << 5  fallo");

// 0111 << 1

A = 4'b0111; B = 4'h1; #10;
assert (result  === 4'b1110) else $error("Corrimiento izquierdo 0111 << 1  fallo");

//----------------------------------------------------------------------

//---------------------------Corrimiento Logico Derecho---------------

selection = 4'h7; A = 4'b1100; B = 4'h2; #10;

// 1100 >> 2

assert (result  === 4'b0011) else $error("Corrimiento Derecho logico 1100 >> 2  fallo");

// 0001 >> 1

A = 4'b0001; B = 4'h1; #10;
assert (result  === 4'b0000) else $error("Corrimiento Derecho logico 0001 >> 1  fallo");

// 0101 >> 1

A = 4'b0101; #10;
assert (result  === 4'b0010) else $error("Corrimiento Derecho logico 0101 >> 1  fallo");

// 0110 >> 2

A = 4'b1010; B = 4'h2; #10;
assert (result  === 4'b0010) else $error("Corrimiento Derecho logico 1010 >> 2  fallo");

// 0001 >> 5

A = 4'b0001; B = 4'h5; #10;
assert (result  === 4'h0) else $error("Corrimiento Derecho logico 0001 >> 5  fallo");

// 0111 >> 1

A = 4'b0111; B = 4'h1; #10;
assert (result  === 4'b0011) else $error("Corrimiento Derecho logico 0111 >> 1  fallo");

//----------------------------------------------------------------------

//---------------------------Corrimiento Aritmetico Derecho---------------

selection = 4'h8; A = 4'b1100; B = 4'h2; #10;

// 1100 >> 2

assert (result  === 4'b1111) else $error("Corrimiento Derecho aritmetico 1100 >> 2  fallo");

// 0001 >> 1

A = 4'b0001; B = 4'h1; #10;
assert (result  === 4'b0000) else $error("Corrimiento Derecho aritmetico 0001 >> 1  fallo");

// 0101 >> 1

A = 4'b0101; #10;
assert (result  === 4'b0010) else $error("Corrimiento Derecho aritmetico 0101 >> 1  fallo");

// 0110 >> 2

A = 4'b1010; B = 4'h2; #10;
assert (result  === 4'b1110) else $error("Corrimiento Derecho aritmetico 1010 >> 2  fallo");

// 0001 >> 5

A = 4'b0001; B = 4'h5; #10;
assert (result  === 4'h0) else $error("Corrimiento Derecho aritmetico 0001 >> 5  fallo");

// 0111 >> 1

A = 4'b0111; B = 4'h1; #10;
assert (result  === 4'b0011) else $error("Corrimiento Derecho aritmetico 0111 >> 1  fallo");

//----------------------------------------------------------------------

//-------------------------AND------------------------------------------

// 0000 & 0000
selection = 4'h2; A = 4'h0; B = 4'h0; #10;
assert (result === 4'h0) else $error("AND entre 0000 & 0000 Fallo");

// 1111 & 0000
A = 4'hF; #10;
assert (result === 4'h0) else $error("AND entre 1111 & 0000 Fallo");

// 1111 & 0101
B = 4'h5; #10;
assert (result === 4'h5) else $error("AND entre 1111 & 0101 Fallo");

// 0000 & 0110
A = 4'h0; B = 4'h6; #10;
assert (result === 4'h0) else $error("AND entre 0000 & 0110 Fallo");

// 0101 & 0110
A = 4'h5; #10;
assert (result === 4'b0100) else $error("AND entre 0101 & 0110 Fallo");

// 1111 & 1111

A = 4'hF; B = 4'hF;#10;
assert (result === 4'hF) else $error("AND entre 1111 & 1111 Fallo");

//----------------------------------------------------------------------


//-------------------------OR-------------------------------------------

// 0000 | 0000
selection = 4'h3; A = 4'h0; B = 4'h0; #10;
assert (result === 4'h0) else $error("OR entre 0000 | 0000 Fallo");

// 1111 | 0000
A = 4'hF; #10;
assert (result === 4'hF) else $error("OR entre 1111 | 0000 Fallo");

// 1111 | 0101
B = 4'h5; #10;
assert (result === 4'hF) else $error("OR entre 1111 | 0101 Fallo");

// 0000 | 0110
A = 4'h0; B = 4'h6; #10;
assert (result === 4'h6) else $error("OR entre 0000 | 0110 Fallo");

// 0101 | 0110
A = 4'h5; #10;
assert (result === 4'h7) else $error("OR entre 0101 | 0110 Fallo");

// 1111 | 1111

A = 4'hF; B = 4'hF;#10;
assert (result === 4'hF) else $error("OR entre 1111 | 1111 Fallo");

//----------------------------------------------------------------------


//-------------------------XOR------------------------------------------

// 0000 ^ 0000
selection = 4'h5; A = 4'h0; B = 4'h0; #10;
assert (result === 4'h0) else $error("XOR entre 0000 ^ 0000 Fallo");

// 1111 ^ 0000
A = 4'hF; #10;
assert (result === 4'hF) else $error("XOR entre 1111 ^ 0000 Fallo");

// 1111 ^ 0101
B = 4'h5; #10;
assert (result === 4'hA) else $error("XOR entre 1111 ^ 0101 Fallo");

// 0000 ^ 0110
A = 4'h0; B = 4'h6; #10;
assert (result === 4'h6) else $error("XOR entre 0000 ^ 0110 Fallo");

// 0101 ^ 0110
A = 4'h5; #10;
assert (result === 4'h3) else $error("XOR entre 0101 ^ 0110 Fallo");

// 1111 ^ 1111

A = 4'hF; B = 4'hF;#10;
assert (result === 4'h0) else $error("XOR entre 1111 ^ 1111 Fallo");

//----------------------------------------------------------------------

//-------------------------NOT A----------------------------------------

// ~ 0000
selection = 4'h4; A = 4'h0; #10;
assert (result === 4'hF) else $error("NOT de 0000 Fallo");

// ~ 1001
A = 4'h9; #10;
assert (result === 4'h6) else $error("NOT de 1001 Fallo");

// ~ 1010
A = 4'hA; #10;
assert (result === 4'h5) else $error("NOT de 1010 Fallo");

// ~ 1011
A = 4'hB; #10;
assert (result === 4'h4) else $error("NOT de 1011 Fallo");

// ~ 1100
A = 4'hC; #10;
assert (result === 4'h3) else $error("NOT de 1100 Fallo");

// ~ 1111

A = 4'hF; #10;
assert (result === 4'h0) else $error("NOT de 1111 Fallo");

//----------------------------------------------------------------------


//-------------------------Flags----------------------------------------

//Zero

selection = 4'h1;
A = 4'h1; B = 4'h1; #10;
assert (zero  === 4'h1) else $error("Flag zero fallo");

//Carry out

selection = 4'h0;
A = 4'hF; B = 4'h1; #10;
assert (carry_out  === 4'h1) else $error("Flag carry_out fallo");

//Overflow

selection = 4'h0;
A = 4'h7; B = 4'h1; #10;
assert (overflow  === 4'h1) else $error("Flag overflow fallo");

//Carry out and overflow

selection = 4'h1;
A = 4'hF; B = 4'h8; #10;
assert (carry_out  === 4'h1) else $error("Flag carry_out fallo");
assert (overflow  === 4'h1) else $error("Flag overflow  fallo");

//Negative
B = 4'h0; #10;
assert (negative  === 4'h1) else $error("Flag Negative fallo");

//Carry_out
A = 4'hE; B = 4'h2; #10;
assert (carry_out  === 4'h1) else $error("Flag carry_out fallo");

//----------------------------------------------------------------------

end
endmodule 