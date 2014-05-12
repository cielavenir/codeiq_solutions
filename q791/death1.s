	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB23:
	pushl	%ebp
.LCFI0:
	movl	%esp, %ebp
.LCFI1:
	andl	$-16, %esp
	subl	$32, %esp
	leal	28(%esp), %eax
	movl	%eax, (%esp)
# initialize esp+28 with "lds"
	movl	$0x73646c, 28(%esp)
# capitalize
	subb	$32, 28(%esp)
	subb	$32, 29(%esp)
	subb	$32, 30(%esp)
	call	puts
	xorl	%eax, %eax
	leave
.LCFI2:
	ret
.LFE23:
	.size	main, .-main
	.section	.eh_frame,"a",@progbits
.Lframe1:
	.long	.LECIE1-.LSCIE1
.LSCIE1:
	.long	0
	.byte	0x3
	.string	""
	.uleb128 0x1
	.sleb128 -4
	.uleb128 0x8
	.byte	0xc
	.uleb128 0x4
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x1
	.align 4
.LECIE1:
.LSFDE1:
	.long	.LEFDE1-.LASFDE1
.LASFDE1:
	.long	.LASFDE1-.Lframe1
	.long	.LFB23
	.long	.LFE23-.LFB23
	.byte	0x4
	.long	.LCFI0-.LFB23
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI2-.LCFI1
	.byte	0xc5
	.byte	0xc
	.uleb128 0x4
	.uleb128 0x4
	.align 4
.LEFDE1:
	.section	.note.GNU-stack,"",@progbits