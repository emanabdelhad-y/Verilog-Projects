`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2024 09:38:10 PM
// Design Name: 
// Module Name: 4-bit comparator
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


module comparator4bit( input [3:0] a, input [3:0] b, output reg [6:0] segments);
 wire [3:0] s ;
 wire cout;

    addsub_4 subb( .Cout(cout), .s(s[3:0]), .cin(1), .a(a[3:0]), .b(b[3:0]));

    
    always @ (*) begin
    if (!s)
    segments = 7'b0000001;
    else if(cout == 0)
    segments = 7'b1001111;
    else if(cout == 1)
    segments = 7'b0010010;
    
    end
endmodule
