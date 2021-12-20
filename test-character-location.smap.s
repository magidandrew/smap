	.text
	.file	"Smap"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$10, 4(%rsp)
	leaq	.Lthe_str(%rip), %rdi
	movq	%rdi, 16(%rsp)
	leaq	.Lthe_str.2(%rip), %rsi
	movq	%rsi, 8(%rsp)
	callq	characterLocation@PLT
	movl	%eax, (%rsp)
	movl	%eax, %edi
	callq	printint@PLT
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.Ltest,@object          # @test
	.section	.rodata.str1.1,"aMS",@progbits,1
.Ltest:
	.asciz	"test test test!\n"
	.size	.Ltest, 17

	.type	.Lfmt,@object           # @fmt
.Lfmt:
	.asciz	"%d\n"
	.size	.Lfmt, 4

	.type	.Lfmt.1,@object         # @fmt.1
.Lfmt.1:
	.asciz	"%f\n"
	.size	.Lfmt.1, 4

	.type	.Lthe_str,@object       # @the_str
.Lthe_str:
	.asciz	"hello"
	.size	.Lthe_str, 6

	.type	.Lthe_str.2,@object     # @the_str.2
.Lthe_str.2:
	.asciz	"e"
	.size	.Lthe_str.2, 2

	.section	".note.GNU-stack","",@progbits
