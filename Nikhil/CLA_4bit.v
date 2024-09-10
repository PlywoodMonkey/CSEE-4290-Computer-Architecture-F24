module CLA_4bit (
    input [3:0] A,  
    input [3:0] B,  
    input Cin,      
    output [3:0] sum, 
    output Cout       
);
	
	wire [3:0] carry; 
    wire [3:0] X, Y;  
  

  
    assign X = A & B;  
    assign Y = A ^ B;  


    assign carry[0] = Cin;
    assign carry[1] = X[0] | (Y[0] & carry[0]);
    assign carry[2] = X[1] | (Y[1] & carry[1]);
    assign carry[3] = X[2] | (Y[2] & carry[2]);


    assign Cout = X[3] | (Y[3] & carry[3]);


    assign sum = Y ^ carry;

endmodule
