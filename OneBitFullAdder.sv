module OneBitFullAdder(input logic cin, input logic A,
								input logic B, output logic cout,
								output logic result);
 assign result = cin ^ (A ^ B);
 assign cout = ((A || B) && cin) || (A && B);				
endmodule 