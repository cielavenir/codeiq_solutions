mov al,4
inc bl
mov ecx,M
mov dl,L
int 128
mov al,1
xor ebx,ebx
int 128
M db 'ガールフレンドめっちゃほしい！',10
L equ $-M