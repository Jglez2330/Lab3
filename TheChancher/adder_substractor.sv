module adder_substractor #(parameter bus = 4)(
   input [bus-1:0] a, b,
   input add_sub,

   output [bus-1:0] result,
   output logic carry_out, overflow, zero
   );

wire [bus:0] carry;
assign carry[0] = add_sub;
wire [bus-1:0] B;
assign zero = (overflow + result) == {bus{1'b0}};

xor(carry_out, carry[bus], add_sub); 
xor(overflow, carry[bus], carry[bus-1]);

genvar i;
generate
   for (i=0; i<bus; i=i+1) begin:forloop
      xor(B[i], b[i], add_sub);
      // full_adder full_adder_(result[i], carry[i+1], a[i], B[i], carry[i]);
      adder_1bit adder_1bit_(a[i], B[i], carry[i], result[i], carry[i+1]);
   end
endgenerate

endmodule  
