`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2024 07:14:32 PM
// Design Name: 
// Module Name: top
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


module top(input clk, reset, output reg [7:0] W_data);
wire [2:0]count;////////3 bits
wire [25:0]c;
wire [7:0] A_data, B_data;////////8
//reg [7:0]W_data;////////8
wire [7:0] ALUresult;////////8
wire z_flag;
//reg [7:0] c [15:0]
ALU alu(.A(A_data), .B(B_data), .Result(ALUresult), .ALUSel(c[10:8]), .ZFlag(z_flag));
regFile rf(.clk(clk), .rst(reset), .A_data(A_data), .B_data(B_data), .W_data(W_data), .A_addr(c[25:22]), .B_addr(c[21:18]), .W_addr(c[17:14]), .wr(c[13]));
ROM rom(.addr({3'b000, count}), .data_out(c));
counterModN #(3,7) counter(.clk(clk), .reset(reset), .en(1), .count(count));

always @(*)
begin
    //c[12] = 1? (W_data = c[7:0]): (W_data = ALUresult);
    
    W_data =  c[12] ? c[7:0]: ALUresult;
end
endmodule
