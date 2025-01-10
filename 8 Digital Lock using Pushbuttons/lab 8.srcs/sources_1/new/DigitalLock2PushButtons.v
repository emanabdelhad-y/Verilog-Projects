`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2024 04:09:26 PM
// Design Name: 
// Module Name: DigitalLock2PushButtons
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


module DigitalLock2PushButtons(input clk, input rst, input X, input Y,output reg [6:0] segments);

    reg [2:0] state, nextState;
    wire x_out, y_out;

    wire clk_out; 

    clockDivider #(1000000) cd(.clk(clk), .rst(rst), .clk_out(clk_out));

    parameter [2:0] A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100, F = 3'b101, G = 3'b110 ;

    pushbuttonDetector p1(.clk(clk_out), .rst(rst), .x(X), .z(x_out)); //X
    pushbuttonDetector p2(.clk(clk_out), .rst(rst), .x(Y), .z(y_out)); //Y

        //YXYYYX
        
    always @(posedge clk_out or posedge rst) begin
        if (rst) begin
            state <= A; 
        end 
        else begin
            state <= nextState; 
        end
    end
    

    always @(state) begin
        nextState = state; 
        
        case(state)
            A: begin 
                if (y_out) 
                    nextState = B; 
                else 
                    nextState = A;          
            end
            B: begin 
                if ( x_out)
                    nextState = C;  
                else if (!x_out && !y_out)
                    nextState = B;
                else 
                    nextState = A; 
            end
            C: begin  
                if (y_out) 
                    nextState = D; 
                else if (!x_out && !y_out)
                    nextState = C;
                else 
                    nextState = A; 
            end
            D: begin 
                if (y_out) 
                    nextState = E; 
                else if (!x_out && !y_out)
                    nextState = D;
                else 
                    nextState = A; 
            end
            E: begin 
                if (y_out) 
                    nextState = F;  
                else if (!x_out && !y_out)
                    nextState = E;
                else 
                    nextState = A; 
            end
            
            F: begin 
                if (x_out) 
                    nextState = G;  
                else if (!x_out && !y_out)
                    nextState = F;
                else 
                    nextState = A; 
            end
            
            G: begin 
                if (!x_out && !y_out)
                    nextState = G;
                else 
                    nextState = A; 
            end
            
            
            default: nextState = A;  
        endcase
    end


    always @(state) begin
        case(state)
            G: segments = 7'b1000001; 
            default: segments = 7'b1000111;  
        endcase
    end

endmodule

