`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 05:24:25 PM
// Design Name: 
// Module Name: BCDtoSevenSegDec
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


module BCDtoSevenSegDec( input [3:0]num, output [6:0] segments);

//a -> 0, g=6

//g
assign segments[6] = ~(num[3]|(num[2]&(~num[1]))|((~num[2])&num[1])|(num[1]&(~num[0])));
//f
assign segments[5] = ~(num[3]|((~num[1])&(~num[0]))|(num[2]&(~num[1]))|(num[2]&(~num[0])));
//e
assign segments[4] = ~(((num[1])&(~num[0]))|((~num[2])&(~num[0])));
//d
assign segments[3] = ~(num[3]|((~num[0])&(~num[2]))|((num[1])&(~num[0]))|((~num[3])&(~num[2])&num[1])|((~num[1])&(num[2])&num[0]));
//c
assign segments[2] = ~((~num[1])|(num[0])|(num[2]));
//b
assign segments[1] = ~((~num[2])|((~num[1])&(~num[0]))|((num[1])&(num[0])));
//a
assign segments[0] =  ~(num[3]|num[1]|((num[2])&num[0])|((~num[0])&(~num[2])));



endmodule
