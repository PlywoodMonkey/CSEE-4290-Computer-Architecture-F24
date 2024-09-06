
	

	.global _start

	.text
_start:

	MOVZ X0, 0x0050 //initializing source address to register X0
	MOVZ X1, 0x013C //loading destination address value to register X1

	MOVZ X5, 0x65 //stores ASCII value of character 'e'
	MOVZ X6, 0x66 //stores ASCII value of character 'f'

	// note that STURB is essentially like STR (but ARM Edu core only suppports STURB and not STR)
	// the U stand for unscaled i.e. alignment is not required when accessing 32/64 but values 
	STURB W5, [X0]     // note: to avoid operand mismatch error, Wx register must be used, when using STURB instruction
	STURB W6, [X0, #1] //will offset X0 by one byte and store value of X6 in offsetted address
	STURB WZR, [X0, #2] //will offset X0 by 2 bytes and store value of WZR in offsetted address

	//strcpy operation
_strcpyloop: 
LDRB  W2, [X0], #1  // Load byte into X2 from memory pointed to by X0 (*src), and increment X0 after
STRB  W2, [X1], #1  // Store byte in X2 into memory pointed to by X1 (*dst), and increment X1 after
CMP   X2, #0         // Was the byte 0? 
BNE   _strcpyloop    // If not, repeat the _strcpyloop

	YIELD // will tell testbench to finish simulation once all instrucitons have been processed
	
	
