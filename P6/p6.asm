%include "../LIB/pc_iox.inc"
section .text

    global _start

    _start:

    mov eax, 0x22446688     ;inciso a      
    ror eax, 4
    call pBin_dw  
   
    mov al, 10              ;salto de linea
	call putchar            

    mov eax, 0x22446688     ;inciso a      
    ror eax, 4
    call pHex_dw  
   
   mov al, 10              ;salto de linea
   call putchar            ; imprime en binario 

    mov cx, 0x3F48          ;inciso b
    shl cx, 3
    mov ax, cx
    call pBin_w


    mov al, 10              ;salto de linea
	call putchar            ; imprime en binario 

    mov cx, 0x3F48          ;inciso b
    shl cx, 3
    mov ax, cx
    call pHex_w

    mov al, 10              ;salto de linea
    call putchar            ; imprime en binario 

    mov ESI, 0x20D685F3        ;inciso C 
    mov eax, ESI
    call pBin_dw

    mov al, 10
    call putchar

    xor ESI, 0x40042021     ; enmascaramiento 
    mov eax, ESI
    call pBin_dw

    mov al, 10
    call putchar

    push ESI    ;Guarda esi en la pila / inciso d

    mov ch, 0xA7        ;inciso e
    mov al, ch
    call pBin_b

    mov al, 10
    call putchar

    or ch, 0x48
    mov al, ch
    call pBin_b

    mov al, 10
    call putchar

    mov bp, 0x67DA  ;inciso f
    mov ax, bp
    call pBin_b

    mov al, 10
    call putchar

    and bp, 0xBBAD
    mov ax, bp
    call pBin_b

    mov al, 10
    call putchar

    sar bp, 3       ;inciso g
    mov ax, bp
    call pBin_w

    mov al, 10
    call putchar

    sar ebx, 5      ;inciso h
    mov eax, ebx
    call pBin_dw

    mov al, 10
    call putchar

    sal cx, 3       ; inciso i
    mov ax, cx
    call pBin_w

    mov al, 10
    call putchar 

    pop ESI     ;inciso j

    mov eax, ESI    ;inciso k
    sal eax, 3  
    call pBin_dw

    mov al, 10
    call putchar

    sal ESI, 1
    call pBin_dw

    add eax, ESI
    call pBin_dw

    mov al, 10
    call putchar

	mov eax, 1          ; sys_exit (termina el programa)
	int 0x80            ; Llamada al kernel