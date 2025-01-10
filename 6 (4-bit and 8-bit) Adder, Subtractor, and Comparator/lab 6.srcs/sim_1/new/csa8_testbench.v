`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 07:35:35 PM
// Design Name: 
// Module Name: csa8_testbench
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

module csa8_testbench();
    // Inputs
    reg [7:0] a;
    reg [7:0] b;
    reg cin;
    
    // Outputs
    wire [7:0] sum;
    wire cout;
   
    // Helper wires
    wire [7:0] ref_s; 
    wire ref_cout, err;
    
    // Instantiate the csa_8 module
    csa_8 csa (
        .a(a),
        .b(b),
        .cin(cin),
        .Cout(cout),
        .S(sum)
    );
    
    // Reference model for sum and cout
    assign {ref_cout, ref_s} = a + b + cin;
    assign err = (ref_s != sum) || (ref_cout != cout);

    integer i;
    initial begin 
        // Test all combinations of a, b, and cin
        for (i = 0; i < 131072; i = i + 1) begin
            {a, b, cin} = i; 
            #10;  // Wait for 10 time units

            // Check for errors and display input combination if there's a mismatch
            if (err) 
                $display("Input combination %d failed: a = %b, b = %b, cin = %b | Expected: {sum = %b, cout = %b}, Got: {sum = %b, cout = %b}", 
                         i, a, b, cin, ref_s, ref_cout, sum, cout);
        end
        
        // End simulation
        $finish;
    end
endmodule
