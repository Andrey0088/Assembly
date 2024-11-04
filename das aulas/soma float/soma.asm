SECTION .data

a dq 6.25

c dq 0

SECTION .text

fld [a]   //usa "[]" pra pegar o conteúdo, já q o "a" é um ponteiro, 

fld [b]

fadd

fstp [c]