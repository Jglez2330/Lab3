// Módulo "Top Level" de la lógica de las banderas

module flag_unit #(parameter N = 2)
						(input logic[N-1:0] y,
						input logic so3,so2,so1,yn1,an1,bn1,
						output logic z,v);
					
					
			flagZero_logic FZL(.y(y), .z(z));
			flagZero_logic_TestBench FZLTB();
			flagVB_logic FVBL(.so3(so3), .so2(so2), .so1(so1), .yn1(yn1), .an1(an1), .bn1(bn1), .V(v));
			flagV_logic_TestBench FVLTB();
					
					
					
endmodule
