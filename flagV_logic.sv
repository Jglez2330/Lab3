//Módulo encargado de la lógica de la bandera V por ESTRUCTURA

module flagV_logic (input logic so2,so1,yn1,an1,bn1, output logic V);	

			
		logic H,J,K;
		
		nor_2 NOR2(.so2(so2), .so1(so1), .H(H));
		xor_2 XOR2(.yn1(yn1), .an1(an1), .J(J));
		xnor_2 XNOR2(.an1(an1), .bn1(bn1), .K(K));
		and_3 AND3(.H(H), .J(J), .K(K), .V(V));
		
		
		
endmodule



		