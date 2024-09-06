//Main Program FSM
`timescale 1ns/1ns

module FSM(Rst, Clk, Count);

   input Rst, Clk;
   output reg [3:0] Count;
   reg [1:0] Increment; // max val is decimal 3, keeps track of number of times count from 0 --> 7 occurs
   
   // defining states
   parameter	    S_Zero = 0, S_1 = 1, S_2 = 2, S_3 = 3, S_4 = 4, S_5 = 5, S_6 = 6, S_7 = 7;
   

  // vars for seq logic
   reg [3:0] State, StateNext;
   
  // Comblogic

   always @(State) begin
      case (State)
	S_Zero: begin
	   Count <= 0;
	   StateNext <= S_1;
	   
	end
	S_1: begin
	   Count <= 1;
	   StateNext <= S_2;
	end
	S_2: begin
	   Count <= 2;
	   StateNext <= S_3;
	end
	S_3: begin
	   Count <= 3;
	   StateNext <= S_4;
	end
	S_4: begin
	   Count <= 4;
	   StateNext <= S_5;
	end
	S_5: begin
	   Count <= 5;
	   StateNext <= S_6;
	end
	S_6: begin
	   Count <= 6;
	   StateNext <= S_7;
	end
	S_7: begin
	   Count <= 7;
	   if (Increment == 2)
	     StateNext <= S_7;
	   else begin
	      Increment <= Increment + 1;
	      StateNext <= S_Zero;
	      
	   end
	end
      endcase // case (State)
   end // always @ (State)


   //StateReg
   always @(posedge Clk) begin
      if (Rst == 1) begin
	 State <= S_Zero;
	 Increment <= 0;
      end else begin
	State <= StateNext;
      end
   end
endmodule
