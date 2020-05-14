//Módulo NOR de 2 bits

module nor_2 (input logic so2,so1, output logic H);

			
		assign H = ~(so2 | so1);
		
		
endmodule
		