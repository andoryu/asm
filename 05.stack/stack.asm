default rel

section .data
    test: db "test!", 0x00

    int_format: db "val = %ld", 0x0A, 0x00
    hex_format: db "val = 0x%016lx", 0x0A, 0x00

    name_intval_format: db "%s = %ld", 0x0A, 0x00
    name_hexval_format: db "%s = 0x%016X", 0x0A, 0x00

    val_r15: db "r15", 0x00
    val_loops: db "loops", 0x00

section .rodata
    num dq 1234567
    loops dq 10_000_000

    ;byte codes
    load_int:   dq 0x0001_0000_0000_0000
    iadd:       dq 0x0002_0000_0000_0000

section .bss
    stack: resq 1024

%include "print.s"
%include "bytecode.s"

section .text
    extern printf
    extern puts
    global main

main:
    ;lc_puts test
    ;lc_printf_int int_format, [num]

    mov r15, stack + (1024 * 8)         ; set r15 to top of stack + 1
    lc_printf_name_int name_hexval_format, val_r15, r15

    ; test n times
    lc_printf_name_int name_intval_format, val_loops, [loops]
    mov rcx, [loops]

loop_test:
    ; testing simple bytecode logic
    ;lc_printf_int hex_format, [load_int]
    mov r14, [load_int]   ; create a dummy load int = 100 bytecode
    add r14, 100
    bc_push_int
    ;lc_printf_int int_format, [r15]
    ;lc_printf_int hex_format, r15

    mov r14, [load_int]  ; create a dummy load int = 200 bytecode
    add r14, 200
    bc_push_int
    ;lc_printf_int int_format, [r15]
    ;lc_printf_int hex_format, r15

    ; stack should have two values on it 200, 100
    ; int add byte code
    mov r14, [iadd]
    bc_iadd
    ;lc_printf_int hex_format, [iadd]
    ;lc_printf_int int_format, [r15]
    ;lc_printf_int hex_format, r15

    s_pop rax

    loop loop_test

    lc_printf_int int_format, rax
    lc_printf_name_int name_hexval_format, val_r15, r15

    mov eax, 1  ; 'exit', syscall = 1
    mov ebx, 0 ; exit code in parameter 1
    int 0x80
