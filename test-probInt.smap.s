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
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$16, %edi
	callq	malloc@PLT
	movq	%rax, %r14
	movq	%rax, %rdi
	xorl	%eax, %eax
	callq	init_list@PLT
	movl	$8, %edi
	callq	malloc@PLT
	movq	%rax, %r15
	movq	%rax, 72(%rsp)
	movabsq	$4598175219545276416, %r13 # imm = 0x3FD0000000000000
	movq	%r13, (%rax)
	movl	$8, %edi
	callq	malloc@PLT
	movq	%rax, %r12
	movq	%rax, 64(%rsp)
	movabsq	$4602678819172646912, %rax # imm = 0x3FE0000000000000
	movq	%rax, (%r12)
	movl	$8, %edi
	callq	malloc@PLT
	movq	%rax, %rbx
	movq	%rax, 56(%rsp)
	movq	%r13, (%rax)
	movq	%r14, %rdi
	movq	%r15, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%r14, %rdi
	movq	%r12, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movl	$16, %edi
	callq	malloc@PLT
	movq	%rax, %r15
	movq	%rax, %rdi
	xorl	%eax, %eax
	callq	init_list@PLT
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r12
	movq	%rax, 48(%rsp)
	movl	$1, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r13
	movq	%rax, 40(%rsp)
	movl	$2, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %rbx
	movq	%rax, 32(%rsp)
	movl	$3, (%rax)
	movq	%r15, %rdi
	movq	%r12, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%r15, %rdi
	movq	%r13, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movl	$40, %edi
	callq	malloc@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movq	%r15, %rdx
	xorl	%eax, %eax
	callq	init_prob@PLT
	movq	%rbx, 24(%rsp)
	movq	%rbx, 80(%rsp)
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	get_probs@PLT
	movq	%rax, 16(%rsp)
	movl	$0, 12(%rsp)
	leaq	.Lfmt.1(%rip), %r14
	leaq	.LnewLine(%rip), %rbx
	.p2align	4, 0x90
.LBB0_1:                                # %while
                                        # =>This Inner Loop Header: Depth=1
	movl	12(%rsp), %ebp
	movq	24(%rsp), %rdi
	xorl	%eax, %eax
	callq	get_length@PLT
	cmpl	%eax, %ebp
	jge	.LBB0_3
# %bb.2:                                # %while_body
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	16(%rsp), %rdi
	movl	12(%rsp), %esi
	xorl	%eax, %eax
	callq	get_at@PLT
	movsd	(%rax), %xmm0           # xmm0 = mem[0],zero
	movq	%r14, %rdi
	movb	$1, %al
	callq	printf@PLT
	movq	%rbx, %rdi
	callq	printstr@PLT
	incl	12(%rsp)
	jmp	.LBB0_1
.LBB0_3:                                # %merge
	xorl	%eax, %eax
	addq	$88, %rsp
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
