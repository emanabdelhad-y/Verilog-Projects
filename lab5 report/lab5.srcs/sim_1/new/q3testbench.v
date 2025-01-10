`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2024 10:03:29 AM
// Design Name: 
// Module Name: q3testbench
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


module q3testbench();

initial begin
        // Monitor outputs
        $monitor("Time: %0dns | sel: %b | anode_active: %b | display0: %b | display1: %b | display2: %b | display3: %b",
                 $time, sel, anode_active, display0, display1, display2, display3);

        // Test case 1: sel = 00
        sel = 2'b00;
        #10; // Wait for 10 ns

        // Test case 2: sel = 01
        sel = 2'b01;
        #10; // Wait for 10 ns

        // Test case 3: sel = 10
        sel = 2'b10;
        #10; // Wait for 10 ns

        // Test case 4: sel = 11
        sel = 2'b11;
        #10; // Wait for 10 ns

        // Test case 5: sel = default (invalid case)
        sel = 2'bxx; // Just a random case to see how the design behaves
        #10; // Wait for 10 ns

        // End of simulation
        $finish;
    end
endmodule