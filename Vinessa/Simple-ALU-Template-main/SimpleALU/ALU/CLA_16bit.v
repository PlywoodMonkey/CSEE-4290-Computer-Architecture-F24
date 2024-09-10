module CLA_16bit (
    input [15:0] A,  
    input [15:0] B,  
    output [15:0] sum,  
    output Cout       
);

    wire C1, C2, C3; 


    CLA_4bit CLA0 (.A(A[3:0]),   .B(B[3:0]),   .Cin(1'b0), .sum(sum[3:0]),   .Cout(C1));
    CLA_4bit CLA1 (.A(A[7:4]),   .B(B[7:4]),   .Cin(C1),  .sum(sum[7:4]),   .Cout(C2));
    CLA_4bit CLA2 (.A(A[11:8]),  .B(B[11:8]),  .Cin(C2),  .sum(sum[11:8]),  .Cout(C3));
    CLA_4bit CLA3 (.A(A[15:12]), .B(B[15:12]), .Cin(C3),  .sum(sum[15:12]), .Cout(Cout));

endmodule
