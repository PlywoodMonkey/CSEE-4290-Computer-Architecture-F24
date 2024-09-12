

all: ALU run gtkwave

ALU: ALU.v ALU_testbench.v CLA_16bit.v CLA_4bit.v
		iverilog -o ALU_testbench.vvp ALU.v CLA_16bit.v CLA_4bit.v ALU_testbench.v 


run: 
		vvp ALU_testbench.vvp -lx2 >> run.log

gtkwave:
		gtkwave dump.lx2
