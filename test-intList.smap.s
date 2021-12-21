	.text
	.file	"Smap"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$16, %edi
	callq	malloc@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	xorl	%eax, %eax
	callq	init_list@PLT
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r14
	movq	%rax, 40(%rsp)
	movl	$99, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r15
	movq	%rax, 32(%rsp)
	movl	$1, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r12
	movq	%rax, 24(%rsp)
	movl	$2, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r13
	movq	%rax, 16(%rsp)
	movl	$3, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %rbp
	movq	%rax, 8(%rsp)
	movl	$4, (%rax)
	movq	%rbx, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	%r15, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	%r12, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	%r13, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, 48(%rsp)
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	print_list_int@PLT
	xorl	%eax, %eax
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
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
