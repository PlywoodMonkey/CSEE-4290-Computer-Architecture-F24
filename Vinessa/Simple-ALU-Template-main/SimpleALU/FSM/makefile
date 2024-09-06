

fsm: FSM.v FSM_Test.v
	iverilog -o FSM_Test.vvp FSM.v FSM_Test.v 


run: 
	vvp FSM_Test.vvp -lx2 >> run.log

gtkwave:
	gtkwave dump.lx2

