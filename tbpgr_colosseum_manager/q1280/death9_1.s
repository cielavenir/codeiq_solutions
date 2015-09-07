.globl	main
main:
push	%ebp
mov	%esp, %ebp
push	%esi
mov	$1321528399, %esi
push	%ebx
xor	%ebx, %ebx
and	$-16, %esp
sub	$16, %esp
A:
mov	%ebx, %eax
imul	%esi
mov	%ebx, %eax
sar	$31, %eax
sar	$3, %edx
sub	%eax, %edx
mov	%ebx, %eax
imul	$26, %edx, %edx
sub	%edx, %eax
mov	%ebx, %edx
and	$7, %edx
add	$97, %eax
cmp	$1, %edx
sbb	%edx, %edx
add	$1, %ebx
and	$32, %edx
sub	%edx, %eax
mov	%eax, (%esp)
call	putchar
cmp	$208, %ebx
jne	A
lea	-8(%ebp), %esp
pop	%ebx
pop	%esi
pop	%ebp
ret