`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2024 07:51:49 PM
// Design Name: 
// Module Name: top_testbench
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


module top_testbench();
reg clk, reset; wire [7:0] W_data;

// Instantiate the top module
top uut (
    .clk(clk),
    .reset(reset),
    .W_data(W_data)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
reset=1;
#10
reset=0;
end

endmodule
