`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2024 06:02:47 PM
// Design Name: 
// Module Name: series_TB
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


module series_TB();

parameter n = 8;
reg [n-1 : 0] num;
wire [(2*n)-1 : 0]result;
 
series #(n) uut(.num(num), .result(result));

initial begin

#0
//first case
num = 10;
#10
//second case
num = 12;
#10
//third case
num =15;
#10
//fourth case
num =50;
#10
//fifth case
num =150;

end

endmodule
