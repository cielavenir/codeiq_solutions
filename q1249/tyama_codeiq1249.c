main(i,c){if(~(c=getchar()))main(0),putchar(c&0337),putchar(i?012:040);}
/*
◆タイトル（必須）
main再帰
◆使用言語（必須）
Assembler (gcc-4.8.1)
◆プログラム（必須）
.globl	main
main:
push	%ebp
mov	%esp,%ebp
push	%ebx
sub	$16,%esp
call	getchar
cmp	$-1,%eax
mov	%eax,%ebx
je	A
and	$223,%ebx
movl	$0,(%esp)
call	main
mov	%ebx,(%esp)
call	putchar
cmp	$1,8(%ebp)
sbb	%eax,%eax
and	$22,%eax
add	$10,%eax
mov	%eax,(%esp)
call	putchar
A:
mov	-4(%ebp),%ebx
leave
ret
◆ポイント（必須）
・main()は第1引数が1になることを利用し、1文字目かどうかのフラグとして利用します。
・toupper()関数や文字定数を使わず、数値のみで操作しているのがポイントです。
・元は次のCプログラムです(数値は難読化のため8進数)。
※
しかし、あまり面白くなかったので、gcc -m32 -O2 -Sしたものを適当に削って出すことにしました
(300文字制限のため、-O2は必要でした)。
◆フリーコメント（任意）
掲載を狙うとなると難しくなりますね…。
*/