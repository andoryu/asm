GCC = gcc
GCC_FLAGS = -std=gnu99 -O0

all: $(patsubst %.c, %, $(wildcard *.c))

%: %.c
	$(GCC) $(GCC_FLAGS) $< -o $@
	@echo "Built $@"

clean:
	rm -f *.o $(patsubst %.c, %, $(wildcard *.c))
	@echo "Cleaned up all binaries and object files."
