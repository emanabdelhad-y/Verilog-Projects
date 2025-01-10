`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 06:22:32 PM
// Design Name: 
// Module Name: risingEdge
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


module risingEdge(input clk, rst, x, output z);

    reg [1:0] state, nextState;
    parameter [1:0] A = 2'b00, B = 2'b01,C = 2'b10; 
       
    always @(*) begin
    case(state)
    A: if ( x == 0) nextState = A; else nextState = B;
    B: if ( x == 0) nextState = A; else nextState = C;
    C: if ( x == 0) nextState = A; else nextState = C;
    
    //default: 
    endcase   
    end
    
    always @(posedge clk) begin
    if (rst) state <= 0;
    else state <= nextState;
    end
    
    assign z = (state == B);
endmodule
