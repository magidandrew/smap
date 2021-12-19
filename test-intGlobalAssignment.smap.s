	.text
	.file	"Smap"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	w@GOTPCREL(%rip), %rbx
	movl	(%rbx), %edi
	callq	printint@PLT
	movl	$400, (%rbx)            # imm = 0x190
	movl	$400, %edi              # imm = 0x190
	callq	printint@PLT
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	y,@object               # @y
	.data
	.globl	y
	.p2align	2
y:
	.long	3                       # 0x3
	.size	y, 4

	.type	w,@object               # @w
	.globl	w
	.p2align	2
w:
	.long	300                     # 0x12c
	.size	w, 4

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
