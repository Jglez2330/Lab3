// Test Bench del módulo Flag V logic


module flagV_logic_TestBench();

	
		logic so3,so2,so1,yn1,an1,bn1;
		logic V;
		
		//flagV_logic DUT(.so2(so2), .so1(so1), .yn1(yn1), .an1(an1), .bn1(bn1), .V(V));
		flagVB_logic DUT(.so3(so3), .so2(so2), .so1(so1), .yn1(yn1), .an1(an1), .bn1(bn1), .V(V));
		
		initial begin
			
			so3 = 1; so2 = 1; so1 = 1;  yn1 = 1; an1 = 1; bn1 = 1; #10;
			so3 = 0; so2 = 0; so1 = 0; #10;
			so1 = 1; #10;
			so1 = 0; yn1 = 0; an1 = 0; #10;
			yn1 = 1; #10;
			yn1 = 0; an1 = 1; #10;
			
		end
		
		
endmodule

