.globl main
main:
lea 4(%esp), %ecx
and $-16, %esp
push -4(%ecx)
push %ebp
mov %esp, %ebp
push %esi
mov $2, %esi
push %ebx
push %ecx
sub $12, %esp
A:
mov $36, %ebx
B:
sub $12, %esp
push %ebx
add %esi, %ebx
call putchar
add $16, %esp
cmp $116, %ebx
jle B
add $2, %esi
cmp $18, %esi
jne A
lea -12(%ebp), %esp
pop %ecx
pop %ebx
pop %esi
pop %ebp
lea -4(%ecx), %esp
ret