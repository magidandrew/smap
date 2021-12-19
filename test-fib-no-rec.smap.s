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
	movl	$3, 12(%rsp)
	movl	$10, 20(%rsp)
	movl	$0, 16(%rsp)
	movl	$1, 8(%rsp)
	movl	$1, 4(%rsp)
	xorl	%edi, %edi
	callq	printint@PLT
	movl	8(%rsp), %edi
	callq	printint@PLT
	movl	$3, 12(%rsp)
	.p2align	4, 0x90
.LBB0_1:                                # %while
                                        # =>This Inner Loop Header: Depth=1
	movl	12(%rsp), %eax
	cmpl	20(%rsp), %eax
	jg	.LBB0_3
# %bb.2:                                # %while_body
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	4(%rsp), %edi
	callq	printint@PLT
	movl	8(%rsp), %eax
	movl	%eax, 16(%rsp)
	movl	4(%rsp), %ecx
	movl	%ecx, 8(%rsp)
	addl	%eax, %ecx
	movl	%ecx, 4(%rsp)
	incl	12(%rsp)
	jmp	.LBB0_1
.LBB0_3:                                # %merge
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

	.section	".note.GNU-stack","",@progbits
