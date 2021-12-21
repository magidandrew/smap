	.text
	.file	"Smap"
	.globl	testReturn              # -- Begin function testReturn
	.p2align	4, 0x90
	.type	testReturn,@function
testReturn:                             # @testReturn
	.cfi_startproc
# %bb.0:                                # %entry
	movl	$5, %eax
	retq
.Lfunc_end0:
	.size	testReturn, .Lfunc_end0-testReturn
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	testReturn@PLT
	movl	%eax, %edi
	callq	printint@PLT
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
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

	.type	.Ltest.2,@object        # @test.2
.Ltest.2:
	.asciz	"test test test!\n"
	.size	.Ltest.2, 17

	.type	.LnewLine.3,@object     # @newLine.3
.LnewLine.3:
	.asciz	"\n"
	.size	.LnewLine.3, 2

	.type	.Lfmt.4,@object         # @fmt.4
.Lfmt.4:
	.asciz	"%d"
	.size	.Lfmt.4, 3

	.type	.Lfmt.5,@object         # @fmt.5
.Lfmt.5:
	.asciz	"%f"
	.size	.Lfmt.5, 3

	.section	".note.GNU-stack","",@progbits
