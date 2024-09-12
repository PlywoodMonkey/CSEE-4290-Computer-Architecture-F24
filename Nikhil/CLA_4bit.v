module CLA_4bit(A, B, Cin, Sum, Cout, Xout, Yout);
   // Input and output definitions 
   input [3:0] A, B;
   input Cin;
   output [3:0] Sum;
   output Cout;
   output Xout, Yout;

   wire [3:0] X, Y; 
   wire [3:1] C;    

   // Propagate and generate
   assign X = A ^ B; 
   assign Y = A & B; 

   // Carry generation using lookahead
   assign C[1] = Y[0] | (X[0] & Cin);
   assign C[2] = Y[1] | (X[1] & C[1]);
   assign C[3] = Y[2] | (X[2] & C[2]);
   assign Cout = Y[3] | (X[3] & C[3]);

   // Sum calculation
   assign Sum = X ^ {C[3], C[2], C[1], Cin}; // Si = Pi ^ Ci

   // Carry propagate and generate for higher levels
   assign Xout = &X; // Xout is true if all Pi are true
   assign Yout = Y[3] | (X[3] & Y[2]) | (X[3] & X[2] & Y[1]) | (X[3] & X[2] & X[1] & Y[0]);

endmodule
