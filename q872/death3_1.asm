bits 32
mov edi,65
A:
push edi
mov eax,4
mov ebx,1
mov ecx,esp
mov edx,1
int 128
add esp,4
inc edi
cmp edi,122
jle A
mov eax,1
mov ebx,0
int 128