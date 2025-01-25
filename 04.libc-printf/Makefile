ASM = nasm
ASM_FLAGS = -f elf64
LD = ld
LD_FLAGS = -m elf_x86_64 -lc
GCC_FLAGS = -z noexecstack

# Targets
all: $(patsubst %.asm, %, $(wildcard *.asm))

#	$(LD) $(LD_FLAGS) $@.o -o $@

%: %.asm
	$(ASM) $(ASM_FLAGS) $< -o $@.o
	gcc $(GCC_FLAGS) $@.o -o $@
	@echo "Built $@"

clean:
	rm -f *.o $(patsubst %.asm, %, $(wildcard *.asm))
	@echo "Cleaned up all binaries and object files."
