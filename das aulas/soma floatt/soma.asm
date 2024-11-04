
extern printf
extern scanf

    section .bss ;variaveis nao inicializadas
    a:  resd 1  ;reserva pq ainda n foram inicializadas(ver L.2 em C)
    b:  resd 1
    c:  resd 1
    temp: resd 1 ;será usado apenas para imprimir o resultado

    section .data ; variaveis inicializadas
str0: db "Entre com outro float:",0
fmt: db "%f", 0
str1: db "A soma dos dois floats eh: %f", 13,10,0 ; os numeros 13,10,0 representam o "/n"

    section .text ;código do programa

    global main
main:
    push rbp
    mov rbp, rsp

   ; printf("Entre com um float: ")
    mov rdi, str0
    mov rax,0
    call printf
    ;scanf("%f", &a);
    mov rdi, fmt
    mov rsi, a
    call scanf

    ; printf("Entre com um float: ")
    mov rdi, str0
    mov rax,0
    call printf
    ;scanf("%f", &b);
    mov rdi, fmt
    mov rsi, b
    call scanf

    ; c = a+b;
    ; como faz a soma: colocar 1º o "a" na pilha
    fld dword[a] ; o "a" é double, nao float, então coloca dword
    fld dword[b]
    fadd ; o fadd soma 2 valores por vez, se vc for somar 3 valores, faz 3 fld e 2 fadd(pq soma os 2 primeiros e dps soma o resultado com o terceiro item)
    fstp dword [c]

    ; para fazer printf, precisa converter para double.

    fld dword [c]
    fstp qword [temp]

    ;printf("A soma dos dois")
    ; floats eh: %f/n". c);
    mov rdi, str1
    movq xmm0, qword [temp] ;vc fez temp = c, mas temp é qword(64bits), o xmm0 tem 128bits, se vc colocar só o mov, vai pegar 64 bits, por achar q vai pegar a partir de temp.
    mov rax,1 ;pq só tem 1 ponto flutuante
    call printf






    mov rsp, rbp
    pop rbp
    mov rax,0 ; return 0
    ret