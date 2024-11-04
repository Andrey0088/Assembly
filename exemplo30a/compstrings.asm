  extern printf
  extern scanf
  extern strlen
  
 section .data
 strptr  dq  0 ; ponteiro tem 64 bits
 len     dd  0 ;  len e inteiro
 string1  db "                              ",0
 string2  db  "                              ",0
 str1ptr  dq  0
 str2ptr  dq  0
 tam1     dd  0 ; inteiro
 tam2     dd  0 ; inteiro
 iguais   dd  1;  inteiro
 str0     db "Entre com a string:",13,10,0
 str1     db "%s",0
 str2     db "As strings sao iguais",13,10,0
 str3     db "As strings sao diferentes 1",13,10,0
 str4     db "As strings sao diferentes 2",13,10,0
 
 
 section .code
global main
main:
    push rbp ; empilha a base da pilha
    mov rbp,rsp ; base da nova pilha = topo da pilha antiga

    ; printf ("Entre com a string: \n");
    mov rdi, str0
    mov rax,0 ; náo tem pontos flutuantes
    call printf
    
    ;scanf("%s", string1);
    mov rdi, str1
    mov rsi, string1 ; lea rsi, [string1]
    mov rax,0 ; náo tem ponstos flutuantes
    call scanf 
    
    ; tam1 = str_len2(string1);
    mov rdi, string1
    ;call str_len2  ; retorno em eax ou rax
    call strlen
    mov [tam1], eax 
    
 
    ; printf ("Entre com a string: \n");
    mov rdi, str0
    mov rax,0 ; náo tem pontos flutuantes
    call printf
    
    ;scanf("%s", string2);
    mov rdi, str1
    mov rsi, string2 ; lea rsi, [string2]
    mov rax,0 ; náo tem ponstos flutuantes
    call scanf 
    
    ; tam1 = str_len2(string2);
    mov rdi, string2
   ;  call str_len2  ; retorno em eax ou rax
    call strlen
    mov [tam2], eax 
