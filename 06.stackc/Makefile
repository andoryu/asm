GCC = gcc
GCC_FLAGS = -std=gnu99 -O1

all: $(patsubst %.c, %, $(wildcard *.c))

%: %.c %.h
	$(GCC) $(GCC_FLAGS) $< -o $@
	@echo "Built $@"
