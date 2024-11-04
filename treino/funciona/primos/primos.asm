.386
.model flat, stdcall
option casemap :none

include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib


extern printf
extern scanf

.bss

    n resd 1
    count resd 1
    c resd 1

.data

    i dd 3
    str0 db "entre o numero de primos:",0
    fmt db "%d",0
    str1 db "os primeiros %d são:",0
    str2 db "2 ",0
    str3 db "%d ",0

.code
main:


    push rbp
    mov rbp,rsp

    mov rdi,str0
    mov rax,0
    call printf

    mov rdi, fmt
    mov rsi, n
    call scanf

    mov ebx,[n]
    cmp ebx,1
    jb FIM_IF_1

    mov rdi, str1
    xor rsi,rsi
    mov esi,[n]
    xor rax,rax
    call printf

    mov rdi, str2
    mov rax,0
    call printf

    FIM_IF_1:
    mov ebx,2
    mov [count],ebx

    INICIO_FOR_1:
    mov eax,[count]
    mov ecx,[n]
    cmp eax,ecx
    ja FIM_FOR_1

    mov eax,2
    mov [c],eax

    INICIO_FOR_2:

    mov ebx,[c]
    mov ecx,[i]
    dec ecx
    cmp ebx,ecx
    ja FIM_FOR_2

    xor edx,edx
    mov eax,[i]
    mov ecx,[c]
    div ecx
    cmp edx,0
    je FIM_FOR_2

    mov eax,[c]
    inc eax
    mov [c],eax
    je INICIO_FOR_2

    FIM_FOR_2:
    mov ebx,[c]
    mov ecx,[i]
    cmp ebx,ecx
    jne FIM_IF_2

    mov rdi,str3
    xor rsi,rsi
    mov esi,[i]
    mov rax,0
    call printf

    mov eax,[count]
    inc eax
    mov [count],eax

    FIM_IF_2:

    mov ebx,[i]
    inc ebx
    mov [i],ebx
    jmp INICIO_FOR_1

    FIM_FOR_1:
    mov rsp,rbp
    pop rbp
    mov rax,0
    ret

end main