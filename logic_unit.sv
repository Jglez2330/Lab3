//Módulo "Top Level" de las operaciones lógicas

module logic_unit #(parameter N = 2)
						(input logic[N-1:0] a,b, output logic[N-1:0] y);
						
			
			and_N AND(.a(a), .b(b), .y(y));// Se instancia el módulo and_N
			and_N_TestBench ANDTB(); // Se instancia el test bench del and_N
						
						
endmodule