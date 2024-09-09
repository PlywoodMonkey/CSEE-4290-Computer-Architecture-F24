// This file is where you'll define the testbench for your simple ALU 
// for project 1. Refer to the project one document for instructions 
// and guidance.

`timescale 1ms/1ms

module ALU_testbench();

    reg CLK_s, RST_s, Enable_s;
    reg [15:0] Data_A_s; // these had to be regs for some reason
    reg [15:0] Data_B_s; 
    reg [3:0] Opcode_s;

    // Output defintions here
    reg CF;                   
    output wire [15:0] Results;      

    ALU ALU_Test_Functions(CLK_s, RST_s, Enable_s, Data_A_s, Data_B_s, Opcode_s);

    // Basic Clock
    always begin
        CLK_s <= 0;
        #10;
        CLK_s <= 1;
        #10;
    end

    initial begin
        $dumpvars(0,ALU_testbench); // Include name of tb file

        RST_s <= 1;
        #10;
        @(posedge CLK_s)
        RST_s <= 0;
        #20;
        @(posedge CLK_s)
        Data_A_s = 6464;
        Data_B_s = 4646;
        Opcode_s = 001;
        #20;

    end // Initial Begin

endmodule // End of ALU Testbench
