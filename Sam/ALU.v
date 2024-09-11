
// This file is where you'll define your simple ALU for project 1.
// Refer to the project one document for instructions and guidance.

`timescale 1ns/1ns

module ALU (CLK, RST, Enable);

    // Input definitions here
    input CLK, RST, Enable;
    reg [15:0] Data_A;
    reg [15:0] Data_B;
    reg [3:0] Opcode;

    // Output defintions here
    output reg CF;                  // overflow bit 
    output reg [15:0] Results;

    // Define States for ALU
    parameter  S_000 = 000, S_001 = 001, S_010 = 010, S_011 = 011, S_100 = 100, S_101 = 101, S_110 = 110, S_111 = 111;

    // Variables for Sequence Logic
    reg [3:0] State, StateNext;

    always @(State) begin

        // put this if statement around all of the loop so as to enable and disable the loop
        if (Enable == 1) begin

        case (State)

            S_000: begin
                // NOP Operation
                StateNext <= S_000;
                #10; 
                // Simply Does Nothing
            end // S_000
            
            S_001: begin
                // A + B
                Results = Data_A + Data_B;
                StateNext <= S_000;
                #10;
                // How to notice overflow? 
            end // S_001

            S_010: begin
                // A & B
                Results = Data_A & Data_B;
                StateNext <= S_000;
                // Should just be this
            end // S_010

            S_011: begin
                // A | B
                Results = Data_A | Data_B;
                StateNext <= S_000;
                // Should just be this
            end // S_011

            S_100: begin
                // A < B
                // Results <= Data_A < Data_B;
                StateNext <= S_000;
            end // S_100

            S_101: begin
                // A + B (write results to A)
                Data_A <= Data_A + Data_B;
                StateNext <= S_000;
                // How to set overflow flag?
            end // S_101

            S_110: begin
                // A & B (write results to A)
                Data_A <= Data_A & Data_B;
                StateNext <= S_000;
                // Should just be this
            end // S_110

            S_111: begin
                // A | B (write results to A)
                Data_A <= Data_A | Data_B;
                StateNext <= S_000;
                // Should just be this
            end // S_111

        endcase // case (State)

      end // if loop

   end // always @ (State)


    // At Reset = 1, all internal registers should be in a known state or set to 0. 
    always @(posedge CLK) begin
        if (RST == 1) begin

            // Initialize Values if not known
            if (Data_A < 0) begin
                Data_A <= 0;
            end 
            if (Data_B < 0) begin
                Data_B <= 0;
            end

            // Reset everything to Zero
            Results <= 0;
            Opcode <= 0;
	        State <= S_000;
            CF = 0;

        end else begin
	        State <= StateNext;
        end
    end // always end

// Bunch of condiional statements depending on what the opcode is
// If the opcode starts with a 0, then take input
// If the opcode starts with a 1, then look for input
// Look at making state names

endmodule
