.LC0:
.string	":%d"
.globl	main
main:
pushl	%ebp
movl	%esp, %ebp
pushl	%edi
pushl	%esi
movl	$.LC0, %esi
pushl	%ebx
andl	$-16, %esp
subl	$16, %esp
movl	8(%ebp), %ebx
.L2:
addl	$1, %ebx
cmpl	$998, %ebx
jg	.L9
.L12:
movl	$2, %ecx
jmp	.L7
.L3:
movl	%edi, %ecx
.L7:
movl	%ebx, %eax
cltd
idivl	%ecx
leal	1(%ecx), %edi
testl	%edx, %edx
jne	.L3
cmpl	%edi, %ebx
jge	.L2
cmpl	$2, %ebx
movl	$.LC0+1, %eax
cmovg	%esi, %eax
movl	%ebx, 4(%esp)
addl	$1, %ebx
movl	%eax, (%esp)
call	printf
cmpl	$998, %ebx
jle	.L12
.L9:
leal	-12(%ebp), %esp
popl	%ebx
popl	%esi
popl	%edi
popl	%ebp
ret