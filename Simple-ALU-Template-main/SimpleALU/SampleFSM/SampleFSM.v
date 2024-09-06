// example FSM for CSEE 4290
// From Pg 44-46 Verilog text

`timescale 1ns/1ns

module SampleFSM(B, X, Clk, Rst);

input B;
output reg X;
input Clk, Rst;

// defining four states
parameter S_Off = 0, S_On1 = 1, S_On2 = 2, S_On3 = 3;

//vars for sequential logic
reg [1:0] State, StateNext; // defines 2 bit registers

// CombLogic

always @(State, B) begin // always statement with sensitivity list -->defines when to execute contents of always procedure e.g. when State or B change 

  case (State)
	S_Off: begin
		X <= 0; // sets X to 0
		if (B == 0) // check val of input B
			StateNext <= S_Off;
		else
			StateNext <= S_On1;
		end
	S_On1: begin
		X <= 1;
		StateNext <= S_On2;
		end
	S_On2: begin
		X <= 1;
		StateNext <= S_On3;
		end
	S_On3: begin
		X <= 1;
		StateNext <= S_Off;
		end
  endcase
end

//StateReg

always @(posedge Clk) begin
 
  if (Rst == 1)
	State <= S_Off;
  else //i.e. when Rst == 0
	State <= StateNext;
end

endmodule
