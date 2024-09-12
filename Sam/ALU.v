
// This file is where you'll define your simple ALU for project 1.
// Refer to the project one document for instructions and guidance.

`timescale 1ns/1ns

module ALU (CLK, RST, Enable, X, Y, Opcode, CF, Results);

   // Input definitions here
   input CLK, RST, Enable;
   input [15:0]	X, Y;
   input [2:0] Opcode;
   
   reg [15:0] Data_A;
   reg [15:0] Data_B;
   reg [15:0] prevX;
   reg [15:0] prevY;
   reg [16:0] OverflowCheck;
   reg [2:0]  test;
   

   
   // Output defintions here
   output reg	     CF;                  // overflow bit 
   output reg [15:0] Results;

   // Define States for ALU
   parameter	     S_000 = 'b000, S_001 = 'b001, S_010 = 'b010, S_011 = 'b011, S_100 = 'b100, S_101 = 'b101, S_110 = 'b110, S_111 = 'b111;
   
   // Variables for Sequence Logic
   reg [3:0]	     State, StateNext;

   // At Reset = 1, all internal registers should be in a known state or set to 0. 
   always @(posedge CLK) begin
      if (RST == 1) begin
	 Data_A = 0;
	 Data_B = 0;
         prevX = 0;
	 prevY = 0;
	 test = 0;
	 
	 
         // Reset everything to Zero
         Results = 0;
	 State = S_000;
	 StateNext = S_000;
	 CF = 0;
	 OverflowCheck = 0;
	 
      end else begin // if (RST == 1)

	if (prevX != X) begin
	    
	    #100;
	    //test = 1;
	    Data_A = X;
		
	end else if (prevY != Y) begin
	    #100
	    Data_B = Y;
	  
	 end  
	 
	 // put this if statement around all of the loop so as to enable and disable the loop
	 if (Enable == 1) begin

            case (Opcode)
	      
              S_000: begin
		 // NOP Operation
		 // Set Data A and Data B to X and Y, respectively
		 //Data_A <= X;
		 //Data_B <= Y;
		 // Simply Does Nothing

		 
              end // S_000
              
              S_001: begin
		 // A + B
		 //Data_A = X;
		 //Data_B = Y;
		 
		 Results = Data_A + Data_B;
		 		 
		 OverflowCheck = Data_A + Data_B;
		 
		 // checks for overflow
		 if (OverflowCheck[16] == 1) begin
		    CF <= 1;
		 end else begin
		    CF <= 0;
		 end
		 
              end // S_001

              S_010: begin
		 // A & B
		 //Data_A = X;
		 //Data_B = Y;
		 
		 Results = Data_A & Data_B;
		 CF = 0;
		 
		 
              end // S_010
	      
              S_011: begin
		 // A | B
		 //Data_A = X;
		 //Data_B = Y;
		 
		 Results = Data_A | Data_B;
		 CF = 0;
		 
		 
              end // S_011

              S_100: begin
		 // A < B
		 // Results <= Data_A < Data_B;
		 //Data_A = X;
		 //Data_B = Y;
		 
		 if (Data_A < Data_B) begin
		    CF = 1;
		 end else begin 
		    CF = 0;
		 end

		 Results = CF;
		 		 
              end // S_100

              S_101: begin
		 // A + B (write results to A)
		 //Data_B = Y;
		 Results = Data_A + Data_B;
		 OverflowCheck = Data_A + Data_B;
		 Data_A = Results;
		 
		 // check for overflow
		 if (OverflowCheck[16] == 1) begin
		    CF = 1;
		 end else begin
		    CF = 0;
		 end
		 
              end // S_101

              S_110: begin 
		 // A & B (write results to A)
		 //Data_A = X;
		 //Data_B = Y;
		 
		 Data_A = Data_A & Data_B;
		 Results = Data_A;
		 
		 CF = 0;
		 		 
              end // S_110

              S_111: begin
		 // A | B (write results to A)
		 //Data_A = X;
		 //Data_B = Y;
		 
		 Data_A = Data_A | Data_B;
		 Results = Data_A;

		 CF = 0;
		 
		 
              end // S_111

            endcase // case (State)
	    
	 end   
      end
   end // always end
      
   // Bunch of condiional statements depending on what the opcode is
   // If the opcode starts with a 0, then take input
   // If the opcode starts with a 1, then look for input
   // Look at making state names
      
endmodule
