`timescale 1ns / 1ps

module tb_Finalcomparator();
    reg [3:0] A, B;
    wire [6:0] seg;

    comparator4bit uut ( .a(A), .b(B), .segments(seg) );

    integer i;
    reg [6:0] expected;
    reg err;

   always @(*)
   begin
        if (A > B) begin
            expected = 7'b0000001;
        end else if (A < B) begin
            expected = 7'b0000010;
        end else begin
            expected = 7'b0000000;
        end
end
    initial begin
        for (i = 0; i < 256; i = i + 1) begin
            {A, B} = i; 
            #100;

            expected = expected_output(A, B);
            err= (seg !== expected);

            if (err) begin
                $display("Error: A=%b, B=%b, seg=%b (Expected: %b)", A, B, seg, expected);
            end else begin
                $display("Pass: A=%b, B=%b, seg=%b", A, B, seg);
            end
        end
        $finish;
    end

endmodule
