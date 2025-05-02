%include "../LIB/pc_iox.inc"

section .text
    global _start

_start:
    bucle:
	call getche

	cmp al, '0'
	jb bucle
	cmp al, '9'
	ja bucle

	sub al, '0'
	mov cl, al

	mov al, 10
	call putchar

loop:
	cmp cl, 0
	je fin

	mov al, '*'
	call putchar

	dec cl
	jmp loop

    fin:
    mov eax, 1
    int 0x80