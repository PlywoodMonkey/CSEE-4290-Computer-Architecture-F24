module CLA_16bit(A, B, Cin, Sum, Cout);
   // Input and output definitions 
   input [15:0] A, B;
   input Cin;
   output [15:0] Sum;
   output Cout;
   
   // Internal carry signals between each 4-bit CLA block
   wire [3:0] X, Y; // Propagate and generate signals at 16-bit level   
   wire [3:1] C; // Carry signals between 4-bit blocks

   // Instantiate four 4-bit CLA subblocks
   CLA_4bit CLA0 (A[3:0],   B[3:0],   Cin,     Sum[3:0],   C[1], X[0], Y[0]);
   CLA_4bit CLA1 (A[7:4],   B[7:4],   C[1],    Sum[7:4],   C[2], X[1], Y[1]);
   CLA_4bit CLA2 (A[11:8],  B[11:8],  C[2],    Sum[11:8],  C[3], X[2], Y[2]);
   CLA_4bit CLA3 (A[15:12], B[15:12], C[3],    Sum[15:12], Cout, X[3], Y[3]);
   
   // Final carry propagation logic
   wire Xout, Yout;
   assign Xout = &X; // All propagate signals true
   assign Yout = Y[3] | (X[3] & Y[2]) | (X[3] & X[2] & Y[1]) | (X[3] & X[2] & X[1] & Y[0]);

endmodule
