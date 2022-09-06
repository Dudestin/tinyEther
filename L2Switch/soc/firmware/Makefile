## Hardware setting variables
## edit parameters for your soc
MEM_WIDTH=32    ## 1-word length
MEM_DEPTH=4096  ## unit : word

## Compile & linking options
CROSS=riscv32-unknown-elf-
CFLAGS=-Os -Wall
ABI=ilp32
ARCH=rv32ic

# compile program & linking
rom.elf: sections.lds start.s firmware.c frame.h
	$(CROSS)gcc $(CFLAGS) -DBUILD -mabi=$(ABI) -march=$(ARCH) -Wl,--build-id=none,-Bstatic,-T,sections.lds,--strip-debug -ffreestanding -nostdlib -o $@ start.s firmware.c frame.c

# convert ELF to raw machine code
rom.bin: rom.elf
	$(CROSS)objcopy -O binary $^ $@

# generate BRAM initialize file
rom.mif: rom.bin mif_header mif_footer
	xxd -e -c4 rom.bin | awk '{printf "%04X: %s;\n", NR-1, $$2}' > text.mif
	cat mif_header text.mif mif_footer > ../memory/$@

clean:
	rm -f rom.mif rom.bin rom.elf

.PHONY: clean
