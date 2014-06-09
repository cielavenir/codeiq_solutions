.globl main
main:
push %ebp
mov %esp,%ebp
mov $65,%ebx
A:
mov %ebx,(%esp)
call putchar
inc %ebx
cmp $122,%ebx
jle A
xor %eax,%eax
leave
ret