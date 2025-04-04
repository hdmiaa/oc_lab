%include "../LIB/pc_iox.inc"

section	.text
	global _start      

_start:                     

	mov ebx, 0x5C4B2A60 ; Valor inicial en EBX (5C4B2A60)
	mov eax, 0x02210784   ;agrega un valor a eax (mi matricula)
	add ebx, eax 		; suma eax a ebx
	call pHex_dw        ; Muestra el valor de EBX en pantalla 

	mov al, 10          ; Cambio de línea 
	call putchar

	mov ax, bx 			; Coloca los 16 bits menos significativos en la pila
	call pHex_w

	mov al, 10          ; Cambio de línea 
	call putchar

	mov al, 8h   		; Numero a multiplicar
	mov bl, 60h			; mueve al a bl para multiplicar

	mul bl 				;hace la multiplicacion

	mov [N], ax 		;guarda el resultado de la multiplicacion
	call pHex_w

	mov al, 10          ; Cambio de línea 
	call putchar

	mov ax, [N]          ; Cargar el valor de N en AX
    inc ax               ; Incrementar AX en 1
    mov [N], ax          ; Guardar nuevamente en N

    call pHex_w          ; Mostrar el nuevo valor de N en pantalla

    mov al, 10           ; Cambio de línea 
    call putchar

	mov ax, 0xFF		;
	div bx
	
	call pHex_w

	mov al, 10
	call putchar

	mov ax, dx
	call pHex_w

	mov al, 10
	call putchar

	add [N], dx
	mov ax, [N]
	call pHex_w

	mov al, 10
	call putchar

	dec word [N]
	call pHex_w

	mov al, 10
	call putchar

	pop ax
	call pHex_w

	mov al, 10
	call putchar

	mov eax, 1          ; sys_exit (termina el programa)
	int 0x80            ; Llamada al kernel

	section .data
	N dw 0 
	
