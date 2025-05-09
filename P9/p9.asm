section .text: 
    
    global suma     ;inciso a
    global strlen   ;inciso b
    global strchr   ;inciso c
    global getBit     ;inciso d
    global _start

_start: 

;int suma( int num1, int num 2)

suma:
    push ebp    
    mov ebp, esp

    mov eax, [ebp + 8]      ;num1
    mov ecx, [ebp + 12]     ;num2
    add eax, ecx            ;suma

    pop ebp
    ret   

;int strlen (char *str)

strlen: 
    push ebp 
    mov ebp, esp 

    mov eax, [ebp + 8]
    xor ecx, ecx

next:
    cmp byte [eax], 0
    je .fin
    inc eax
    inc ecx
    jmp .next

fin: 
    mov eax, ecx
    pop ebp 
    ret

;char *strchr( char *str, int c)

strchr: 
    push ebp 
    mov ebp, esp 

    mov eax, [ebp + 8]     ;puntero
    mov dl, [epb + 12]     ;caracter a buscar 

puntero:
    mov bl, [eax] 
    cmp bl, 0
    je  .sin_encontrar
    cmp bl, dl
    je .encontro
    inc eax
    jmp .puntero

encontro: 
    pop ebp     ;retorna lo encontrado 
    ret 


sin_encontar:
    xor eax, eax ;retorna cero 
    pop ebp 
    ret

;int getBit( int value, int numbit);

getBit: 
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
    mov ecx, [ebp + 12 ]
    mov edx, 1
    shl edx, cl
    and eax, ebx
    cmp eax, 0
    je fin
    mov eax, 1

fin:
    pop ebp
    ret

    mov eax, 1              ; syscall: exit
    int 0x80