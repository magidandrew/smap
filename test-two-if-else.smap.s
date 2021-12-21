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
	movl	$5, 4(%rsp)
	movl	$6, (%rsp)
	movb	$1, %al
	testb	%al, %al
	jne	.LBB0_2
# %bb.1:                                # %if_body
	movl	$42, %edi
	jmp	.LBB0_3
.LBB0_2:                                # %else_body
	movl	$1, %edi
.LBB0_3:                                # %merge
	callq	printint@PLT
	movl	4(%rsp), %eax
	cmpl	(%rsp), %eax
	jge	.LBB0_5
# %bb.4:                                # %if_body5
	movl	$24, %edi
	jmp	.LBB0_6
.LBB0_5:                                # %else_body6
	movl	$2, %edi
.LBB0_6:                                # %merge7
	callq	printint@PLT
	xorl	%eax, %eax
	popq	%rcx
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

	.type	.LnewLine,@object       # @newLine
.LnewLine:
	.asciz	"\n"
	.size	.LnewLine, 2

	.type	.Lfmt,@object           # @fmt
.Lfmt:
	.asciz	"%d"
	.size	.Lfmt, 3

	.type	.Lfmt.1,@object         # @fmt.1
.Lfmt.1:
	.asciz	"%f"
	.size	.Lfmt.1, 3

	.section	".note.GNU-stack","",@progbits
