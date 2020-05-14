module NBitsFullAdder_tb ();
logic [3 : 0] A;
logic [3 : 0] B;
logic cin;
logic cout;
logic [3 : 0] result;
NBitsFullAdder #(.NBits(4)) DUT (.A(A), .B(B), .cin(cin), .cout(cout), .result(result));

initial begin
A = 4'h8; B = 4'h2; cin = 1'b0;
#10;
cin = 1'b1;
#10;
A = 4'h6; B = 4'h7; cin = 1'b0;
#10;
cin = 1'b1;
#10;
end
endmodule 