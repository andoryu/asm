section .data
    message:    db "Hello, World", 0
    fmt:        db "%s : %d. Pi = %f", 10, 0
    fnum:       dq 3.14159

section .text
    default rel
    extern printf
    global main

main:
    ; Create a stack-frame, re-aligning the stack to 16-byte alignment before calls
    push rbp

    lea	rdi, [fmt]
    lea	rsi, [message]
    mov rdx, 123
    pxor xmm0, xmm0
    movsd xmm0, qword [fnum]
    mov	rax, 1          ; set number of float variables in vargs list.

    ; Call printf
    call printf wrt ..plt

    pop	rbp		; Pop stack

    mov	rax,0	; Exit code 0
    ret			; Return
