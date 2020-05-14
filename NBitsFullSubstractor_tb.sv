module NBitsFullSubstractor_tb ();
logic [7 : 0] A;
logic [7 : 0] B;
logic cout;
logic [7 : 0] result;
NBitsFullSubstractor #(.NBits(8)) DUT (.A(A), .B(B), .cout(cout), .result(result));

initial begin
A = 8'h8; B = 8'h2;
#10;
A = 8'h6; B = 8'h7;
#10;
end
endmodule 