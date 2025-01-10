`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024 04:43:43 PM
// Design Name: 
// Module Name: digitalclock
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Digital clock displaying seconds and minutes with a 7-segment display
// 
// Dependencies: 
// - Clock divider (`clockDivider`)
// - BCD (`BCD`)
// - Counter (`counter`)
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module digitalclock(input clk, reset,output [6:0] seg,output [3:0] an);

    wire [3:0] secUnits, minUnits;
    wire [2:0] secTens, minTens;

    reg [3:0] BcdDigit;   
    reg [1:0] select; 

    wire clk_out;
    clockDivider #(250000) clk_div (.clk(clk), .rst(reset), .clk_out(clk_out));

    counter counter (
        .clk(clk),
        .reset(reset),
        .secunits(secUnits),
        .sectens(secTens),
        .minunits(minUnits),
        .mintens(minTens)
    );

    BCD bcd (.select(select),.num(selectBcdDigit),.segments(seg),.anode_active(an));

    integer i = 0;
    
    always @(posedge clk_out or posedge reset) begin
        if (reset) begin
            i <= 0;  
            select <= 0;  
            BcdDigit <= secUnits; 
        end else begin
            if (i == 3)
                i <= 0; 
            else
                i <= i + 1;
            select <= i; 

            case(i) 
                0: BcdDigit <= secUnits;
                1: BcdDigit <= secTens;
                2: BcdDigit <= minUnits;
                default: BcdDigit <= minTens;  // Default case for mintens
            endcase
        end
    end

endmodule
