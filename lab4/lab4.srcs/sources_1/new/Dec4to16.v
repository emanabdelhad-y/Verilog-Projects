module Dec4to16(in, en, Y);
//module Dec2to4(input [0:1] in, input en, output [0:3]Y);
   
   input [0:3] in;
   input en;
   output [0:15] Y;
   wire t[0:3];
   Dec2to4 d0(.in(in[2:3]), .en(en), .Y(t[0:3]));
   Dec2to4 d1(.in(in[0:1]), .en(t[0]), .Y(Y[0:3]));
   Dec2to4 d2(.in(in[0:1]), .en(t[1]), .Y(Y[4:7]));
   Dec2to4 d3(.in(in[0:1]), .en(t[2]), .Y(Y[8:11]));
   Dec2to4 d4(.in(in[0:1]), .en(t[3]), .Y(Y[12:15])); 

endmodule