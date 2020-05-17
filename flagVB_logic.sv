//Módulo encargado de la lógica de la bandera V por COMPORTAMIENTO	

module flagVB_logic (input logic so3,so2,so1,yn1,an1,bn1, output logic V);//B:Behavioral
			
			
			logic H,J,K;
			
			assign H = ~(so3 | so2 | so1);
			assign J = yn1 ^ an1;
			assign K = ~(an1 ^ bn1);
			assign V = H & J & K;
			
			
endmodule

