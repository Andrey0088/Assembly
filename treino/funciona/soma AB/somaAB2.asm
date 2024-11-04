.386
.model flat, stdcall
option casemap :none

include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.data
    num1 dd 3
    num2 dd 2
    res  dd 0

.code
main:
    mov eax, num1       ; carrega o valor de num1 em eax
    mov ebx, num2       ; carrega o valor de num2 em ebx
    add eax, ebx        ; soma eax e ebx, resultado em eax
    mov res, eax        ; armazena o resultado em res
    
    invoke ExitProcess, 0
end main
