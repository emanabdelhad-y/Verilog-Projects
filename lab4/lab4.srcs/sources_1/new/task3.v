`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 06:51:41 PM
// Design Name: 
// Module Name: task3
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



//module MUX2to1(input in0,in1, sel, output out);
//    assign out = (sel==0)? in0:in1;
//endmodule

module MUX4to1(input [0:3]in, [1:0]sel, output Fout);
    wire t1,t2;
    MUX2to1 m0(.in0(in[0]),.in1(in[1]), .sel(sel[0]), .out(t1));
    MUX2to1 m1(.in0(in[2]),.in1(in[3]), .sel(sel[0]), .out(t2));
    MUX2to1 m2(.in0(t1),.in1(t2), .sel(sel[1]), .out(Fout));
    
endmodule