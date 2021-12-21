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
	movl	$1, %edi
	callq	printb@PLT
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
