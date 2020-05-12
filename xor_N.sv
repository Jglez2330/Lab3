//Módulo XOR de N bits

module xor_N #(parameter N = 2)
				(input logic[N-1:0] a,b, output logic[N-1:0] y);
				
				
	assign y = a ^ b;
	
	
endmodule

