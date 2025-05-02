%include "../LIB/pc_iox.inc"

section .text
    global _start

_start:
    call getche
    mov al, cx        

print_asteriscos:
    cmp cx, 0
    je fin
    mov al, '*'
    call putc
    loop print_asteriscos

    ; Salto de línea
    mov al, 10
    call putc

fin:
    mov eax, 1
    int 0x80