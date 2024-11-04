    section .bss
a:   dd  30
b:   dd  70
c:   dd  99
soma:   dd  00

    section .data

    section .text
    global main

main:

    push rbp
    mov rbp, rsp

    ;eax = a+b
    mov eax, [a]
    mov ebx, [b]
    mov ecx, [c]
    add eax,ebx
    sub eax, ecx
    add eax,[a]

    mov [soma],eax
    print_udec 4,eax
    mov eax, 0
    ret