%ifndef SYSCALLSS
%define SYSCALLSS

    %macro exit 1
        mov eax, 1  ; 'exit', syscall = 1
        mov ebx, %1 ; exit code in parameter 1
        int 0x80
    %endmacro

    ;
    ; expects
    ;  - ecx : string pointer
    ;  - edx : string length
    %macro write_stdout 0
        mov eax, 4 ; 'write' system call = 4
        mov ebx, 1 ; file descriptor 1 = STDOUT
        int 0x80
    %endmacro

%endif
