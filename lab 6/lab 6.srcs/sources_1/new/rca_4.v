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


module rca_4(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output Cout,
    output [3:0] S
);
    wire [3:0] cintemp;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : fa_gen
            if (i == 0) begin
                full_adder_1 fa (.a(a[i]), .b(b[i]),.cin(cin),.sum(S[i]),.cout(cintemp[i + 1]) );
            end else if (i < 4) begin
                full_adder_1 fa (.a(a[i]),.b(b[i]),.cin(cintemp[i]),.sum(S[i]),.cout(cintemp[i + 1]));
            end else begin
                full_adder_1 fa (.a(a[i]), .b(b[i]),.cin(cintemp[i]),.sum(S[i]), .cout(Cout)
                );
            end
        end
    endgenerate

endmodule
