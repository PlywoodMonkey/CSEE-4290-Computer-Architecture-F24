

	.global _start
	
	.text
	
	
_start:
	MOV X1, #0x00FF000000000000
	MOV X4, X1
	MOV X1, #0xDD
	LSL X1, X1, #4
	ADD X4, X4, X1


YIELD

	

