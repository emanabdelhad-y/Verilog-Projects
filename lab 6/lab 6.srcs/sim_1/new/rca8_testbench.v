`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 06:47:06 PM
// Design Name: 
// Module Name: rca8_testbench
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


module rca8_testbench();
    reg [7:0]a;
    reg [7:0]b;
    wire [7:0]sum;
    reg cin;
    wire cout;
    
    wire [7:0]ref_s; 
    wire ref_cout, err;
    
    rca_8 rca(.a(a), .b(b),.cin(cin), .Cout(cout), .S(sum));
    
    assign {ref_cout, ref_s} = a+b+cin;
    assign err = (ref_s != sum) || (ref_cout != cout);

    integer i;
    initial begin 
    for(i=0; i< 131072; i=i+1) begin
        {a,b,cin} = i; #10
        if(err == 1)
            $display ("Input combination %d failed.", i);
    end
    $finish;
    end

endmodule
