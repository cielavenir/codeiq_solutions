s:
.string	"deathma colosseum"
.globl	main
main:
pushl	%ebp
movl	%esp, %ebp
pushl	%ebx
movl	$s, %ebx
andl	$-16, %esp
subl	$16, %esp
cmpb	$0, s
je	.L5
.L11:
movl	$62, (%esp)
call	putchar
cmpb	$0, (%ebx)
je	.L6
.L12:
movl	$43, (%esp)
call	putchar
subb	$1, (%ebx)
jne	.L12
.L6:
movl	$46, (%esp)
addl	$1, %ebx
call	putchar
cmpb	$0, (%ebx)
jne	.L11
.L5:
xorl	%eax, %eax
movl	-4(%ebp), %ebx
leave
ret