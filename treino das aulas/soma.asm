extern printf
extern scanf

    section .bss ; variáveis não inicializadas
    a:  resd 1  ; reserva espaço para 'a' (float), pois ainda não foi inicializada
    b:  resd 1  ; reserva espaço para 'b' (float)
    c:  resd 1  ; reserva espaço para 'c' (float), que será o resultado da soma
    temp: resd 1 ; espaço temporário usado para armazenar o resultado formatado para impressão

    section .data ; variáveis inicializadas
str0: db "Entre com outro float:", 0 ; mensagem para solicitar o float
fmt: db "%f", 0 ; formato para leitura de float
str1: db "A soma dos dois floats eh: %f", 13,10,0 ; mensagem para exibir o resultado da soma, com "\n" ao final (13,10,0)

    section .text ; código do programa

    global main
main:
    push rbp
    mov rbp, rsp

   ; printf("Entre com um float: ")
    mov rdi, str0 ; passa o endereço de 'str0' como argumento para printf
    mov rax, 0 ; alinha rax conforme a convenção de chamada
    call printf ; chama printf para exibir a mensagem de entrada

    ; scanf("%f", &a);
    mov rdi, fmt ; passa o formato ("%f") para scanf
    mov rsi, a ; endereço de 'a' como argumento para armazenar o primeiro float
    call scanf ; lê o float e armazena-o em 'a'

    ; printf("Entre com outro float: ")
    mov rdi, str0 ; passa novamente o endereço de 'str0' para exibir a mensagem de entrada
    mov rax, 0
    call printf ; chama printf para exibir a mensagem de entrada

    ; scanf("%f", &b);
    mov rdi, fmt ; formato ("%f") para scanf
    mov rsi, b ; endereço de 'b' para armazenar o segundo float
    call scanf ; lê o segundo float e armazena em 'b'

    ; c = a + b;
    ; realiza a soma: primeiro coloca 'a' na pilha de ponto flutuante
    fld dword [a] ; carrega 'a' como float (usando dword pois é 32 bits)
    fld dword [b] ; carrega 'b' no topo da pilha de ponto flutuante
    fadd ; soma os dois valores no topo da pilha
    fstp dword [c] ; armazena o resultado da soma em 'c' e remove-o da pilha

    ; para exibir o valor de 'c', converte-o para double
    fld dword [c] ; carrega 'c' novamente
    fstp qword [temp] ; armazena em 'temp' como um double de 64 bits

    ; printf("A soma dos dois floats eh: %f\n", c);
    mov rdi, str1 ; passa a mensagem 'str1' para printf
    movq xmm0, qword [temp] ; carrega 'temp' (resultado da soma) para xmm0, usado por printf para ponto flutuante
    mov rax, 1 ; informa que só há um argumento float para printf
    call printf ; exibe o resultado

    ; finalização da função main
    mov rsp, rbp ; restaura o ponteiro da pilha
    pop rbp ; restaura o quadro de pilha anterior
    mov rax, 0 ; retorna 0 (sucesso)
    ret ; retorna da função main
