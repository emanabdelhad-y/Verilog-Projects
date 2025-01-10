`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 11:15:45 PM
// Design Name: 
// Module Name: digital_TB
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


module digital_TB();
reg clk,rst;
reg [3:0] x; 
wire [6:0] segments; 
DigitalLock DDLK (clk, rst, x, segments);
 initial begin
    clk = 1;
    forever #110 clk=~clk;
 end

    initial begin
    rst=1;
    #10
    rst=0;
    #100
    x={1'b1,1'b0,1'b0,1'b0};
    #100
     x={1'b0,1'b0,1'b0,1'b0};

    #100
    x={1'b0,1'b0,1'b1,1'b0};
    #100
        x={1'b0,1'b0,1'b0,1'b0};
    #100
    x={1'b0,1'b0,1'b0,1'b1};
    #100
        x={1'b0,1'b0,1'b0,1'b0};
    
    #100
    x={1'b0,1'b1,1'b0,1'b0};    
    #100
        x={1'b0,1'b0,1'b0,1'b0};
        
    end

endmodule
