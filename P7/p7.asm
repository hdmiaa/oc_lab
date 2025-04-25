%include "../LIB/libpc_iox.a"

section .text
    global _start

_start:
    call getche         ; Captura un carácter 
    mov bl, al          ; Guardamos el carácter en BL

    cmp bl, '0'
    jb fin              ; No cumple
    cmp bl, '9'
    ja fin              ; No cumple

    cmp bl, '5'
    jb menor

mayor_igual:

    mov esi, msg_mayor   ; Mostrar "Mayor o igual a 5"
    call puts
    jmp fin

menor:

    mov esi, msg_menor  ; Mostrar "Menor a 5"
    call puts

fin:
    mov eax, 1
    int 0x80

section .data
msg_menor db 'Menor a 5',10,0
msg_mayor db 'Mayor o igual a 5',10,0


;Inciso a
;Secuencia que sea un caracter en el rango de '0' a '9' e indique mediante mensaje en 
;panatalla si el caracter capturado es menor a 5, usar getche para capturar el caracter