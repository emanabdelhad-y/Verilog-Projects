`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2024 10:03:45 AM
// Design Name: 
// Module Name: q2testbench
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


module q2testbench();
    reg [2:0] num;
    wire [6:0] segments;
    Question2 uut (.num(num), .segments(segments));
     
initial begin
        
        integer i;
        for (i = 0; i < 8; i = i + 1) begin
            num = i; // Assign i to num
            #10; // Wait for 10 time units
        end

        // Test the default case (out of range)
        num = 3'b111; // Set to out-of-range value
        #10; // Wait for 10 time units
        
        // End simulation
        $finish;
        end
    endmodule
