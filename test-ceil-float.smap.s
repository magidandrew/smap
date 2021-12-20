	.text
	.file	"Smap"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function main
.LCPI0_0:
	.quad	4622044297570340045     # double 10.4
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movabsq	$4622044297570340045, %rax # imm = 0x4024CCCCCCCCCCCD
	movq	%rax, 16(%rsp)
	movsd	.LCPI0_0(%rip), %xmm0   # xmm0 = mem[0],zero
	callq	ceilFloat@PLT
	movl	%eax, 12(%rsp)
	movl	%eax, %edi
	callq	printint@PLT
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
