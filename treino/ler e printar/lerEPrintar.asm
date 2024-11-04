extern printf
extern scanf

    section .bss
a:  resd 1
b:  resd 1
c:  resd 1

    section .data
str0:   db  "Entre com o valor de a: ", 0
str1:   db  "Entre com o valor de b: ", 0
fmt: db "%d", 0


    secton .text
    GLOBAL main
main:
    push rbp
    mov rbp, rsp

    ;printf
    mov rdi, str0
    mov eax,0
    call printf

    ;scanf

    mov rdi, fmt
    mov rsi, a
    call scanf

    ;printf
    mov rdi, str0
    mov eax,0
    call printf

    ;scanf

    mov rdi, fmt
    mov rsi, b
    call scanf

    ;somar
    mov eax,a
    mov ebx,b
    add eax, ebx

    mov [c], eax
    mov eax,0
    ret


