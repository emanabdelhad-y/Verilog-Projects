`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 05:04:30 PM
// Design Name: 
// Module Name: FullAdder
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


module full_adder_1(input a, b, cin, output sum, cout);
    //assign sum = ~a&~b&cin | ~a&b&~cin | a&b&cin | a&~b&~cin;
    assign sum = a ^b^cin;
    assign cout = a&b | a&cin | b& cin;
    
endmodule
