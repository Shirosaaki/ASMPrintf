[bits 64]

section .text
global asmprintf
extern my_putstr
extern my_putnbr
extern my_putchar

asmprintf:
    mov r15, r10
    mov r10, rsi
    mov r11, rdx
    mov r12, rcx
    mov r13, r8
    mov r14, r9
    call my_putstr
    ret