extern printf
extern scanf

    section .bss
n: resd 1

    section .data

str0: db "Entre um inteiro:",0
fmt: db "%d",0
par: db "par", 13, 10, 0
impar: db "impar", 13, 10 ,0

    section .bss
    global main

main:
    ; prepara pilha(o ponteiro)
    push rbp
    mov rbp, rsp

    ; printf("Entre um inteiro: ")
    mov rdi, str0
    mov rax, 0
    call printf

    ; scanf para ler um inteiro.
    ; fmt : contém o formato "%d"
    ; n é o endereço onde vai armazenar o valor lido
    ; armazena o valor na variavel n
    mov rdi, fmt
    mov rsi, n
    call scanf

    ; verifica se impar ou par
    ; mova o valor de n para ecx
    ; divisão por 2: desloca o ecx para uma posição à direita
    ; após a divisão, o bit de menor valor indicará se o valor é ímpar ou par
    ; jc verifica se há um carry após deslocar, se houver, então é ímpar, e pula pro else.
    mov ecx, [n]
    shr ecx, 1
    jc else

    ; Bloco par
    ; se for par, executa essas linhas.
    ; carrega o endereço da string "par" para rdi e printa
    ; pula para fim_else para evitar executar o bloco else.
    mov rdi, par
    mov rax, 0
    call printf
    fmp fim_else

    ; bloco impar
else:
    ;carrega em rdi o endereço da string impar
    ;rax é definido como zero
    ;printf é chamado para exibir a palavra "impar"
    mov rdi, impar
    mov rax, 0
    call printf

    ; Finalização
    ; Este é o fim da função main. A pilha é restaurada para o estado original ao mover rbp para rsp e, em seguida, rbp é restaurado. 
    ; rax é definido como 0 para indicar sucesso, e ret retorna da função.

fim_else:
    mov rsp, rbp
    pop rbp
    mov rax, 0
    ret

;Resumo
; Este código pede ao usuário para inserir um número, verifica se é par ou ímpar usando um deslocamento de bits e um teste de "carry flag" (jc), e exibe "par" ou "impar" conforme o caso.