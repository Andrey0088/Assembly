section .data
    str0 db "Escreva um numero:", 10, 0   ; Adicione uma quebra de linha para garantir que a saída seja visível

section .text
    extern printf
    extern exit
    global _start

_start:
    ; Imprime a string usando printf
    mov rdi, str0      ; primeiro argumento (string) para printf
    xor rax, rax       ; definir número de variáveis de ponto flutuante para printf (não utilizado)
    call printf

    ; Chama exit da biblioteca C para sair do programa
    mov rdi, 0         ; código de saída 0
    call exit
