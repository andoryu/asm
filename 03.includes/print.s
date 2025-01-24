%ifndef PRINTS
%define PRINTS

    %include "syscalls.s"

    section data
        print_buffer_len equ 16

    section .bss
        print_buffer resb print_buffer_len



    %macro print_integer 1

            mov eax, %1                                 ; load number into eax
            lea edi, [print_buffer + print_buffer_len]  ; address of end of buffer into edi (. writes right to left, not knowing number of digits req'd)

        convert:
            xor edx, edx
            mov ecx, 10     ; base 10 decomposition
            div ecx         ; divide the number in eax (instruction implicit) by ecx
            add dl, '0'     ; remainder in dl (0-9 fits in byte width) - next digit to prepare, offset from ascii '0'

            dec edi
            mov [edi], dl   ; load the ascii into the next byte

            test eax, eax   ; eax now contains quotient. If empty we can print
            jnz convert

            ; print to console
            lea ecx, [edi]                             ; address of start of integer string
            mov edx, [print_buffer + print_buffer_len] ; end of buffer
            sub edx, ecx                               ; substract start of string to retain length of string
            write_stdout
    %endmacro


    %macro print_nl 0
        lea ecx, [print_buffer]
        mov byte [ecx], 10
        lea edx, 1
        write_stdout
    %endmacro
%endif
