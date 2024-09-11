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

    reg [2:0] test_case = 1;

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
                #20;

                @(posedge CLK_s)
                RST_s <= 0;
                #200;

            end // End Test Case 1

            2: begin // Enable is off, Data is present, try to Add

                #20
                @(posedge CLK_s)
                Enable_s <= 0;
                Data_A_s <= 6464;
                Data_B_s <= 4646;
                Opcode_s <= 001;
                #200;

                // Nothing should happen

            end

            3: begin // Add Data_A and Data_B

                #20
                @(posedge CLK_s)
                Enable_s <= 0;
                Data_A_s <= 6464;
                Data_B_s <= 4646;
                Opcode_s <= 001;
                #20;

                @(posedge CLK_s)
                Enable_s <= 1;
                #200;

                // Now things should happen

            end

            4: begin // Add Data_A and Data_B, then try to & them, but have the enable off.

                #20
                @(posedge CLK_s)
                Enable_s <= 0;
                Data_A_s <= 6464;
                Data_B_s <= 4646;
                Opcode_s <= 001;
                #20;

                @(posedge CLK_s)
                Enable_s <= 1;
                #20;

                @(posedge CLK_s)
                Enable_s <= 0;
                Opcode_s <= 010;
                #200;

                // Nothing should happen after the add

            end

        endcase // End Test Case Selection

    @(posedge CLK_s)
        $finish;

    end // Initial Begin

endmodule // End of ALU Testbench
