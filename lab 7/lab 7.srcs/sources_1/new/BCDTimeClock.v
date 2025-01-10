`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2024 09:03:55 PM
// Design Name: 
// Module Name: BCDTimeClock
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


module BCDTimeClock(input clk, reset,output [6:0] seg,output [3:0] an );

wire [3:0] secUnits, minUnits;
wire [2:0] secTens, minTens;
reg [3:0] num;   
reg [1:0] select; 

LedClock clock(clk,reset,{minTens,minUnits,secTens,secUnits});
sevenSegUsingBehavioral bcd(.clk(clk), .reset(reset), .sel(select),.num(num),.segments(seg),.anode_active(an));

   
    always @(an, reset)begin
    
        if (reset)
             num <=0;
        else 
    
            case(an) 
                4'b1110: num <= secUnits;
                4'b1101: num <= secTens;
                4'b1011: num <= minUnits;
                4'b0111: num <= minTens;

                default: num <=0; 
            endcase
            
            
    end
    
endmodule
