module ALU #(parameter bus = 4)(
	input [bus-1:0] a, b,
	input [3:0] selection,
	
	output logic [bus-1:0] result,
	output logic carry_out, overflow, zero
	);

// arithmetic
wire [bus-1:0] result_add_sub;
adder_substractor #(bus) adder_substractor_ (.a(a), .b(b), .add_sub(selection[0]), .result(result_add_sub), .carry_out(carry_out), .overflow(overflow), .zero(zero));

// logic
wire [bus-1:0] result_xor;
xor_ #(bus) xor__ (.a(a), .b(b), .y(result_xor));

wire [bus-1:0] result_and;
and_ #(bus) and__ (.a(a), .b(b), .y(result_and));

wire [bus-1:0] result_or;
or_ #(bus) or__ (.a(a), .b(b), .y(result_or));

wire [bus-1:0] result_nor;
nor_ #(bus) nor__ (.a(a), .b(b), .y(result_nor));

wire [bus-1:0] result_not;
not_ #(bus) not__ (.a(a), .y(result_not));

// fix
wire [bus-1:0] result_shift_left;
shift_left #(bus) shift_left_ (.a(a), .b(b), .y(result_shift_left));

wire [bus-1:0] result_shift_right;
shift_right #(bus) shift_right_ (.a(a), .b(b), .y(result_shift_right));

wire [bus-1:0] result_shift_right_arithmetic;
shift_right_arithmetic #(bus) shift_right_arithmetic_ (.a(a), .b(b), .y(result_shift_right_arithmetic));

// MUX
mux_16 #(bus) mux_16_ (
	// ALU
	.d0(result_add_sub), 
	.d1(result_add_sub),
	// logic
	.d2(result_xor),
	.d3(result_and),
	.d4(result_or),
	.d5(result_nor),
	.d6(result_not),
	// fix
	.d7(result_shift_left),
	.d8(result_shift_right),
	.d9(result_shift_right_arithmetic), 
	// unused
	.d10(result_shift_left), 
	.d11(result_shift_left), 
	.d12(result_shift_left), 
	.d13(result_shift_left), 
	.d14(result_shift_left), 
	.d15(result_shift_left), 

	.selector(selection), 
	.y(result));

endmodule  