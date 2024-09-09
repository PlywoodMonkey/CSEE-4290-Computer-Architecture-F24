
// This file is where you'll define your simple ALU for project 1.
// Refer to the project one document for instructions and guidance.

`timescale 1ms/1ms

module ALU (CLK, RST, Enable, Data_A, Data_B, Opcode);

    // Input definitions here
    input CLK, RST, Enable;
    input [15:0] Data_A;
    input [15:0] Data_B;         // 16-bits of data for A
    input [3:0] Opcode;

    // Output defintions here
    output CF;                  // overflow bit 
    output reg [15:0] Results;      // 16-bits 

    // Define States for ALU
    parameter  S_000 = 000, S_001 = 001, S_010 = 010, S_011 = 011, S_100 = 100, S_101 = 101, S_110 = 110, S_111 = 111;

    // Variables for Sequence Logic
    reg [3:0] State, StateNext;

    always @(State) begin

      case (State)

	    S_000: begin
            StateNext <= S_001;
            #10; // Simply Does Nothing
	    end
	    
        S_001: begin
            Results = Data_A + Data_B;
            #10;
	        StateNext <= S_000;
	    end
/*
	    S_010: begin
	        StateNext <= S_011;
	    end

	    S_011: begin
	        StateNext <= S_100;
	    end

	    S_100: begin
	        StateNext <= S_101;
	    end

	    S_101: begin
	        StateNext <= S_110;
	    end

	    S_110: begin
	        StateNext <= S_111;
	    end

	    S_111: begin
	        StateNext <= S_000;
	   end
*/
      endcase // case (State)
   end // always @ (State)

    //StateReg
    always @(posedge CLK) begin
        if (RST == 1) begin
	        State <= S_000;
        end else begin
	        State <= StateNext;
        end
    end

// Bunch of condiional statements depending on what the opcode is
// If the opcode starts with a 0, then take input
// If the opcode starts with a 1, then look for input
// Look at making state names

endmodule
