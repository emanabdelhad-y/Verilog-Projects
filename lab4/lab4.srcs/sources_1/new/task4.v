`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 07:15:44 PM
// Design Name: 
// Module Name: task4
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


module Dec2to4(input [0:1] in, input en, output [0:3]Y);
    assign Y[0]= (en ==1 & in[0]==0 & in[1]==0)? 1:0;
    assign Y[1]= (en ==1 & in[0]==0 & in[1]==1)? 1:0;
    assign Y[2]= (en ==1 & in[0]==1 & in[1]==0)? 1:0;
    assign Y[3]= (en ==1 & in[0]==1 & in[1]==1)? 1:0;    

endmodule
