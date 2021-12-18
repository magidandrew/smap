	.text
	.file	"Smap"
	.globl	takeDummy               # -- Begin function takeDummy
	.p2align	4, 0x90
	.type	takeDummy,@function
takeDummy:                              # @takeDummy
	.cfi_startproc
# %bb.0:                                # %entry
	movl	%esi, -8(%rsp)
	movq	%rdi, -16(%rsp)
	movl	$5, %eax
	retq
.Lfunc_end0:
	.size	takeDummy, .Lfunc_end0-takeDummy
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	leaq	.Ltest.2(%rip), %rbx
	movq	%rbx, %rdi
	movl	$16, %esi
	callq	testMakeStruct@PLT
	movq	%rax, %rdi
	movl	%edx, %esi
	callq	takeDummy@PLT
	movq	%rbx, %rdi
	movl	$16, %esi
	callq	testMakeStruct@PLT
	xorl	%edi, %edi
	callq	printb@PLT
	leaq	.Lthe_str(%rip), %rdi
	callq	printstr@PLT
	xorl	%eax, %eax
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
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

	.type	.Lthe_str,@object       # @the_str
.Lthe_str:
	.asciz	"dummy struct."
	.size	.Lthe_str, 14

	.section	".note.GNU-stack","",@progbits
