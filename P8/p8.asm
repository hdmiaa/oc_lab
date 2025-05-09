%include "../LIB/pc_iox.inc"

section .bss
    vector   resb 10         ; espacio para 10 bytes
    vector1  resb 10         ; primer vector
    vector2  resb 10         ; segundo vector

section .text
    global _start

_start:

; Inciso A: Captura de 10 dígitos (0–9) en vector

    mov ecx, 10              ; número de elementos
    mov ebx, vector          ; puntero base al vector
    xor esi, esi             ; índice = 0

captura:
    call getche              ; carácter capturado en AL
    cmp al, '0'
    jb captura               ; si < '0', repetir
    cmp al, '9'
    ja captura               ; si > '9', repetir

    sub al, '0'              ; convertir ASCII a número binario
    mov [ebx + esi], al
    inc esi
    loop captura

; Inciso B: Mostrar vector en hexadecimal

    mov ecx, 10              ; 10 elementos
    mov ebx, vector
    xor esi, esi
    
    mov al, 10
    call putchar

mostrar_vector:
    mov al, [ebx + esi]
    call pHex_n              ; mostrar en hexadecimal
    inc esi
    loop mostrar_vector

; Inciso C: Captura de dos vectores, suma y muestra

    mov al, 10
    call putchar

    ; Captura de vector1
    mov ecx, 10
    mov ebx, vector1
    xor esi, esi

captura_v1:
    call getche
    cmp al, '0'
    jb captura_v1
    cmp al, '9'
    ja captura_v1
    sub al, '0'
    mov [ebx + esi], al
    inc esi
    loop captura_v1

    mov al, 10
    call putchar

    ; Captura de vector2
    mov ecx, 10
    mov edx, vector2
    xor esi, esi

captura_v2:
    call getche
    cmp al, '0'
    jb captura_v2
    cmp al, '9'
    ja captura_v2
    sub al, '0'
    mov [edx + esi], al
    inc esi
    loop captura_v2

    ; Suma
    mov ecx, 10
    xor esi, esi
    mov ebx, vector1
    mov edx, vector2

suma_vectores:
    mov al, [ebx + esi]
    add al, [edx + esi]
    mov [ebx + esi], al
    inc esi
    loop suma_vectores

    mov al, 10
    call putchar

    ; Mostrar resultado (vector1)
    mov ecx, 10
    mov ebx, vector1

mostrar_suma:
    mov al, byte [ebx]
    call pHex_n               ; mostrar número en formato hexadecimal
    inc ebx
    loop mostrar_suma

; Salida del programa

    mov eax, 1              ; syscall: exit
    int 0x80
