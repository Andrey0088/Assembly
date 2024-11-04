extern printf
extern scanf

	section .bss
v0:	resd 1
a: 	resd 1
t:	resd 1
v:	resq 1

	section .data
str0: db "Entre com um v0: ",0
str1: db "Entre com um a: ", 0
str2: db "Entre com um t: ", 0
fmt: db "%f", 0
str3: db "A velocidade final é:: %f", 13,10,0

	section.text
	global main
main:
	push rbp
	mov rbp, rsp

	mov rdi,str0
	mov rax, 0 ;não imprime float
	call printf

	mov rdi, fmt
	mov rsi, v0
	call scanf

	mov rdi, str1
	mov rax,0 ; não imprime float
	call printf

	mov rdi, fmt
	mov rsi, a
	call scanf


	mov rdi, str2
	mov rax,0 ;  não imprime float
	call printf

	mov rdi, fmt
	mov rsi, t
	call scanf

	;agora vai fazer os cálculos


	fld dword [a]
	fld dword [t]
	fmul
	fld dword [v0]
	fadd
	fstp qword [v]

	mov rdi, str3 
	movq xmm0, qword [v]
	mov rax, 1
	call printf

	mov rdi, str