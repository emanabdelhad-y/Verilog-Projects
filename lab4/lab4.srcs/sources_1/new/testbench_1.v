`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 06:06:49 PM
// Design Name: 
// Module Name: testbench_1
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



module testbench_1 ();
reg A, B, C; // a reg for each input to the simple circuit
// DUT module instantiation
MUX2to1 m(.in0(A),.in1(B), .sel(C), .out(out));

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
