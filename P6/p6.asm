%include "../LIB/pbin.o"

section .text

    global _start

    _start:

    mov eax, 0x22446688     ;inciso a
    ror eax, 8              ;Rotacion de derecha a izquierda
    cf 8
    pBin_dw                 ; imprime el valor de eax


    mov al, 10
	call putchar

	mov eax, 1          ; sys_exit (termina el programa)
	int 0x80            ; Llamada al kernel


