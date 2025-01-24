section .data
hello: db "Hello world, version 2!", 10 ; 10 is \n
helloLen: equ $-hello

section .text
global _start

; from man 2 syscall, arguments to syscalls are passed in
; x86-64 rdi rsi rdx r10 r8 r9
; syscall numbers are obtained from
; https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/

_start:
mov rax, 1
mov rdi, 1
mov rsi, hello
mov rdx, helloLen
syscall

mov rax, 60
mov rdi, 0
syscall
