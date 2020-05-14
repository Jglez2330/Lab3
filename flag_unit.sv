// Módulo "Top Level" de la lógica de las banderas

module flag_unit #(parameter N = 2)
						(input logic[N-1:0] y,
						input logic so2,so1,yn1,an1,bn1,
						output logic z,v);
					
					
			flagZero_logic FZL(.y(y), .z(z));
			flagZero_logic_TestBench FZLTB();
			flagV_logic FVL(.so2(so2), .so1(so1), .yn1(yn1), .an1(an1), .bn1(bn1), .V(v));
					
					
					
endmodule
