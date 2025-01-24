ASM = nasm
ASM_FLAGS = -f elf64
LD = ld
LD_FLAGS = -m elf_x86_64


# Targets
all: $(patsubst %.asm, %, $(wildcard *.asm))

%: %.asm
	$(ASM) $(ASM_FLAGS) $< -o $@.o
	$(LD) $(LD_FLAGS) $@.o -o $@
	@echo "Built $@"

clean:
	rm -f *.o $(patsubst %.asm, %, $(wildcard *.asm))
	@echo "Cleaned up all binaries and object files."
