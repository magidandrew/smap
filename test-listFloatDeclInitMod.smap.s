	.text
	.file	"Smap"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function main
.LCPI0_0:
	.quad	-4616189618054758400    # double -1
	.text
	.globl	main
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
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movabsq	$4616189618054758400, %rax # imm = 0x4010000000000000
	movq	%rax, 56(%rsp)
	movabsq	$4635681760191971328, %rax # imm = 0x4055400000000000
	movq	%rax, 48(%rsp)
	movl	$0, 4(%rsp)
	movl	$16, %edi
	callq	malloc@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	xorl	%eax, %eax
	callq	init_list@PLT
	movl	$8, %edi
	callq	malloc@PLT
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	%rax, 128(%rsp)
	movabsq	$4575765307799480828, %rcx # imm = 0x3F80624DD2F1A9FC
	movq	%rcx, (%rax)
	movl	$8, %edi
	callq	malloc@PLT
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	%rax, 120(%rsp)
	movabsq	$4607182463836013682, %rcx # imm = 0x3FF0000A7C5AC472
	movq	%rcx, (%rax)
	movl	$8, %edi
	callq	malloc@PLT
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	%rax, 112(%rsp)
	movabsq	$4611911198408756429, %rcx # imm = 0x4000CCCCCCCCCCCD
	movq	%rcx, (%rax)
	movl	$8, %edi
	callq	malloc@PLT
	movq	%rax, %r13
	movq	%rax, 104(%rsp)
	movabsq	$4615063718147915776, %rax # imm = 0x400C000000000000
	movq	%rax, (%r13)
	movsd	56(%rsp), %xmm0         # xmm0 = mem[0],zero
	movsd	%xmm0, 8(%rsp)          # 8-byte Spill
	movl	$8, %edi
	callq	malloc@PLT
	movq	%rax, %rbp
	movq	%rax, 96(%rsp)
	movsd	8(%rsp), %xmm0          # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movsd	%xmm0, (%rax)
	movl	$8, %edi
	callq	malloc@PLT
	movq	%rax, %r14
	movq	%rax, 88(%rsp)
	movabsq	$4636730254480218522, %rax # imm = 0x4058F9999999999A
	movq	%rax, (%r14)
	movl	$8, %edi
	callq	malloc@PLT
	movq	%rax, %r15
	movq	%rax, 80(%rsp)
	movabsq	$4664638498421080064, %rax # imm = 0x40BC200000000000
	movq	%rax, (%r15)
	movsd	48(%rsp), %xmm0         # xmm0 = mem[0],zero
	addsd	.LCPI0_0(%rip), %xmm0
	movsd	%xmm0, 8(%rsp)          # 8-byte Spill
	movl	$8, %edi
	callq	malloc@PLT
	movq	%rax, %r12
	movq	%rax, 72(%rsp)
	movsd	8(%rsp), %xmm0          # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movsd	%xmm0, (%rax)
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
	movq	%r13, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	%rbp, %rsi
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
	movl	$8, %edi
	callq	malloc@PLT
	movq	%rax, 64(%rsp)
	movabsq	$-4558731972509235465, %rcx # imm = 0xC0BC216C985F06F7
	movq	%rcx, (%rax)
	movq	%rbx, %rdi
	movl	$6, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	set_at@PLT
	movl	$0, 4(%rsp)
	leaq	.Lfmt.1(%rip), %rbx
	leaq	.LnewLine(%rip), %rbp
	cmpl	$7, 4(%rsp)
	jg	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # %while_body
                                        # =>This Inner Loop Header: Depth=1
	movq	40(%rsp), %rdi
	movl	4(%rsp), %esi
	xorl	%eax, %eax
	callq	get_at@PLT
	movsd	(%rax), %xmm0           # xmm0 = mem[0],zero
	movq	%rbx, %rdi
	movb	$1, %al
	callq	printf@PLT
	movq	%rbp, %rdi
	callq	printstr@PLT
	incl	4(%rsp)
	cmpl	$7, 4(%rsp)
	jle	.LBB0_2
.LBB0_3:                                # %merge
	xorl	%eax, %eax
	addq	$136, %rsp
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
