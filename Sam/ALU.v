
// This file is where you'll define your simple ALU for project 1.
// Refer to the project one document for instructions and guidance.

module ALU (Insert Parameters here);

    // Input definitions here
    input CLK, RST, Enable
    input reg [15:0] Data_A;         // 16-bits of data for A
    input reg [15:0] Data_B;         // 16-bits of data for B
    input reg [3:0] Opcaode;

    // Output defintions here
    output CF                       // overflow bit 
    output reg [15:0] Results;      // 16-bits 


// Implementation here

// Bunch of condiional statements depending on what the opcode is
// If the opcode starts with a 0, then take input
// If the opcode starts with a 1, then look for input
// Look at making state names

endmodule