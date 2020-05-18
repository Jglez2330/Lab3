module not_ #(parameter bus = 4)(
	input logic [bus-1:0] a,

	output logic [bus-1:0] y);

	assign y = ~a;
	
endmodule 
