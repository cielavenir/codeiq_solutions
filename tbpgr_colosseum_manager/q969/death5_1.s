.LC0:
	.string	"fizz"
.LC1:
	.string	"FIZZBUZZ"
.LC2:
	.string	"%d"
.LC3:
	.string	"buzz"
	.globl	main
main:
	leal	4(%esp), %ecx
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	xorl	%ebx, %ebx
	pushl	%ecx
.L2:
	incl	%ebx
	cmpl	$51, %ebx
	je	.L12
	movl	%ebx, %eax
	movl	$15, %ecx
	cltd
	idivl	%ecx
	movl	$.LC1, %eax
	testl	%edx, %edx
	je	.L3
	movl	%ebx, %eax
	movb	$3, %cl
	cltd
	idivl	%ecx
	movl	$.LC0, %eax
	testl	%edx, %edx
	je	.L3
	movl	%ebx, %eax
	movb	$5, %cl
	cltd
	idivl	%ecx
	movl	$.LC3, %eax
	testl	%edx, %edx
	movl	$.LC2, %edx
	cmovne	%edx, %eax
.L3:
	pushl	%edx
	pushl	%edx
	pushl	%ebx
	pushl	%eax
	call	printf
	addl	$16, %esp
	jmp	.L2
.L12:
	leal	-8(%ebp), %esp
	popl	%ecx
	popl	%ebx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret