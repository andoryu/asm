%ifndef PRINTS
%define PRINTS

    %macro lc_puts 1
        push rbp
        lea rdi, [%1]
        call puts wrt ..plt
        pop rbp
    %endmacro

    %macro lc_printf_int 2
        push rbp
        lea	rdi, [%1]
        mov	rsi, %2
        xor rax, rax
        call printf wrt ..plt
        pop rbp
    %endmacro

    %macro lc_printf_name_int 3
        push rbp
        lea	rdi, [%1]
        lea	rsi, [%2]
        mov rdx, %3
        xor rax, rax
        call printf wrt ..plt
        pop rbp
    %endmacro

%endif
