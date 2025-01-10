`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2024 03:33:37 PM
// Design Name: 
// Module Name: Mealy
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


module Mealy(input clk, rst, x, output z);

    reg [1:0] state, nextState;
    parameter [1:0] A = 2'b00, B = 2'b01, C = 2'b10;

    always @(*) begin
        case(state)
            A: if (x == 0) nextState = A; else nextState = B;
            B: if (x == 0) nextState = A; else nextState = C;
            C: if (x == 0) nextState = A; else nextState = C;
            default: nextState = A;
        endcase
    end

    always @(posedge clk or posedge rst) begin
        if (rst) state <= A;
        else state <= nextState;
    end

    assign z = (state == B && x == 1);

endmodule

