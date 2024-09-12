

	.global _start
	
	.text
	
	
_start:	
	
MOV	X5, #0xff
AND	X6, X5, #0x00003ffc00003ffc
ORR	X7, X5, #0x00003ffc00003ffc
YIELD

	

