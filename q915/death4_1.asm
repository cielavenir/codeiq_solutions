bits 32
mov ecx,esp
inc edi
inc edi
inc ebx
inc edx
B:
mov byte [ecx],36
A:
mov al,4
int 128
add [ecx],edi
cmp dword [ecx],116
jle A
inc edi
inc edi
cmp edi,18
jnz B