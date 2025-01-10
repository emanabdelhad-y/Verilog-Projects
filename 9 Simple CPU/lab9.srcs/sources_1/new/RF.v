`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2024 06:56:03 PM
// Design Name: 
// Module Name: RF
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


module regFile (clk, rst, A_data, B_data, W_data, A_addr, B_addr, W_addr, wr);

input clk, rst;
output[7:0] A_data, B_data;
input[7:0] W_data;
input[3:0] A_addr, B_addr, W_addr;
input wr;
// declaring array of 16 8-bit registers - Register File
reg[7:0] RegFile[0:15];
// Reading registers
assign A_data = RegFile[A_addr];
assign B_data = RegFile[B_addr];
// Writing to a register

always @ (posedge clk) begin
    if(!rst)
        if(wr)
        RegFile[W_addr] <= W_data;
// writing W_data to register number W_addr
end
endmodule
