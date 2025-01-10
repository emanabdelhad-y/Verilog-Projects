`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 05:23:30 PM
// Design Name: 
// Module Name: testbench
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


module rca4_testbench();
    reg [3:0]a;
    reg [3:0]b;
    wire [3:0]sum;
//    wire [1:3] cin;
    reg cin;
    wire cout;
    
    wire [3:0]ref_s; 
    wire ref_cout, err;
    
    rca_4 rca(.a(a), .b(b),.cin(cin), .Cout(cout), .S(sum));
    
    assign {ref_cout, ref_s} = a+b+cin;
    assign err = (ref_s != sum) || (ref_cout != cout);

//    assign cin[1] = 3'b000;
    
    integer i;
    initial begin 
    for(i=0; i< 512; i=i+1) begin
        {a,b,cin} = i; #10
        if(err == 1)
            $display ("Input combination %d failed.", i);
    end
    $finish;
    end

endmodule
