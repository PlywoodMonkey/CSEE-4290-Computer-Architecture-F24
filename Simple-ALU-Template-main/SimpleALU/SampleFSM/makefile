

sampleFSM: SampleFSM.v SampleFSM_Test.v
	iverilog -o sampleTest.vvp SampleFSM.v SampleFSM_Test.v

run: 
	vvp sampleTest.vvp -lx2 >> run.log

gtkwave:
	gtkwave dump.lx2


