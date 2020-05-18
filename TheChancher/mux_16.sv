module mux_16 #(parameter bus = 4)(
    input [bus-1:0] d0,
    input [bus-1:0] d1,
    input [bus-1:0] d2,
    input [bus-1:0] d3,
    input [bus-1:0] d4,
    input [bus-1:0] d5,
    input [bus-1:0] d6,
    input [bus-1:0] d7,
    input [bus-1:0] d8,
    input [bus-1:0] d9,
    input [bus-1:0] d10,
    input [bus-1:0] d11,
    input [bus-1:0] d12,
    input [bus-1:0] d13,
    input [bus-1:0] d14,
    input [bus-1:0] d15,
    input [3:0] selector,

    output reg [bus-1:0] y
    );

always @(*)
begin
    case (selector)
        4'b0000: y = d0;
        4'b0001: y = d1;
        4'b0010: y = d2;
        4'b0011: y = d3;
        4'b0100: y = d4;
        4'b0101: y = d5;
        4'b0110: y = d6;
        4'b0111: y = d7;
        4'b1000: y = d8;
        4'b1001: y = d9;
        4'b1010: y = d10;
        4'b1011: y = d11;
        4'b1100: y = d12;
        4'b1101: y = d13;
        4'b1110: y = d14;
        4'b1111: y = d15;
        // default :  // default ;
    endcase
end
endmodule
