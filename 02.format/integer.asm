section .data
    number dw 5687

section .bss
    print_buffer resb 16

section .text
    global _start

_start:
    mov eax, [number]             ; load number into eax
    lea edi, [print_buffer + 15]  ; address of end of buffer into edi (. writes right to left, not knowing number of digits req'd)
    mov byte [edi], 0x0A          ; load newline(?) into end of buffer

convert:
    xor edx, edx
    mov ecx, 10
    div ecx         ; divide the number in eax (instruction implicit) by ecx
    add dl, '0'     ; remainder in dl (0-9 fits in byte width) - next digit to prepare, offset from ascii '0'

    dec edi
    mov [edi], dl   ; load the ascii into the next byte

    test eax, eax   ; eax now contains quotient. If empty we can print
    jnz convert

    ;print to console
    mov eax, 4                      ; 'write' system call = 4
    mov ebx, 1                      ; file descriptor 1 = STDOUT
    lea ecx, [edi]                  ; address of start of integer string
    mov edx, [print_buffer + 16]    ; end of buffer
    sub edx, ecx                    ; substract start of string to retain length of string
    int 0x80


    ;exit cleanly
    mov eax, 1      ; syscall = 1, exii
    xor ebx, ebx   ; exit code = 0
    int 0x80
