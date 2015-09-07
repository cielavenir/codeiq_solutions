C:
.string ""
.globl main
main:
push %ebp
mov %esp,%ebp
sub $16,%esp
movl $C,4(%esp)
movl $0,(%esp)
call setlocale
L7:
movl $0,j
xor %eax,%eax
L1:
mov i,%edx
L4:
add x(,%eax,4),%edx
mov %edx,(%esp)
call putwchar
mov j,%eax
inc %eax
cmp $7,%eax
mov %eax,j
jle L1
mov i,%eax
lea 1(%eax),%edx
cmp $25,%edx
mov %edx,i
jle L7
leave
ret
.comm j,4,4
.comm i,4,4
x:
.long 97
.long 65
.long 12354
.long 12450
.long 12450
.long 12354
.long 65
.long 97