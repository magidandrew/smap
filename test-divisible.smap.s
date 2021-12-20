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
	movl	$10, 20(%rsp)
	movl	$20, 16(%rsp)
	movl	$20, %edi
	movl	$10, %esi
	callq	divisible@PLT
	movl	%eax, 12(%rsp)
	cmpl	$1, 12(%rsp)
	jne	.LBB0_2
# %bb.1:                                # %if_body
	leaq	.Lthe_str(%rip), %rdi
	callq	printstr@PLT
.LBB0_2:                                # %merge
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
	.asciz	"true"
	.size	.Lthe_str, 5

	.section	".note.GNU-stack","",@progbits
