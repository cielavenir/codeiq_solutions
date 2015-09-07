mov al,4
inc bl
mov ecx,$804806d
mov dl,12
int 128
db 'hello, world'