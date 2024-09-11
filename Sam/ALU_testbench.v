// This file is where you'll define the testbench for your simple ALU 
// for project 1. Refer to the project one document for instructions 
// and guidance.

`timescale 1ns/1ns

module ALU_testbench();

    reg CLK_s, RST_s, Enable_s;
    reg [15:0] Data_A_s;
    reg [15:0] Data_B_s; 
    reg [3:0] Opcode_s;

    // Output defintions here
    reg CF;                   
    output wire [15:0] Results;      

    reg [1:0] test_case = 1;

    ALU ALU_Test_Functions(CLK_s, RST_s, Enable_s);

    // Basic Clock
    always begin
        CLK_s <= 0;
        #10;
        CLK_s <= 1;
        #10;
    end

    initial begin
        $dumpvars(0, ALU_testbench); // Include name of tb file

        case (test_case)
            
            1: begin // Reset The System
                #20
                @(posedge CLK_s)
                RST_s <= 1;
                Enable_s <= 1;
                Data_A_s <= 6464;
                Data_B_s <= 4646;
                Opcode_s <= 001;
                #20;

                @(posedge CLK_s)
                RST_s <= 0;
                #20;

                @(posedge CLK_s)
                Enable_s <= 0;
                #750;

            end // End Test Case 1

            2: begin
                
            end

        endcase // End Test Case Selection

    @(posedge CLK_s)
        $finish;

    end // Initial Begin

endmodule // End of ALU Testbench
