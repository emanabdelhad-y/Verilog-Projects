`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2024 12:18:04 AM
// Design Name: 
// Module Name: upDown
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


module upDown# (parameter x = 5, n = 20)
(input clk, reset, updown, input [2:0]step, output reg [x-1:0] count);
 initial begin
    count = 0; 
 end

always @(posedge clk, posedge reset) begin
    if (reset == 1)
        count <= 0; // non-blocking assignment
    // initialize flip flop here
    else begin
        if (updown == 0)begin
            if(count == n-1)
                count <= 0; // non-blocking assignment
            else
                count <= count + step; // non-blocking assignment
        end else if (updown == 1)            
            if(count <= 0)
                count <= n; // non-blocking assignment
            else
                count <= count - step; // non-blocking assignment
    end
end
endmodule
