/* 
Módulo encargado de la lógica de la bandera Z.
La lógica del módulo consiste en utilizar una compuerta NOR parametrizable. 
Con N bits de entrada (Bus del resultado del ALU) y un bit de salida
*/

module flagZero_logic #(parameter N = 8)
								(input logic[N-1:0] y, output logic z);
								
		
		
		assign z = ~|y;
	

endmodule	
								
		
		