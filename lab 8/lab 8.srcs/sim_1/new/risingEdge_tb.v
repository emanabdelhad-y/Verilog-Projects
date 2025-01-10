`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 06:23:18 PM
// Design Name: 
// Module Name: risingEdge_tb
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


module risingEdge_tb();

    reg clk, rst, x;
    wire z;
    
    //risingEdge DUT(.clk(clk), .rst(rst), .x(x), .z(z));
    Mealy DUT(.clk(clk), .rst(rst), .x(x), .z(z));    
    
    reg [0:15] pattern = 16'b0100111101111100;
    integer i;
    initial begin
    clk = 1;
    forever #25 clk=~clk;
    end
    initial begin
    x=0; rst=1;
    #25
    rst=0;
    for ( i = 1; i <= 15; i = i + 1 ) begin
    #50 x = pattern[i];
    end
end
endmodule