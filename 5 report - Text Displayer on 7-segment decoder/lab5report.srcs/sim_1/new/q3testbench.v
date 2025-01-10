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

module tb_question3;

    // Inputs
    reg [1:0] sel;

    // Outputs
    wire [6:0] display0;
    wire [6:0] display1;
    wire [6:0] display2;
    wire [6:0] display3;
    wire [3:0] anode_active;

    // Instantiate the Unit Under Test (UUT)
    question3 uut (
        .sel(sel),
        .display0(display0),
        .display1(display1),
        .display2(display2),
        .display3(display3),
        .anode_active(anode_active)
    );
    
    initial begin
        sel = 2'b00;
        #10; // Wait for 10 ns

        sel = 2'b01;
        #10; // Wait for 10 ns

        sel = 2'b10;
        #10; // Wait for 10 ns

        sel = 2'b11;
        #10; // Wait for 10 ns

        $finish;
    end


endmodule
