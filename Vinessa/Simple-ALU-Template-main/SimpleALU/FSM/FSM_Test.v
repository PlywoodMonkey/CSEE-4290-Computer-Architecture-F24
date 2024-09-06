
// This is the testbench code for testing FSM program, P1

`timescale 1ns/1ns

module FSM_Test();

   reg Clk_s, Rst_s;
   wire [3:0] Count;
   // Choose Test to run {0,1,2, or 3}
   reg [1:0]  choose_test = 2;
   
      
   FSM CompToTest(Rst_s, Clk_s, Count);

   // define Clk (PERIOD = 20ns)
   always begin
	Clk_s <= 0;
	#10;
	Clk_s <= 1;
	#10;
   end


   // Test Inputs
   initial begin
      $dumpvars(0, FSM_Test);

      
      case (choose_test)
	1: begin
	// Test 1: Clr with Reset
	   Rst_s <= 1;
	   
	   @(posedge Clk_s) // set Rst to high to begin count
	     #5 Rst_s <= 0;
	   
	   // delay 750 ns 
	   #750;
	end
	2: begin
	     
	   // Test 2: Set Reset High after two iterations i.e. when Increment = 2
	   @(posedge Clk_s)
	     Rst_s <= 1;
	   
	   @(posedge Clk_s)
	     Rst_s <= 0;
	   
	   #250;
	   
	   @(posedge Clk_s)
	     Rst_s <= 1;

	   @(posedge Clk_s)
	     Rst_s <= 0;

	   
	   #750;
	end // case: 2

	3: begin

	   // Test 3: Set Reset High initially and forever
	   #10;

	   @(posedge Clk_s)
	     Rst_s <= 1;

	   #200;

	end // case: 3

	0: begin

	   // Test 4: Set Reset High initially and after 3 increments
	   Rst_s <= 1;
	   #10;
	   
	   @(posedge Clk_s)
	     Rst_s <= 0;

	   #750;

	   @(posedge Clk_s)
	     Rst_s <= 1;

	   @(posedge Clk_s)
	     Rst_s <= 0;

	   #500;
	   
	   
	end
	  
      endcase // case (choose_test)
      
      @(posedge Clk_s)
	$finish;
      
   end // initial begin
endmodule // FSM_Test

   



   
