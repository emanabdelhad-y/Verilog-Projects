`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 06:10:39 PM
// Design Name: 
// Module Name: pushbuttonDetector
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


module pushbuttonDetector(input clk, rst, x, output z);

wire w1, w2;
wire clk_out;

//clockDivider  #(1000000) cd(.clk(clk), .rst(rst), .clk_out(clk_out));

debouncer de( .clk(clk), .rst(rst), .in(x),  .out(w1));
synchronizerCircuit sync (w1, w2, clk);
risingEdge edgeDetector ( .clk(clk), .rst(rst), .x(w2), .z(z));

endmodule
