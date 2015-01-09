.globl	main
main:
xorl	%eax, %eax
.L3:
movb	$65, s(%eax)
addl	$1, %eax
cmpl	$25, %eax
jne	.L3
pushl	%ebp
movl	%esp, %ebp
pushl	%ebx
xorl	%ebx, %ebx
andl	$-16, %esp
subl	$16, %esp
.L5:
movzbl	s(%ebx), %eax
movl	$s, (%esp)
leal	1(%eax,%ebx), %eax
movb	%al, s(%ebx)
call	puts
movl	%ebx, %eax
notl	%eax
addb	%al, s(%ebx)
addl	$1, %ebx
cmpl	$25, %ebx
jne	.L5
movl	-4(%ebp), %ebx
leave
ret
.size	main, .-main
.comm	s,25,1