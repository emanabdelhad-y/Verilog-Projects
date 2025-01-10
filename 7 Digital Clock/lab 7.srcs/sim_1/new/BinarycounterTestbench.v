`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 05:33:06 PM
// Design Name: 
// Module Name: BinarycounterTestbench
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


module counterModN_testbench();
    reg clk, reset, en;
    wire [4:0] count;
    counterModN #(5,20) DUT (clk, reset, en, count);
    
    initial begin
    clk = 0;
    forever #10 clk=~clk;
    end
    
    initial begin
    en = 1;
    reset=1;
    #100
    reset=0;
    #100
    en=0;
    #100
    en = 1;
    end
    
endmodule

