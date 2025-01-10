`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2024 10:33:05 AM
// Design Name: 
// Module Name: addsub_4
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


module addsub_4(
        output Cout,      
        output [3:0] s,    
        input cin,         // cin = 0 -> add, cin = 1 -> subtract
        input [3:0]  a,     
        input [3:0] b     
    );
    
    wire [4:0] sum;
    wire [3:0] b_mod; 

   
    assign b_mod = cin ? ~b : b; 

    // Perform addition
    assign sum = a + b_mod + cin; 

    assign s = sum[3:0]; 
    assign Cout = sum[4];

endmodule