module MUX_N_tb();
	logic [3:0] a;
	logic [3:0] b;
	logic [3:0] c;
	logic [3:0] d;
	logic [3:0] e;
	logic [3:0] f;
	logic [3:0] g;
	logic [3:0] h;
	logic [3:0] i;
	logic [3:0] j;
	logic [3:0] k;
	logic [3:0] l;
	logic [3:0] m;
	logic [3:0] n;
	logic [3:0] o;
	logic [3:0] p;
	logic	[3:0]out;
	logic [3:0] selection;
	MUX_N #(.NBITS(4)) DUT  (.A(a), .B(b), .C(c),
										.D(d), .E(e), .F(f),
										.G(g), .H(h), .I(i),
										.J(j), .K(k), .L(l),
										.M(m), .N(n), .O(o),
										.P(p),.nOUT(out), .selection(selection));
	
	initial begin
		a = 4'h1;
		selection = 4'h0;
		#10;
		b = 4'h3;
		selection = 4'h1;
		#10;
	end
endmodule 