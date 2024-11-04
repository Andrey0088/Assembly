.386
.model flat, stdcall
option casemap :none

include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.data
    num1 dd 3             ; primeiro número
    num2 dd 2             ; segundo número
    resultMessage db "A soma dos numeros e: ", 0
    buffer db 11 dup(0)   ; buffer para armazenar o resultado como string

.code
main:
    ; Soma os números
    mov eax, num1         ; carrega o valor de num1 em eax
    add eax, num2         ; soma o valor de num2 com eax
    mov ebx, eax          ; armazena o resultado em ebx para conversão

    ; Exibe o resultado
    invoke StdOut, addr resultMessage
    invoke dwtoa, ebx, addr buffer   ; converte o número para string
    invoke StdOut, addr buffer       ; imprime o resultado

    ; Finaliza o programa
    invoke ExitProcess, 0
end main
