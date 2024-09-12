

.global _start

_start:
	// address values
	MOV X0, #0x0050
	MOVZ	X1, #0x013C

_strcpyloop: 
	LDRB  W2, [X0], #1  		
	STRB  W2, [X1], #1		
	SUBS  XZR, X2, #0	// Was the byte 0?
	BNE   _strcpyloop      			
	YIELD  


	
