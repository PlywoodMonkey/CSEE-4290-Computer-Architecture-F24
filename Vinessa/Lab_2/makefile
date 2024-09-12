


compile:
	aarch64-none-elf-gcc -nostdlib -nodefaultlibs -lgcc -gdwarf-4 -Wa,-march=armv8-a -Wl,-Ttext=0x0 -Wl,-N -o test_ALIAS.elf test_ALIAS.s

objcopy:
	aarch64-none-elf-objcopy -O verilog test_ALIAS.elf test_ALIAS.mem


