%include "../LIB/pc_iox.inc"
section .text

    global _start

    _start:

    mov eax, 0x22446688     ;inciso a      
    ror eax, 1
    call pBin_dw  
   
    mov al, 10              ;salto de linea
	call putchar            

    mov cx, 0x3F48          ;inciso b
    shl cx, 3
    mov ax, cx
    call pBin_w

    mov al, 10              ;salto de linea
	call putchar            ; imprime en binario 


	mov eax, 1          ; sys_exit (termina el programa)
	int 0x80            ; Llamada al kernel