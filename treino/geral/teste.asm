bits 64
default rel

extern printf
extern scanf

section .bss ; variáveis não inicializadas
    a:      resd 1  ; reserva para um float (4 bytes)
    b:      resd 1
    c:      resd 1
    temp:   resq 1  ; reserva para um double (8 bytes)

section .data ; variáveis inicializadas
str0: db "Entre com um float: ", 0
fmt: db "%f", 0
str1: db "A soma dos dois floats é: %f", 13, 10, 0

section .text ; código do programa
global main
main:
    ; Configuração do frame
    push rbp
    mov rbp, rsp

    ; printf("Entre com um float: ")
    mov rdi, str0
    mov rax, 0
    call printf

    ; scanf("%f", &a)
    mov rdi, fmt
    mov rsi, a
    mov rax, 0
    call scanf

    ; printf("Entre com outro float: ")
    mov rdi, str0
    mov rax, 0
    call printf

    ; scanf("%f", &b)
    mov rdi, fmt
    mov rsi, b
    mov rax, 0
    call scanf

    ; c = a + b
    fld dword [a]        ; carrega valor de a
    fld dword [b]        ; carrega valor de b
    fadd                 ; soma a + b
    fstp dword [c]       ; armazena resultado em c

    ; Converter c para double e armazenar em temp
    fld dword [c]
    fstp qword [temp]    ; guarda em temp como double

    ; printf("A soma dos dois floats é: %f\n", c)
    mov rdi, str1
    movq xmm0, qword [temp] ; move o double para xmm0 (utilizado pelo printf)
    mov rax, 1              ; um argumento de ponto flutuante
    call printf

    ; Encerramento do programa
    mov rsp, rbp
    pop rbp
    mov rax, 0
    ret

