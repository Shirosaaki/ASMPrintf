[bits 64]

section .text
global my_putchar

my_putchar:
    push rdi
    push rsi

    ; Préparation de l'appel système
    mov rax, 1          ; numéro de l'appel système `write`
    mov rsi, rsp        ; on utilise la pile pour stocker le caractère
    mov byte [rsi], dil ; place le caractère dans la mémoire
    mov rdi, 1          ; descripteur de fichier `stdout`
    mov rdx, 1          ; taille du buffer (1 octet)
    syscall             ; appel système `write`

    ; Restauration des registres
    pop rsi
    pop rdi

    ret