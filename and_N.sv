//Módulo AND de N bits 

module and_N #(parameter N = 2) 
				(input logic[N-1:0] a,b, output logic[N-1:0] y);
				
				
	assign y = a & b;
	
	
endmodule


