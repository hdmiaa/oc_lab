%include "../LIB/pc_iox.inc"

section .text
    global _start

_start:

inicio:
    call getche         ; Captura un carácter 

    cmp al, '0'
    jb inicio
    cmp al, '9'
    jbe numero       ; Si es entre '0' y '9', es número

    cmp al, 'A'
    jb inicio
    cmp al, 'Z'
    jbe letra        ; Si es entre 'A' y 'Z', es letra

numero:
    mov edx, msg_num
    call puts
    jmp fin

letra:
    mov edx, msg_letra
    call puts

fin:
    mov eax, 1
    int 0x80

section .data
msg_num db 'Es numero', 10, 0
msg_letra db 'Es letra', 10, 0