module ALU_tb;   
	// ---------------------------------------------------------------------------------------------------- ALU
	localparam period = 10;
	parameter bus = 3;
	integer i, j;

	logic [bus-1:0] a;
	logic [bus-1:0] b;
	logic [3:0] selection;

	logic [bus-1:0] result;
	logic carry_out, overflow, zero;

	ALU #(bus) UUT (.a(a), .b(b), .selection(selection), .result(result), .carry_out(carry_out), .overflow(overflow), .zero(zero));

	initial begin
		$monitor($time, "test: %d + %d = (carry_out:%b)(v:%b)(z:%b)%d", a, b, carry_out, overflow, zero, result);
		// $monitor($time, "test: %b + %b = (carry_out:%b)(v:%b)%b", a, b, carry_out, overflow, result);

		a = 4'b0;
		b = 4'b0;
		selection = 4'b0000;

		// selection = 4'd0; // add
		// for (i=0; i<(2**bus); i++) begin
		// 	a = i;
		// 	for (j=0; j<(2**bus); j++) begin
		// 		b = j; #period;
		// 	end 
		// end

		// selection = 4'd1; // substract
		// for (i=0; i<(2**bus); i++) begin
		// 	a = i;
		// 	for (j=0; j<(2**bus); j++) begin
		// 		b = j; #period;
		// 	end 
		// end

		// selection = 4'd2; // xor
		// for (i=0; i<(2**bus); i++) begin
		// 	a = i;
		// 	for (j=0; j<(2**bus); j++) begin
		// 		b = j; #period;
		// 	end 
		// end

		// selection = 4'd3; // and
		// for (i=0; i<(2**bus); i++) begin
		// 	a = i;
		// 	for (j=0; j<(2**bus); j++) begin
		// 		b = j; #period;
		// 	end 
		// end

		// selection = 4'd4; // or
		// for (i=0; i<(2**bus); i++) begin
		// 	a = i;
		// 	for (j=0; j<(2**bus); j++) begin
		// 		b = j; #period;
		// 	end 
		// end

		// selection = 4'd5; // nor
		// for (i=0; i<(2**bus); i++) begin
		// 	a = i;
		// 	for (j=0; j<(2**bus); j++) begin
		// 		b = j; #period;
		// 	end 
		// end

		// selection = 4'd6; // not
		// for (i=0; i<(2**bus); i++) begin
		// 	a = i; #period;
		// end

		// selection = 4'd7; // shift_left
		// a = 3'b001;
		// for (j=0; j<=bus; j++) begin
		// 	b = j; #period;
		// end 

		// selection = 4'd8; // shift_right
		// a = 3'b100;
		// for (j=0; j<=bus; j++) begin
		// 	b = j; #period;
		// end 

		selection = 4'd9; // shift_right_arithmetic
		a = 3'b100;
		for (j=0; j<=bus; j++) begin
			b = j; #period;
		end 

	end  

endmodule 