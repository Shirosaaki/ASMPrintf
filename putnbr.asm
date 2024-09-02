[bits 64]

section .text
global my_putnbr

extern my_putchar

my_putnbr:
    ; Check if the number is less than 0
    cmp rdi, 0
    jge .positive_part      ; Jump if nb >= 0

    ; Handle negative numbers
    mov r8, rdi
    mov rdi, '-'            ; Load '-' into rsi (for my_putchar)
    call my_putchar         ; Print '-'
    mov rdi, r8

    ; Negate the number
    neg rdi

.positive_part:
    ; Check if the number is less than 10
    cmp rdi, 10
    jl .print_single_digit   ; If nb < 10, print directly

    ; Recursive call for numbers >= 10
    mov rax, rdi
    xor rdx, rdx             ; Clear rdx before division
    mov rcx, 10
    div rcx                  ; rax = rdi / 10, rdx = rdi % 10

    push rdx                 ; Save the remainder (last digit) on the stack
    mov rdi, rax             ; Prepare the argument for the recursive call
    call my_putnbr           ; Recursive call my_putnbr(nb / 10)

    pop rax                  ; Restore the remainder (last digit)
    add al, '0'              ; Convert digit to ASCII
    mov rsi, rax             ; Move the ASCII character to rsi
    mov rdi, rax
    call my_putchar          ; Print the last digit
    ret

.print_single_digit:
    add dil, '0'             ; Convert single digit to ASCII
    mov rsi, rdi             ; Move the ASCII character to rsi
    call my_putchar          ; Print the single digit
    ret
