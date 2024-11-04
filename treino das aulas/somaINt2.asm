extern printf
extern scanf

    section .bss
a : resd 1
b : resd 1
c : resd 1

    section .data
str0: dword "Entre com um inteiro", 0, 13,10,10
fmt: "%d"

    section .text
    global main

main:
    push rbp
    mov rbp, rsp

    ; printf
    mov rsi, str0
    mov rax,0
    call printf

    ; scanf
    mov rdi, fmt
    mov rdi, [a]
    call scanf

    ; printf
    mov rsi, str0
    mov rax,0
    call printf

    ; scanf
    mov rdi, fmt
    mov rdi, [b]
    call scanf

    ; somar

    mov rdi, [a]
    mov rbx, [b]
    add rdi, rbx
    fstp [c]

    ;printf
    mov rdi, [c]
    mov rax, 0
    call printf

    ret


