//TODO:Cambiar entradas por las estandar A, B, ...
module MUX_N #(parameter NBITS = 4)(input logic [3:0] selection, 
												input logic [NBITS- 1:0] A, 
												input logic [NBITS- 1:0] B, input logic[NBITS- 1:0] C,
												input logic [NBITS- 1:0] D, input logic [NBITS- 1:0] E,
												input logic [NBITS- 1:0] F, input logic [NBITS- 1:0] G,
												input logic [NBITS- 1:0] H, input logic [NBITS- 1:0] I,
												input logic [NBITS- 1:0] J, input logic [NBITS- 1:0] K,
												input logic [NBITS- 1:0] L, input logic [NBITS- 1:0] M,
												input logic [NBITS- 1:0] N, input logic [NBITS- 1:0] O,
												input logic [NBITS- 1:0] P,
												output logic [NBITS - 1: 0] nOUT);
	always_comb begin
			case (selection)
				4'h0: nOUT = A;
				4'h1: nOUT = B;
				4'h2: nOUT = C;
				4'h3: nOUT = D;
				4'h4: nOUT = E;
				4'h5: nOUT = F;
				4'h6: nOUT = G;
				4'h7: nOUT = H;
				4'h8: nOUT = I;
				4'h9: nOUT = J;
				4'ha: nOUT = K;
				4'hb: nOUT = L;
				4'hc: nOUT = M;
				4'hd: nOUT = N;
				4'he: nOUT = O;
				4'hf: nOUT = P;
			endcase
		end
endmodule 