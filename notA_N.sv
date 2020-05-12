//Módulo NOT de N bits para el operando A

module notA_N #(parameter N = 2)
					(input logic[N-1:0] a, output logic[N-1:0] y);
					
					
		assign y = ~ a;
		

endmodule

