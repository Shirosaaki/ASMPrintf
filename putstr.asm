[bits 64]
section .text
global my_putstr
extern my_putchar
extern my_putnbr

my_putstr:
    mov rsi, rdi
    mov rdx, 0
    mov r8, r11
.count_length:
    cmp byte [rsi + rdx], 0
    je .done_counting
    cmp byte [rsi + rdx], '%'
    je .up
    push rsi
    push rdx
    mov rdi, [rsi + rdx]
    call my_putchar
    pop rsi
    pop rdx
    inc rdx
    jmp .count_length

.up:
    inc rdx
    cmp byte [rsi + rdx], 'd'
    je .print_nb
    cmp byte [rsi + rdx], 's'
    je .print_str
    cmp byte [rsi + rdx], 'c'
    je .print_char
    cmp byte [rsi + rdx], 'i'
    je .print_nb
    jmp .count_length

.print_nb:
    push rsi
    push rdx
    mov rdi, r10
    call my_putnbr
    pop rsi
    pop rdx
    inc rdx
    jmp .change_params

.print_str:
    push rsi
    push rdx
    mov rdi, r10
    call my_putstr
    pop rsi
    pop rdx
    inc rdx
    jmp .change_params

.print_char:
    push rsi
    push rdx
    mov rdi, r10
    call my_putchar
    pop rsi
    pop rdx
    inc rdx
    jmp .change_params

.done_counting:
    ret

.change_params:
    mov r11, r8
    mov r10, r11
    mov r11, r12
    mov r8, r11
    mov r12, r13
    mov r13, r14
    mov r14, r15
    jmp .count_length
