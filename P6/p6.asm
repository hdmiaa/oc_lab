section .text

    global _start

    _start:

    mov eax, 0x22446688     ;inciso a             
    extern pBin_dw          ;indica el procedimiento externo 
   
    mov al, 10              ;salto de linea
	call pBin_dw            ; imprime en binario 

    mov cx, 0x3F48


	mov eax, 1          ; sys_exit (termina el programa)
	int 0x80            ; Llamada al kernel