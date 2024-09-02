[bits 64]

section .text
global my_putchar

my_putchar:
    push rdi
    push rsi

    mov rax, 1
    mov rsi, rsp
    mov byte [rsi], dil
    mov rdi, 1
    mov rdx, 1
    syscall

    pop rsi
    pop rdi

    ret