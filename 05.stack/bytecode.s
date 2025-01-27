%ifndef BYTECODES
%define BYTECODES

    ; instruction pointer in R14
    ; stack in R15
    ; working regs
    ;   rax
    ;   rbx
    %macro bc_push_int 0
        mov rax, r14                    ; move opcode in rax
        mov rbx, 0x0000_ffff_ffff_ffff  ; move mask into rbx
        and rax, rbx                    ; remove opcode pattern from register
        s_push_reg rax
    %endmacro

    %macro bc_iadd 0
        s_pop rax
        s_pop rbx
        add rax, rbx
        s_push_reg rax
    %endmacro



    %macro s_pop 1
        mov %1, [r15]   ; retrieve top of stack
        add r15, 8      ; increment stack pointer
    %endmacro

    %macro s_push_reg 1
        sub r15, 8      ; decrement stack pointer
        mov [r15], %1   ; push %1 reg to top of stack
    %endmacro

%endif
