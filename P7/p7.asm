%include "../LIB/pc_iox.inc"

section .text
    global _start

_start:

inicio:    
	call getche

	cmp al, '0'
	jb inicio

	cmp al, '9'
	ja inicio        ; No cumple

    cmp al, '5'
    jb menor

mayor_igual:
    mov edx, msg_mayor   ; Mostrar "Mayor o igual a 5"
    call puts
    jmp fin

menor:
    mov edx, msg_menor  ; Mostrar "Menor a 5"
    call puts

fin:
    mov eax, 1
    int 0x80

section .data
msg_menor db 'Menor a 5',10,0
msg_mayor db 'Mayor o igual a 5',10,0