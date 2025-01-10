`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2024 11:31:54 PM
// Design Name: 
// Module Name: hadd
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


module hadd(x, y, s, c);
    input x, y;
    output s, c;

    and (c, x, y); // Carry
    xor (s, x, y); // Sum

endmodule
