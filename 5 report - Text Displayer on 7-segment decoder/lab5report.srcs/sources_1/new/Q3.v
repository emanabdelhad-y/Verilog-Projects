`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 06:56:04 PM
// Design Name: 
// Module Name: Question3
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

module question3(
    input [1:0] sel,         // Two-bit input from toggle switches
    output reg [6:0] display0,   // Segments for the first display
    output reg [6:0] display1,   // Segments for the second display
    output reg [6:0] display2,   // Segments for the third display
    output reg [6:0] display3,   // Segments for the fourth display
    output reg [3:0] anode_active // Active states for the common anodes
);
    
    // Instantiate Question2 for all characters
wire [6:0] segments[0:8];

    Question2 d0 (.num(0), .segments(segments[0])); // O
    Question2 d1 (.num(1), .segments(segments[1])); // P
    Question2 d2 (.num(2), .segments(segments[2])); // E
    Question2 d3 (.num(3), .segments(segments[3])); // N
    Question2 d4 (.num(4), .segments(segments[4])); // C
    Question2 d5 (.num(5), .segments(segments[5])); // L
    Question2 d6 (.num(6), .segments(segments[6])); // O
    Question2 d7 (.num(7), .segments(segments[7])); // S
    Question2 d8 (.num(8), .segments(segments[8])); // F        
    always @(*) begin
// Initialize all segments to off (active low)
        anode_active = 4'b1111; // All displays off by default
        display0 = 7'b1111111;
        display1 = 7'b1111111;
        display2 = 7'b1111111;
        display3 = 7'b1111111;
        
        case (sel)
            2'b00: begin
                anode_active = 4'b0000; // Activate all displays
                display0 = segments[0];  // display 'O'
                display1 = segments[1];  // display 'P'
                display2 = segments[2];  // display 'E'
                display3 = segments[3];  // display 'N'
            end
            
            2'b01: begin
                anode_active = 4'b0000; // Activate all displays
                display0 = segments[4];  // display 'C'
                display1 = segments[5];  // display 'L'
                display2 = segments[6];  // display 'O'
                display3 = segments[7];  // display 'S'
            end
            
            2'b10: begin
                anode_active = 4'b1100; // Activate first two displays
                display0 = segments[0];   // display 'O'
                display1 = segments[3];   // display 'N'
                display2 = 7'b1111111;  // Turn off third display
                display3 = 7'b1111111;  // Turn off fourth display
            end
            
            2'b11: begin
                anode_active = 4'b1000; // Activate first three displays
                display0 = segments[0];   // display 'O'
                display1 = segments[8];   // display 'F'
                display2 = segments[8];   // display 'F'
                display3 = 7'b1111111;  // Turn off fourth display
            end
            
            default: begin
                anode_active = 4'b1111; // All inactive
                display0 = 7'b1111111;
                display1 = 7'b1111111;
                display2 = 7'b1111111;
                display3 = 7'b1111111;
            end
        endcase
    end
    
endmodule
