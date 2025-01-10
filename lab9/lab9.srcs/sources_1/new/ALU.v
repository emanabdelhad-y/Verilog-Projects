`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2024 06:56:03 PM
// Design Name: 
// Module Name: ALU
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

module ALU (A, B, Result, ALUSel, ZFlag);

input [7:0] A, B;
input [2:0] ALUSel;
output reg [7:0] Result;
output ZFlag;
assign ZFlag = (Result==8'b0);

always @ (*) begin
case (ALUSel)
    3'b000: Result = A + B; // addition
    3'b001: Result = A - B; // subtraction
    3'b010: Result = A - B; // subtraction
    3'b011: Result = A - B; // subtraction
    3'b100: Result = A | B; // bitwise OR
    3'b101: Result = ~A; // bitwise NOT
    3'b110: Result = A & B; // bitwise AND
    3'b111: Result = A ^ B; // bitwise XOR
endcase
end
endmodule