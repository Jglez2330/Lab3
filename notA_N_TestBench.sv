// Test Bench del módulo notA_N 

module notA_N_TestBench();
	
	parameter N = 2;
	
	logic[N-1:0] a,y;
	
	notA_N DUT (.a(a), .y(y));
	
	initial begin
		
		//Se prueban todas las posibles combinaciones con 2 bits
		a = 00; #10;
		a = 01; #10; 
		a = 10; #10;
		a = 11; #10;

		
	end
	
endmodule