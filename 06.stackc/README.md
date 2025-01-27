Quick C test to check performance.

The code structure is intended to be similar.

Three tests were run, first with -O0

  initial stack pointer = 0x0x7fffd8ff2560
  a = 300
  stack pointer = 0x0x7fffd8ff2560

  real	0m0.046s
  user	0m0.043s
  sys	0m0.003s


Second with -O1

  initial stack pointer = 0x0x7fff5082c0b0
  a = 300
  stack pointer = 0x0x7fff5082c0b0

  real	0m0.041s
  user	0m0.038s
  sys	0m0.003s


Finally with all optimisations turned on (-O3).

  initial stack pointer = 0x0x7ffcc449f870
  a = 300
  stack pointer = 0x0x7ffcc449f870

  real	0m0.039s
  user	0m0.036s
  sys	0m0.003s

-O3 made no difference. Overall intereseting to note that C was nearly 2x slower than the assembly with -O0.

Also interesting to note the C code took signifantly less time to develop in comparison to the assembly.
Partially faimilarity with C, but also the more verbose asm as well as the mental state tracking.
