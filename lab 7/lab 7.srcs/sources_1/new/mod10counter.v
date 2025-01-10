`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 06:43:36 PM
// Design Name: 
// Module Name: mod10counter
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


module mod10counter (input clk, rst, input en, output [3:0]count);
wire clk_out;

//clockDivider #(50000000) cd( .clk(clk), .rst(rst), .clk_out(clk_out));
counterModN #(4,10) counter(.clk(clk), .reset(rst),  .en(en),  .count(count));


    
endmodule
