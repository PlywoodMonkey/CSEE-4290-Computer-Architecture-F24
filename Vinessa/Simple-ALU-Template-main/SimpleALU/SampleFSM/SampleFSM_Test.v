// Testbench for Sample FSM

`timescale 1ns/1ns

module SampleFSM_Test();

reg Clk_s, Rst_s, B_s;
wire X_s;

SampleFSM  CompToTest(B_s, X_s, Clk_s, Rst_s);

// clock is defines with period of 20ns

always begin
	Clk_s <= 0;
	#10;
	Clk_s <= 1;
	#10;
end

// Test inputs

initial begin
$dumpvars(0,SampleFSM_Test);
   // set reset high
	Rst_s <= 1;
   // set input B low
	B_s <= 0;
   // at pos edge of clk, set reset low after 5 ns delay
	@(posedge Clk_s);
	#5 Rst_s <= 0;
   // at pos edge of clk, set input B high after 5 ns delay
	@(posedge Clk_s);
	#5 B_s <= 1;
   // at pos edge of clk, set input B to low after 5 ns delay
	@(posedge Clk_s);
	#5 B_s <= 0;
   // allow clk to run a bit more
	@(posedge Clk_s);
	@(posedge Clk_s);
	@(posedge Clk_s);
	@(posedge Clk_s);
#10 $finish;
end
endmodule
	
