`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2024 09:35:40 PM
// Design Name: 
// Module Name: secsMinsCounter
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


module secsMinsCounter(input clk, rst, output reg [13:0]count);
    
    reg [2:0]en;
    wire clk_out;
    wire [13:0] out;
    clockDivider #(50000000) cd (.clk(clk), .rst(rst), .clk_out(clk_out));

    mod10counter sec_units ( .clk(clk_out), .rst(rst), .en(1'b1), .count(out[3:0] ));
    mod6counter sec_tens ( .clk(clk_out) , .rst(rst), .en(en[0]), .count(out[6:4] ));    
    mod10counter min_units ( .clk(clk_out), .rst(rst), .en(en[1]), .count(out[10:7]));
    mod6counter min_tens ( .clk(clk_out) , .rst(rst), .en(en[2]), .count(out[13:11]));    
    always @(posedge clk_out, posedge rst)begin
    if(rst)
        count <= 14'd0;
    else
        count <= out;
    end    
    
    always @(out ) begin
    if (rst == 1'b1) begin
        en <= 3'b0;  
         end
    if(out[3:0] == 9 )
        en[0]<=1'b1;
    else
        en[0] <= 0;
    if(out[6:4] == 5 & out[3:0] == 9 & en[0])
        en[1]<=1'b1;
    else
        en[1] <= 0;
    if (out[6:4] == 5 & out[3:0] == 9 & out[10:7]==9 & en[1] & en[0])
        en[2]<=1'b1;
    else
        en[2] <= 0;
      
    end
    



endmodule

