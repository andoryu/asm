%include "syscalls.s"
%include "print.s"

section .data
    number dw 5687

section .text
    global _start

_start:
    print_integer 1275590
    print_nl
    exit 0
