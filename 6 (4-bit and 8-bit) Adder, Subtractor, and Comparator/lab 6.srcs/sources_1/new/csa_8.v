`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 06:53:19 PM
// Design Name: 
// Module Name: csa_8
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


module csa_8(input [7:0] a, input [7:0] b, input cin, output Cout, output [7:0]S );
    wire [3:0] cintemp;
    wire [3:0] coutUp;
    wire [3:0] coutDown;

    rca_4 rca1(.a(a[3:0]), .b(b[3:0]), .cin(cin),.S(S[3:0]), .Cout(cintemp[0]));
    rca_4 rca2(.a(a[7:4]), .b(b[7:4]), .cin(0),  .S(coutUp[3:0]), .Cout(cintemp[1]));
    rca_4 rca3(.a(a[7:4]), .b(b[7:4]), .cin(1),  .S(coutDown[3:0]), .Cout(cintemp[2]));
    MUX2to1 mux1(.in0(coutUp[0]) ,.in1(coutDown[0]), .sel(cintemp[0]), .out(S[4]));
    MUX2to1 mux2(.in0(coutUp[1]) ,.in1(coutDown[1]), .sel(cintemp[0]), .out(S[5]));
    MUX2to1 mux3(.in0(coutUp[2]) ,.in1(coutDown[2]), .sel(cintemp[0]), .out(S[6]));
    MUX2to1 mux4(.in0(coutUp[3]) ,.in1(coutDown[3]), .sel(cintemp[0]), .out(S[7]));
    MUX2to1 mux5(.in0(cintemp[1]) ,.in1(cintemp[2]), .sel(cintemp[0]), .out(Cout));


endmodule
