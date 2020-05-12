//Módulo OR de N bits

module or_N #(parameter N = 2)
				(input logic[N-1:0] a,b, output logic[N-1:0] y);
				
			
		assign y = a | b;
		
		
endmodule


