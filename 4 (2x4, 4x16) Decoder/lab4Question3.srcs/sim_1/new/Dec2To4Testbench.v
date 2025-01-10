`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2024 10:34:46 PM
// Design Name: 
// Module Name: Dec2To4Testbench
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


module Dec2To4Testbench ();
reg A, B, C; // a reg for each input to the simple circuit
wire [0:3]Y;
// DUT module instantiation
Dec2to4 d(.Y(Y), .en(C), .in(A),.in(B));

// Stimuli Generator
    initial begin // Initial block executes only once at start of simulation
    A = 1'b0; B = 1'b1; C = 1'b0;
    #100 // delay of 100 nanoseconds
    A = 1'b0; B = 1'b1; C = 1'b1;
    #100 // delay of 100 nanoseconds
    A = 1'b1; B = 1'b0; C = 1'b0;
    #100 // delay of 100 nanoseconds
    A = 1'b1; B = 1'b0; C = 1'b1;
    
    end
endmodule
