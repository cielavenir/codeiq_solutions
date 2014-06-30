; 552pts
bits 32
push 65
mov ecx,esp
inc ebx
inc edx
A:
mov al,4
int 128
inc byte [ecx]
cmp byte [ecx],123
jl A