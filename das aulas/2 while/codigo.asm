; #include<stdio.h>
; int a;
; int main(void){
; printf("Entre com o valor de a:");
; scanf("%d, &a);
; while(a > 0)
; {
; printf("%d ", a);
;  a--;
; }
; return 0;
;}

extern printf
extern scanf

section .bss
a: resd 1

section .data
str0: db "Entre com o velor de a:", 0
fmt: db "%d", 0
str1: db "%d ", 0


section .text
global main

main:
    push rbp
    mov rbp, rsp

    mov rdi, str0
    mov rax, 0
    call printf

    mov rdi,fmt
    mov rsi, a
    call scanf

INICIO_WHILE:
    mov ebx, [a]
    cmp ebx, 0
    jbe FIM_WHILE

    ;corpo do while
    mov rdi, str1
    xor rsi, rsi
    mov esi, [a]
    mov rax, 0
    call printf

    mov eax, [a]
    dec eax
    mov [a], eax
    jmp INICIO_WHILE


FIM_WHILE:
    leave
    mov rax, 0
    ret

nasm -f win64 -o codigo22.obj codigo22.asm
ld -o codigo22.exe codigo22.obj "C:\msys64\ucrt64\lib\libkernel32.a" "C:\msys64\ucrt64\lib\libmsvcrt.a"