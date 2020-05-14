//Test Bench del módulo flagZero_logic

module flagZero_logic_TestBench();
			
		
		parameter N = 2;
		
		logic[N-1:0] y;
		logic z;
		
		flagZero_logic DUT(.y(y), .z(z));
		
		initial begin
		
			y = 00; #10;
			y = 01; #10;
			y = 10; #10;
			y = 11; #10;
				
		end
		
		
endmodule
