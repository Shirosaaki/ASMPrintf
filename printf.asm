[bits 64]

section .text
global asmprintf
extern my_putstr
extern my_putnbr
extern my_putchar

asmprintf:
    mov rdi, rsi
    call my_putnbr
    ret