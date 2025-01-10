`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2024 09:57:14 PM
// Design Name: 
// Module Name: testbench4To16Dec
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


module testbench4To16Dec();
    
  reg [0:3] A;       // 4-bit input vector
  reg E=1;             // Enable signal
  wire [0:15] Y;      // 16-bit output vector
// DUT module instantiation
Dec4to16 d(.in(A[0:3]), .en(E), .Y(Y[0:15]));

// Stimuli Generator
initial begin // Initial block executes only once at start of simulation
A[0] = 1'b0; A[1] = 1'b0; A[2] = 1'b0; A[3] = 1'b0; 
#100 // delay of 100 nanoseconds
A[0] = 1'b0; A[1] = 1'b0; A[2] = 1'b0; A[3] = 1'b1;
#100 // delay of 100 nanoseconds
A[0] = 1'b0; A[1] = 1'b0; A[2] = 1'b1; A[3] = 1'b0; 
#100 // delay of 100 nanoseconds
A[0] = 1'b0; A[1] = 1'b0; A[2] = 1'b1; A[3] = 1'b1;

end
endmodule
