[bits 64]

section .text
global my_putnbr
extern my_putchar

my_putnbr:
    cmp rdi, 0
    jge .positive_part
    mov r8, rdi
    mov rdi, '-'
    call my_putchar
    mov rdi, r8
    neg rdi

.positive_part:
    cmp rdi, 10
    jl .print_single_digit
    mov rax, rdi
    xor rdx, rdx
    mov rcx, 10
    div rcx
    push rdx
    mov rdi, rax
    call my_putnbr
    pop rax
    add al, '0'
    mov rsi, rax
    mov rdi, rax
    call my_putchar
    ret

.print_single_digit:
    add dil, '0'
    mov rsi, rdi
    call my_putchar
    ret
