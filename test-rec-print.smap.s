	.text
	.file	"Smap"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$10, 4(%rsp)
	movl	$10, %edi
	callq	rec_print@PLT
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	rec_print               # -- Begin function rec_print
	.p2align	4, 0x90
	.type	rec_print,@function
rec_print:                              # @rec_print
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	%edi, (%rsp)
	decl	%edi
	movl	%edi, 4(%rsp)
	cmpl	$0, (%rsp)
	jle	.LBB1_2
# %bb.1:                                # %if_body
	movl	(%rsp), %edi
	callq	printint@PLT
	movl	4(%rsp), %edi
	callq	rec_print@PLT
.LBB1_2:                                # %merge
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	rec_print, .Lfunc_end1-rec_print
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

	.type	.Ltest.2,@object        # @test.2
.Ltest.2:
	.asciz	"test test test!\n"
	.size	.Ltest.2, 17

	.type	.Lfmt.3,@object         # @fmt.3
.Lfmt.3:
	.asciz	"%d\n"
	.size	.Lfmt.3, 4

	.type	.Lfmt.4,@object         # @fmt.4
.Lfmt.4:
	.asciz	"%f\n"
	.size	.Lfmt.4, 4

	.section	".note.GNU-stack","",@progbits
