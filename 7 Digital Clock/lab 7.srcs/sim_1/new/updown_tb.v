`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2024 12:29:44 AM
// Design Name: 
// Module Name: updown_tb
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


module updown_tb();
    // Parameters for the upDown module
    parameter x = 5;
    parameter n = 20;
    
    // Inputs to the DUT (Device Under Test)
    reg clk;
    reg reset;
    reg UpDown;
    reg [2:0] step_in;
    wire [x-1:0] count;

    upDown #(.x(x),.n(n)) up_Down(.clk(clk), .reset(reset), .updown(UpDown), .step(step_in), .count(count));
    
    initial begin
        clk = 0;
        forever #10 clk=~clk;
    end
    integer i ;
    initial begin       
        for (i=0; i < 32; i = i+1)
        begin
            {reset, UpDown, step_in} = i;
            #20;
        end
    end

endmodule



