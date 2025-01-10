`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 05:38:15 PM
// Design Name: 
// Module Name: Question2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Question2(
input [2:0] num,
output reg [6:0] segments
);
    always @ (*) begin

    case(num)
        0: segments = 7'b0000001; //O 
        1: segments = 7'b0011000; //P
        2: segments = 7'b0110000; //E
        3: segments = 7'b0001001; //N
        4: segments = 7'b0110001; //C
        5: segments = 7'b1110001; //L
        6: segments = 7'b0100100; //S
        7: segments = 7'b0111000; //F
        
        default: segments= 7'b1111111;
        
    endcase
    
    end
endmodule
