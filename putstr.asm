[bits 64]

section .text
global my_putstr

my_putstr:
    mov rsi, rdi
    mov r15, 0
    xor rdx, rdx
.count_length:
    cmp byte [rsi + rdx], 0
    je .done_counting
    cmp byte [rsi + rdx], '%'
    je .up
    inc rdx
    jmp .count_length
.up:
    inc r15
    inc rdx
    jmp .count_length
.done_counting:
    mov rax, 1
    mov rdi, 1
    syscall
    mov rax, r15
    ret
