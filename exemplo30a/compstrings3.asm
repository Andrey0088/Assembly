  extern printf
  extern scanf
  extern strlen
  extern getchar
  
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
 str5     db "Entrei no if 1",13,10,0
 str6     db "*str1ptr = %c ; *str2ptr = %c",13,10,0
 str7     db "Entrei no if 3: %x %x",13,10,0
 str8     db "Encontrei caracter diferente.",13,10,0
 
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
    
   ;if (tam1 == tam2) // if_1 externo
   mov eax,[tam1]
   mov ebx, [tam2]
   cmp eax,ebx
   jne  else_1
if_1:
    mov rdi, str5
    mov rax,0
    call printf ; entrei no if 1
    
    ;str1ptr = string1;  // cachorra,0   cachorra,0
    ;str2ptr = string2;
    
    mov rax, string1
    mov [str1ptr], rax
    
    mov rax, string2 
    mov [str2ptr], rax
    
 
INICIO_WHILE:
     ; teste da condicao do while  
      ; *str1ptr != '\0' && 
     ;  *str2ptr != '\0' && iguais
     mov rcx, [str1ptr] ; rcx <- ponteiro para str1
     xor rax,rax ; para debug
     mov al, [rcx]  ; al <- caracter apontado pelo endereco em rcx
     cmp al, 0
     je  FIM_WHILE ; je e jz sao a mesma instrucao
     
    mov rcx, [str2ptr] ; rcx <- ponteiro para str2
    xor  rbx,rbx  ;  limpa rbx (para debug)
     mov bl, [rcx]  ; bl <- caracter apontado pelo endereco em rcx
     cmp bl, 0
     je  FIM_WHILE ; je e jz sao a mesma instrucao
     
     mov ecx, [iguais]
     cmp ecx, 1
     jne FIM_WHILE
     ; corpo do while     
     
     ;printf ("*str1ptr = %c ; *str2ptr = %c \n", *str1ptr , *str2ptr);
     mov rdi,str6
     mov rsi, rax  ; rax contem al
     mov rdx, rbx  ; rbx contem bl
     mov rax, 0
     call printf
    
     call getchar ; pausar o programa
         ; if (*str1ptr == *str2ptr ) // if_2
     IF_2: 
        ; *str1ptr == *str2ptr 
        mov rcx, [str1ptr] ; o conteudo de str1ptr eh um endereco
        xor  rax, rax ; zera todo o rax , pois al eh parte de rax
        mov  al , [rcx] ; peguei o conteudo do endereco str1ptr
        ; al = *str1ptr
        mov rcx, [str2ptr]
        xor rbx, rbx ; por que zerar o rbx? ==> pra debug
        mov bl , [rcx] 
        ; bl = *str2ptr
        cmp al,bl
        jne  ELSE_2
         ;  corpo do if
        ; printf ("Entrei no if 3: %x %x \n", str1ptr , str2ptr);
         mov rdi, str7
         mov rsi, [str1ptr]
         mov rdx, [str2ptr]
         mov rax,0
        call printf 

      ;   str1ptr++;
       ; str2ptr++;
      
        mov rcx, [str1ptr]
        inc rcx
        mov [str1ptr], rcx ; 64 bits
     
         mov rcx, [str2ptr]
         inc rcx
         mov [str2ptr], rcx ;
        jmp FIM_IF_2
     ELSE_2:
         ; corpo do else 
         mov rdi, str8
         mov rax, 0
         call printf

         mov  eax,0
         mov [iguais], eax

     FIM_IF_2:

     jmp INICIO_WHILE
FIM_WHILE:
    
    
    
    jmp fim_if_1
else_1:
    mov rdi, str4
    mov rax,0
    call printf ; as strings sao diferentes 2
fim_if_1:
    leave
    mov rax,0
    ret  ; retorno da main
    
