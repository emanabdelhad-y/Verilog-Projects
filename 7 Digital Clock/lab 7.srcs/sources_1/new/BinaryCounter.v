`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 05:28:38 PM
// Design Name: 
// Module Name: BinaryCounter
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


module counterModN #(parameter x = 5, n = 20)
(input clk, reset, input en, output reg [x-1:0] count);

always @(posedge clk, posedge reset) begin
    if (reset == 1)
        count <= 0; // non-blocking assignment
    // initialize flip flop here
    else begin
        if (en == 1)begin
            if(count == n-1)
                count <= 0; // non-blocking assignment
            else
                count <= count + 1; // non-blocking assignment
        end else
            count <= count;
    end
end

endmodule