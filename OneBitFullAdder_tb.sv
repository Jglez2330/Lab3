module OneBitFullAdder_tb();
logic A;
logic B;
logic cin;
logic cout;
logic result;

OneBitFullAdder DUT (.A(A), .B(B), .cin(cin), .cout(cout), .result(result));
initial begin
A = 1; B = 1; cin = 0;
#10;
cin = 1;
#10;
A = 0; B = 0;
#10
A = 1;
#10;
A = 0; B = 1;
#10;
end

endmodule