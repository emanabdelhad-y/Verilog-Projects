`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 05:10:39 PM
// Design Name: 
// Module Name: task2
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


module rca_4(input [3:0] a, input [3:0] b,input cin, output Cout, output [3:0]S );
    wire [3:0] cintemp;
    full_adder_1 fa1( .a(a[0]), .b(b[0]), .cin(cin),  .sum(S[0]), .cout(cintemp[1]));
    full_adder_1 fa2( .a(a[1]), .b(b[1]), .cin(cintemp[1]),  .sum(S[1]), .cout(cintemp[2]));
    full_adder_1 fa3( .a(a[2]), .b(b[2]), .cin(cintemp[2]),  .sum(S[2]), .cout(cintemp[3]));
    full_adder_1 fa4( .a(a[3]), .b(b[3]), .cin(cintemp[3]),  .sum(S[3]), .cout(Cout));


endmodule
