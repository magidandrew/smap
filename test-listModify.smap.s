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
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$4, 4(%rsp)
	movl	$85, (%rsp)
	movl	$16, %edi
	callq	malloc@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	xorl	%eax, %eax
	callq	init_list@PLT
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	%rax, 112(%rsp)
	movl	$0, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	%rax, 104(%rsp)
	movl	$1, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	%rax, 96(%rsp)
	movl	$2, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	%rax, 88(%rsp)
	movl	$3, (%rax)
	movl	4(%rsp), %ebp
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r13
	movq	%rax, 80(%rsp)
	movl	%ebp, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r14
	movq	%rax, 72(%rsp)
	movl	$99, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r15
	movq	%rax, 64(%rsp)
	movl	$7200, (%rax)           # imm = 0x1C20
	movl	(%rsp), %ebp
	decl	%ebp
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r12
	movq	%rax, 56(%rsp)
	movl	%ebp, (%rax)
	movq	%rbx, %rdi
	movq	32(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	24(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	16(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	8(%rsp), %rsi           # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	%r13, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
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
	movq	%rbx, 40(%rsp)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 48(%rsp)
	movl	$-7201, (%rax)          # imm = 0xE3DF
	movq	%rbx, %rdi
	movl	$6, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	set_at@PLT
	movq	40(%rsp), %rdi
	xorl	%eax, %eax
	callq	print_list_int@PLT
	xorl	%eax, %eax
	addq	$120, %rsp
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
