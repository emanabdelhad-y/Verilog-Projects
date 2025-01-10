`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 06:04:14 PM
// Design Name: 
// Module Name: sevenSegUsingBehavioral
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


module sevenSegUsingBehavioral(
input clk,  reset,
input [0:1] sel,
input [3:0] num,
output reg [6:0] segments,
output reg [3:0] anode_active);


initial begin
anode_active = 4'b1111;
end


wire clk_out2;
clockDivider #(250000) clk_div(.clk(clk), .rst(reset), .clk_out(clk_out2)); //100 hz

    
    always @ (num) begin
    
    case(num)
        0: segments = 7'b0000001;
        1: segments = 7'b1001111;
        2: segments = 7'b0010010;
        3: segments = 7'b0000110;
        4: segments = 7'b1001100;
        5: segments = 7'b0100100;
        6: segments = 7'b0100000;
        7: segments = 7'b0001111;
        8: segments = 7'b0000000;
        9: segments = 7'b0000100;
        10: segments = 7'b0001000;
        11: segments = 7'b1100000;
        12: segments = 7'b0110001;
        13: segments = 7'b1000010;
        14: segments = 7'b0110000;
        15: segments = 7'b0111000;
        
    endcase
    
    end
    
always @(posedge clk_out2, posedge reset) begin
    if (reset) begin
        anode_active <= 4'b1111; 
    end else begin
        case (anode_active) 
            4'b1111: anode_active <= 4'b1110;
            4'b1110: anode_active <= 4'b1101;
            4'b1101: anode_active <= 4'b1011;
            4'b1011: anode_active <= 4'b0111;
            4'b0111: anode_active <= 4'b1110;
            
        endcase
    end
   end
   
    
    
    
endmodule



