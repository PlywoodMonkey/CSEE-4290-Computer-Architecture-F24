// This file is where you'll define the testbench for your simple ALU 
// for project 1. Refer to the project one document for instructions 
// and guidance.

`timescale 1ns/1ns

module ALU_testbench();

   reg CLK_s, RST_s, Enable_s;
   reg [15:0] Data_A_s;
   reg [15:0] Data_B_s; 
   reg [2:0]  Opcode_s;
   
   // Output defintions here
   wire	      CF_s;                   
   wire [15:0] Results_s;      
   
   ALU ALU_Test_Functions(CLK_s, RST_s, Enable_s, Data_A_s, Data_B_s, Opcode_s, CF_s, Results_s);
   
   // Basic Clock
   always begin
      CLK_s <= 0;
      #10;
      CLK_s <= 1;
      #10;
   end

   initial begin
      $dumpvars(0, ALU_testbench); // Include name of tb file
      // init input data
      Data_A_s <= 'h0000;
      Data_B_s <= 'h0000;
      Enable_s <= 0;
      Opcode_s <= 0;
      RST_s <= 0;
      
      
      #20;
      
      @(posedge CLK_s)
        RST_s <= 1;
      
      @(posedge CLK_s)
        RST_s <= 0;
      #100;
      
      // Enable is off, Data is present, try to Add
      
      @(posedge CLK_s) begin
         Enable_s <= 0;
	 Data_A_s <= 'h6464;
	 Data_B_s <= 'h4646;
	 Opcode_s <= 'b001;
      end
      
      #100;
      
      // Add Data_A and Data_B
      @(posedge CLK_s) begin
        Enable_s <= 1;
      end
      
      #100;
      
      // Add Data_A and Data_B, then try to & them, but have the enable off.
      @(posedge CLK_s) begin
         Enable_s <= 0;
      end

      @(posedge CLK_s) begin
	 Opcode_s <= 'b010;
      end
	 
      // Enable high
      @(posedge CLK_s) begin
	 Enable_s <= 1;
      end

      #100;
      
      // Enable Low
      @(posedge CLK_s) begin
         Enable_s <= 0;
      end
      
      // A OR B
      @(posedge CLK_s) begin
	 Opcode_s <= 'b011;
      end
      
      // Enable high
      @(posedge CLK_s) begin
	 Enable_s <= 1;
      end

      // Enable Low
      @(posedge CLK_s) begin
         Enable_s <= 0;
      end

      // A LESS THAN B
      @(posedge CLK_s) begin
	 Opcode_s <= 'b000;
      end
      
      // Enable high
      @(posedge CLK_s) begin
	 Enable_s <= 1;
      end
 
      // Enable low
      @(posedge CLK_s) begin
	 Enable_s <= 0;
      end

      // A LESS THAN B
      @(posedge CLK_s) begin
	 Opcode_s <= 'b100;
      end
      
        // Enable high
      @(posedge CLK_s) begin
	 Enable_s <= 1;
      end
 
      // Enable low
      @(posedge CLK_s) begin
	 Enable_s <= 0;
      end

      // A AND B
      @(posedge CLK_s) begin
	 Opcode_s <= 'b101;
      end
      
      // Enable high
      @(posedge CLK_s) begin
	 Enable_s <= 1;
      end
 
      // Enable low
      @(posedge CLK_s) begin
	 Enable_s <= 0;
      end

      // A OR B
      @(posedge CLK_s) begin
	 Opcode_s <= 'b101;
      end

      // Enable high
      @(posedge CLK_s) begin
	 Enable_s <= 1;
      end
 
      // Enable low
      @(posedge CLK_s) begin
	 Enable_s <= 0;
      end

      // A OR B
      @(posedge CLK_s) begin
	 Opcode_s <= 'b101;
      end

      // Enable high
      @(posedge CLK_s) begin
	 Enable_s <= 1;
      end
 
      // Enable low
      @(posedge CLK_s) begin
	 Enable_s <= 0;
      end

      // A OR B
      @(posedge CLK_s) begin
	 Opcode_s <= 'b000;
      end
      
      // Enable high
      @(posedge CLK_s) begin
	 Enable_s <= 1;
      end
 
      // Enable low
      @(posedge CLK_s) begin
	 Enable_s <= 0;
      end

      // A OR B
      @(posedge CLK_s) begin
	 Opcode_s <= 'b110;
      end

      // Enable high
      @(posedge CLK_s) begin
	 Enable_s <= 1;
      end
 
      // Enable low
      @(posedge CLK_s) begin
	 Enable_s <= 0;
      end

      // A OR B
      @(posedge CLK_s) begin
	 Opcode_s <= 'b111;
      end

      // Enable high
      @(posedge CLK_s) begin
	 Enable_s <= 1;
      end
 
      // Enable low
      @(posedge CLK_s) begin
	 Enable_s <= 0;
      end


      #200;
      
      @(posedge CLK_s)
        $finish;
      
   end // Initial Begin
   
endmodule // End of ALU Testbench
