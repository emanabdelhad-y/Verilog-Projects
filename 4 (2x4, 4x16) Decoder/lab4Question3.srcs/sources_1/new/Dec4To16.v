`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2024 10:29:03 PM
// Design Name: 
// Module Name: Dec4To16
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


module Dec4To16(Y, d, e);
    output [15:0] Y;
    input [3:0] d;
    input e;

    wire t[0:3];
   Dec2To4 d0(.in(in[2:3]), .en(en), .Y(t[0:3]));
   Dec2To4 d1(.in(in[0:1]), .en(t[0]), .Y(Y[0:3]));
   Dec2To4 d2(.in(in[0:1]), .en(t[1]), .Y(Y[4:7]));
   Dec2To4 d3(.in(in[0:1]), .en(t[2]), .Y(Y[8:11]));
   Dec2To4 d4(.in(in[0:1]), .en(t[3]), .Y(Y[12:15])); 

endmodule
