`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 05:10:39 PM
// Design Name: 
// Module Name: task2
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


module rca_8(
    input [7:0] a,
    input [7:0] b,
    input cin,
    output Cout,
    output [7:0] S
);
    wire [7:0] cintemp;

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : fa_gen
            if (i == 0) begin
                full_adder_1 fa (.a(a[i]), .b(b[i]),.cin(cin),.sum(S[i]),.cout(cintemp[i + 1]) );
            end else if (i < 7) begin
                full_adder_1 fa (.a(a[i]),.b(b[i]),.cin(cintemp[i]),.sum(S[i]),.cout(cintemp[i + 1]));
            end else begin
                full_adder_1 fa (.a(a[i]), .b(b[i]),.cin(cintemp[i]),.sum(S[i]), .cout(Cout)
                );
            end
        end
    endgenerate

endmodule
