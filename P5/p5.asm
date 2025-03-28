%include "../LIB/pc_iox.inc"

section	.text
	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point

	mov ebx, 0x5C4B2A60 ; Valor inicial en EBX (5C4B2A60)
	mov eax, 0x02210784   
	add eax, ebx 
	call pHex_dw        ; Muestra el valor de EBX en pantalla 

	mov al, 10          ; Cambio de línea (ASCII 10 = '\n')
	call putchar

	mov eax, 1          ; sys_exit (termina el programa)
	int 0x80            ; Llamada al kernel