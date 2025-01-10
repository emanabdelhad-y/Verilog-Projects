`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2024 06:01:15 PM
// Design Name: 
// Module Name: series
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


module series #(parameter n=4 ) (input [n-1 : 0]num, output reg [(2*n)-1 : 0]result);

integer i;

always @(*) begin
result =0;
for (i=2; i<=num; i= i+1) begin 
    if (i%2 ==0) begin
        result = result + i;
    end  
end

end

endmodule
