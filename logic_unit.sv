//Módulo "Top Level" de las operaciones lógicas

module logic_unit #(parameter N = 2)
						(input logic[N-1:0] a,b, output logic[N-1:0] y);
						
			
			and_N AND(.a(a), .b(b), .y(y));
			
			and_N_TestBench ANDTB();
			
			//or_N OR(.a(a), .b(b), .y(y));
			
			//or_N_TestBench ORTB();
			
						
			//xor_N XOR(.a(a), .b(b), .y(y));
			
			//xor_N_TestBench XORTB();
			
			//notA_N  NOT(.a(a), .y(y));
			
			//notA_N_TestBench NOTTB();
						
						
endmodule