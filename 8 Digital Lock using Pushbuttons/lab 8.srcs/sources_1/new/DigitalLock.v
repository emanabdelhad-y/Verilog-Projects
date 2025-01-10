`timescale 1ns / 1ps

module DigitalLock(
    input clk,
    input rst,
    input [0:3] x, 
    output reg [6:0] segments 
);

    reg [3:0] state, nextState;
    wire [0:3] y;
    wire clk_out;

    parameter [3:0] RESET = 4'b0000, A = 4'b0001, C = 4'b0010, D = 4'b0100, B = 4'b1000;

    clockDivider #(1000000) cd(.clk(clk), .rst(rst), .clk_out(clk_out));
    pushbuttonDetector p1(.clk(clk_out), .rst(rst), .x(x[0]), .z(y[0])); // A
    pushbuttonDetector p2(.clk(clk_out), .rst(rst), .x(x[1]), .z(y[1])); // B
    pushbuttonDetector p3(.clk(clk_out), .rst(rst), .x(x[2]), .z(y[2])); // C
    pushbuttonDetector p4(.clk(clk_out), .rst(rst), .x(x[3]), .z(y[3])); // D

    always @(posedge clk_out or posedge rst) begin
        if (rst) begin
            state <= RESET; 
        end else begin
            state <= nextState;
        end
    end

    // Next state logic
    always @(state) begin
        nextState = state; 
        case(state)
            RESET: begin
                if (y == 4'b1000)begin
                 nextState = A; // A pressed
                end
            end
            A: begin
                if (y == 4'b0010) nextState = C; 
                else if (y == 4'b0000) nextState = A;
                else  nextState = RESET; 
            end
            C: begin
                if (y == 4'b0001) nextState = D; 
                else if (y == 4'b0000) nextState = C;
                else  nextState = RESET; 
            end
            D: begin
                if (y == 4'b0100) nextState = B; 
                else if (y == 4'b0000) nextState = D;
                else nextState = RESET; 
            end
            B: begin
                if (y == 4'b0000) nextState = B;
            end
            default: nextState = RESET;
        endcase   
    end
    always @(state)begin 
        case(state)
            B: segments = 7'b1000001; // Display "U"
            default: segments = 7'b1000111;
        endcase
    end

endmodule