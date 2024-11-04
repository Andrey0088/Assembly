    section .bss
num1:  dd   3
num2:  dd   2


    section .data


    section .text
    global main

main:

    push rbp
    mov rbp, rsp

    mov eax, [num1]
    mov ebx, [num2]
    add eax,ebx

    mov [res],eax
    mov eax,0
    ret


    
