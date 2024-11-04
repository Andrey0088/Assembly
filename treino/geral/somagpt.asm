section .data
    prompt1 db "Digite o primeiro numero: ", 0
    prompt2 db "Digite o segundo numero: ", 0
    result_msg db "O resultado da soma e: ", 0
    newline db 10, 0

section .bss
    num1 resq 1      ; Use `resq` para alocar 8 bytes (64 bits) para 64-bit addressing
    num2 resq 1
    result resq 1

section .text
    global main
    extern printf, scanf

main:
    ; Print prompt1
    mov rcx, prompt1       ; RCX é usado para o primeiro argumento no Windows x64
    call printf

    ; Read num1
    mov rcx, "%d"          ; Formato de entrada
    mov rdx, num1          ; Buffer para o primeiro número
    call scanf

    ; Print prompt2
    mov rcx, prompt2
    call printf

    ; Read num2
    mov rcx, "%d"
    mov rdx, num2
    call scanf

    ; Load num1 e num2 e faça a soma
    mov rax, [num1]        ; Use registradores de 64 bits
    add rax, [num2]
    
    ; Salve o resultado
    mov [result], rax

    ; Exibir o resultado
    mov rcx, result_msg
    call printf
    mov rcx, "%d"
    mov rdx, [result]       ; Carrega o resultado para impressão
    call printf

    ; Finalizar
    mov eax, 0
    ret
