// Test Bench del módulo or_N 

module or_N_TestBench();
	
	parameter N = 2;
	
	logic[N-1:0] a,b,y;
	
	or_N DUT (.a(a), .b(b), .y(y));
	
	initial begin
		
		a = 00; b = 00; #10;//Se prueban los dos operandos con todos los bits en 0
		a = 01; b = 00; #10;//Se prueba un operando mixto y el otro en 0 
		a = 10; b = 11; #10;//Se prueba un operando mixto y el otro en 1
		a = 10; b = 01; #10;//Se prueban ambos operandos mixtos
		a = 11; b = 11; #10;//Se prueban los dos operandos con todos los bits en 1
		
	end
	
endmodule
