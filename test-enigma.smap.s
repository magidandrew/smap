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
	subq	$1608, %rsp             # imm = 0x648
	.cfi_def_cfa_offset 1664
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$0, 20(%rsp)
	movl	$0, 292(%rsp)
	movl	$16, %edi
	callq	malloc@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	xorl	%eax, %eax
	callq	init_list@PLT
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 1600(%rsp)
	movl	$1, (%rax)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, 280(%rsp)
	leaq	.Lthe_str(%rip), %rax
	movq	%rax, 272(%rsp)
	movl	$16, %edi
	callq	malloc@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	xorl	%eax, %eax
	callq	init_list@PLT
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 1592(%rsp)
	movl	$1, (%rax)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, 264(%rsp)
	movq	272(%rsp), %rdi
	xorl	%esi, %esi
	callq	corresponding_int@PLT
	movl	%eax, 260(%rsp)
	movl	$16, %edi
	callq	malloc@PLT
	movq	%rax, %r14
	movq	%rax, %rdi
	xorl	%eax, %eax
	callq	init_list@PLT
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r15
	movq	%rax, 1584(%rsp)
	movl	$18, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %rbx
	movq	%rax, 1576(%rsp)
	movl	$8, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %rbp
	movq	%rax, 1568(%rsp)
	movl	$6, (%rax)
	movq	%r14, %rdi
	movq	%r15, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%r14, %rdi
	movq	%rbp, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%r14, 248(%rsp)
	movl	$16, %edi
	callq	malloc@PLT
	movq	%rax, %r14
	movq	%rax, %rdi
	xorl	%eax, %eax
	callq	init_list@PLT
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r15
	movq	%rax, 1560(%rsp)
	movl	$15, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %rbx
	movq	%rax, 1552(%rsp)
	movl	$12, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %rbp
	movq	%rax, 1544(%rsp)
	movl	$15, (%rax)
	movq	%r14, %rdi
	movq	%r15, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%r14, %rdi
	movq	%rbp, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%r14, 240(%rsp)
	movl	$16, %edi
	callq	malloc@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	xorl	%eax, %eax
	callq	init_list@PLT
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 184(%rsp)         # 8-byte Spill
	movq	%rax, 1536(%rsp)
	movl	$1, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 176(%rsp)         # 8-byte Spill
	movq	%rax, 1528(%rsp)
	movl	$3, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 168(%rsp)         # 8-byte Spill
	movq	%rax, 1520(%rsp)
	movl	$5, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 160(%rsp)         # 8-byte Spill
	movq	%rax, 1512(%rsp)
	movl	$7, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 152(%rsp)         # 8-byte Spill
	movq	%rax, 1504(%rsp)
	movl	$9, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 144(%rsp)         # 8-byte Spill
	movq	%rax, 1496(%rsp)
	movl	$11, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 136(%rsp)         # 8-byte Spill
	movq	%rax, 1488(%rsp)
	movl	$2, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 128(%rsp)         # 8-byte Spill
	movq	%rax, 1480(%rsp)
	movl	$15, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	%rax, 1472(%rsp)
	movl	$17, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	%rax, 1464(%rsp)
	movl	$19, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movq	%rax, 1456(%rsp)
	movl	$23, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	%rax, 1448(%rsp)
	movl	$21, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 88(%rsp)          # 8-byte Spill
	movq	%rax, 1440(%rsp)
	movl	$25, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	%rax, 1432(%rsp)
	movl	$13, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	%rax, 1424(%rsp)
	movl	$24, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	%rax, 1416(%rsp)
	movl	$4, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	%rax, 1408(%rsp)
	movl	$8, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	%rax, 1400(%rsp)
	movl	$22, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	%rax, 1392(%rsp)
	movl	$6, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	%rax, 1384(%rsp)
	movl	$0, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	%rax, 1376(%rsp)
	movl	$10, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r15
	movq	%rax, 1368(%rsp)
	movl	$12, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r12
	movq	%rax, 1360(%rsp)
	movl	$20, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r13
	movq	%rax, 1352(%rsp)
	movl	$18, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %rbp
	movq	%rax, 1344(%rsp)
	movl	$16, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r14
	movq	%rax, 1336(%rsp)
	movl	$14, (%rax)
	movq	%rbx, %rdi
	movq	184(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	176(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	168(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	160(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	152(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	144(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	136(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	128(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	120(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	112(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	104(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	96(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	88(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	80(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	72(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	64(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	56(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	48(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	40(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	32(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	24(%rsp), %rsi          # 8-byte Reload
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
	movq	%rbx, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, 232(%rsp)
	movl	$16, %edi
	callq	malloc@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	xorl	%eax, %eax
	callq	init_list@PLT
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 184(%rsp)         # 8-byte Spill
	movq	%rax, 1328(%rsp)
	movl	$0, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 176(%rsp)         # 8-byte Spill
	movq	%rax, 1320(%rsp)
	movl	$1, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 168(%rsp)         # 8-byte Spill
	movq	%rax, 1312(%rsp)
	movl	$2, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 160(%rsp)         # 8-byte Spill
	movq	%rax, 1304(%rsp)
	movl	$3, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 152(%rsp)         # 8-byte Spill
	movq	%rax, 1296(%rsp)
	movl	$4, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 144(%rsp)         # 8-byte Spill
	movq	%rax, 1288(%rsp)
	movl	$5, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 136(%rsp)         # 8-byte Spill
	movq	%rax, 1280(%rsp)
	movl	$6, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 128(%rsp)         # 8-byte Spill
	movq	%rax, 1272(%rsp)
	movl	$7, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	%rax, 1264(%rsp)
	movl	$8, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	%rax, 1256(%rsp)
	movl	$9, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movq	%rax, 1248(%rsp)
	movl	$10, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	%rax, 1240(%rsp)
	movl	$11, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 88(%rsp)          # 8-byte Spill
	movq	%rax, 1232(%rsp)
	movl	$12, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	%rax, 1224(%rsp)
	movl	$13, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	%rax, 1216(%rsp)
	movl	$14, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	%rax, 1208(%rsp)
	movl	$15, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	%rax, 1200(%rsp)
	movl	$16, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	%rax, 1192(%rsp)
	movl	$17, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	%rax, 1184(%rsp)
	movl	$18, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	%rax, 1176(%rsp)
	movl	$19, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	%rax, 1168(%rsp)
	movl	$20, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r15
	movq	%rax, 1160(%rsp)
	movl	$21, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r12
	movq	%rax, 1152(%rsp)
	movl	$22, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r13
	movq	%rax, 1144(%rsp)
	movl	$23, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %rbp
	movq	%rax, 1136(%rsp)
	movl	$24, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r14
	movq	%rax, 1128(%rsp)
	movl	$25, (%rax)
	movq	%rbx, %rdi
	movq	184(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	176(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	168(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	160(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	152(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	144(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	136(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	128(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	120(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	112(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	104(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	96(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	88(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	80(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	72(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	64(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	56(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	48(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	40(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	32(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	24(%rsp), %rsi          # 8-byte Reload
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
	movq	%rbx, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, 224(%rsp)
	movl	$16, %edi
	callq	malloc@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	xorl	%eax, %eax
	callq	init_list@PLT
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 184(%rsp)         # 8-byte Spill
	movq	%rax, 1120(%rsp)
	movl	$0, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 176(%rsp)         # 8-byte Spill
	movq	%rax, 1112(%rsp)
	movl	$9, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 168(%rsp)         # 8-byte Spill
	movq	%rax, 1104(%rsp)
	movl	$3, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 160(%rsp)         # 8-byte Spill
	movq	%rax, 1096(%rsp)
	movl	$10, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 152(%rsp)         # 8-byte Spill
	movq	%rax, 1088(%rsp)
	movl	$18, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 144(%rsp)         # 8-byte Spill
	movq	%rax, 1080(%rsp)
	movl	$8, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 136(%rsp)         # 8-byte Spill
	movq	%rax, 1072(%rsp)
	movl	$17, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 128(%rsp)         # 8-byte Spill
	movq	%rax, 1064(%rsp)
	movl	$20, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	%rax, 1056(%rsp)
	movl	$23, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	%rax, 1048(%rsp)
	movl	$1, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movq	%rax, 1040(%rsp)
	movl	$11, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	%rax, 1032(%rsp)
	movl	$7, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 88(%rsp)          # 8-byte Spill
	movq	%rax, 1024(%rsp)
	movl	$22, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	%rax, 1016(%rsp)
	movl	$19, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	%rax, 1008(%rsp)
	movl	$12, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	%rax, 1000(%rsp)
	movl	$2, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	%rax, 992(%rsp)
	movl	$16, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	%rax, 984(%rsp)
	movl	$6, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	%rax, 976(%rsp)
	movl	$25, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	%rax, 968(%rsp)
	movl	$13, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	%rax, 960(%rsp)
	movl	$15, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r15
	movq	%rax, 952(%rsp)
	movl	$24, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r12
	movq	%rax, 944(%rsp)
	movl	$5, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r13
	movq	%rax, 936(%rsp)
	movl	$21, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %rbp
	movq	%rax, 928(%rsp)
	movl	$14, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r14
	movq	%rax, 920(%rsp)
	movl	$4, (%rax)
	movq	%rbx, %rdi
	movq	184(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	176(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	168(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	160(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	152(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	144(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	136(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	128(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	120(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	112(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	104(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	96(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	88(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	80(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	72(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	64(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	56(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	48(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	40(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	32(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	24(%rsp), %rsi          # 8-byte Reload
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
	movq	%rbx, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, 216(%rsp)
	movl	$16, %edi
	callq	malloc@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	xorl	%eax, %eax
	callq	init_list@PLT
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 184(%rsp)         # 8-byte Spill
	movq	%rax, 912(%rsp)
	movl	$0, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 176(%rsp)         # 8-byte Spill
	movq	%rax, 904(%rsp)
	movl	$1, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 168(%rsp)         # 8-byte Spill
	movq	%rax, 896(%rsp)
	movl	$2, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 160(%rsp)         # 8-byte Spill
	movq	%rax, 888(%rsp)
	movl	$3, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 152(%rsp)         # 8-byte Spill
	movq	%rax, 880(%rsp)
	movl	$4, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 144(%rsp)         # 8-byte Spill
	movq	%rax, 872(%rsp)
	movl	$5, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 136(%rsp)         # 8-byte Spill
	movq	%rax, 864(%rsp)
	movl	$6, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 128(%rsp)         # 8-byte Spill
	movq	%rax, 856(%rsp)
	movl	$7, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	%rax, 848(%rsp)
	movl	$8, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	%rax, 840(%rsp)
	movl	$9, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movq	%rax, 832(%rsp)
	movl	$10, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	%rax, 824(%rsp)
	movl	$11, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 88(%rsp)          # 8-byte Spill
	movq	%rax, 816(%rsp)
	movl	$12, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	%rax, 808(%rsp)
	movl	$13, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	%rax, 800(%rsp)
	movl	$14, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	%rax, 792(%rsp)
	movl	$15, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	%rax, 784(%rsp)
	movl	$16, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	%rax, 776(%rsp)
	movl	$17, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	%rax, 768(%rsp)
	movl	$18, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	%rax, 760(%rsp)
	movl	$19, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	%rax, 752(%rsp)
	movl	$20, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r15
	movq	%rax, 744(%rsp)
	movl	$21, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r12
	movq	%rax, 736(%rsp)
	movl	$22, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r13
	movq	%rax, 728(%rsp)
	movl	$23, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %rbp
	movq	%rax, 720(%rsp)
	movl	$24, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r14
	movq	%rax, 712(%rsp)
	movl	$25, (%rax)
	movq	%rbx, %rdi
	movq	184(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	176(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	168(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	160(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	152(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	144(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	136(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	128(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	120(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	112(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	104(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	96(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	88(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	80(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	72(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	64(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	56(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	48(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	40(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	32(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	24(%rsp), %rsi          # 8-byte Reload
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
	movq	%rbx, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, 208(%rsp)
	movl	$16, %edi
	callq	malloc@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	xorl	%eax, %eax
	callq	init_list@PLT
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 184(%rsp)         # 8-byte Spill
	movq	%rax, 704(%rsp)
	movl	$4, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 176(%rsp)         # 8-byte Spill
	movq	%rax, 696(%rsp)
	movl	$10, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 168(%rsp)         # 8-byte Spill
	movq	%rax, 688(%rsp)
	movl	$12, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 160(%rsp)         # 8-byte Spill
	movq	%rax, 680(%rsp)
	movl	$5, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 152(%rsp)         # 8-byte Spill
	movq	%rax, 672(%rsp)
	movl	$11, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 144(%rsp)         # 8-byte Spill
	movq	%rax, 664(%rsp)
	movl	$6, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 136(%rsp)         # 8-byte Spill
	movq	%rax, 656(%rsp)
	movl	$3, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 128(%rsp)         # 8-byte Spill
	movq	%rax, 648(%rsp)
	movl	$16, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	%rax, 640(%rsp)
	movl	$21, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	%rax, 632(%rsp)
	movl	$25, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movq	%rax, 624(%rsp)
	movl	$13, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	%rax, 616(%rsp)
	movl	$19, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 88(%rsp)          # 8-byte Spill
	movq	%rax, 608(%rsp)
	movl	$14, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	%rax, 600(%rsp)
	movl	$22, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	%rax, 592(%rsp)
	movl	$24, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	%rax, 584(%rsp)
	movl	$7, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	%rax, 576(%rsp)
	movl	$23, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	%rax, 568(%rsp)
	movl	$20, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	%rax, 560(%rsp)
	movl	$18, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	%rax, 552(%rsp)
	movl	$15, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	%rax, 544(%rsp)
	movl	$0, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r15
	movq	%rax, 536(%rsp)
	movl	$8, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r12
	movq	%rax, 528(%rsp)
	movl	$1, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r13
	movq	%rax, 520(%rsp)
	movl	$17, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %rbp
	movq	%rax, 512(%rsp)
	movl	$2, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r14
	movq	%rax, 504(%rsp)
	movl	$9, (%rax)
	movq	%rbx, %rdi
	movq	184(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	176(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	168(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	160(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	152(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	144(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	136(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	128(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	120(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	112(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	104(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	96(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	88(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	80(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	72(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	64(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	56(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	48(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	40(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	32(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	24(%rsp), %rsi          # 8-byte Reload
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
	movq	%rbx, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, 200(%rsp)
	movl	$16, %edi
	callq	malloc@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	xorl	%eax, %eax
	callq	init_list@PLT
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 184(%rsp)         # 8-byte Spill
	movq	%rax, 496(%rsp)
	movl	$0, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 176(%rsp)         # 8-byte Spill
	movq	%rax, 488(%rsp)
	movl	$1, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 168(%rsp)         # 8-byte Spill
	movq	%rax, 480(%rsp)
	movl	$2, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 160(%rsp)         # 8-byte Spill
	movq	%rax, 472(%rsp)
	movl	$3, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 152(%rsp)         # 8-byte Spill
	movq	%rax, 464(%rsp)
	movl	$4, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 144(%rsp)         # 8-byte Spill
	movq	%rax, 456(%rsp)
	movl	$5, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 136(%rsp)         # 8-byte Spill
	movq	%rax, 448(%rsp)
	movl	$6, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 128(%rsp)         # 8-byte Spill
	movq	%rax, 440(%rsp)
	movl	$7, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	%rax, 432(%rsp)
	movl	$8, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	%rax, 424(%rsp)
	movl	$9, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movq	%rax, 416(%rsp)
	movl	$10, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	%rax, 408(%rsp)
	movl	$11, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 88(%rsp)          # 8-byte Spill
	movq	%rax, 400(%rsp)
	movl	$12, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	%rax, 392(%rsp)
	movl	$13, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	%rax, 384(%rsp)
	movl	$14, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	%rax, 376(%rsp)
	movl	$15, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	%rax, 368(%rsp)
	movl	$16, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	%rax, 360(%rsp)
	movl	$17, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	%rax, 352(%rsp)
	movl	$18, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	%rax, 344(%rsp)
	movl	$19, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	%rax, 336(%rsp)
	movl	$20, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r15
	movq	%rax, 328(%rsp)
	movl	$21, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r12
	movq	%rax, 320(%rsp)
	movl	$22, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r13
	movq	%rax, 312(%rsp)
	movl	$23, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %rbp
	movq	%rax, 304(%rsp)
	movl	$24, (%rax)
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, %r14
	movq	%rax, 296(%rsp)
	movl	$25, (%rax)
	movq	%rbx, %rdi
	movq	184(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	176(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	168(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	160(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	152(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	144(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	136(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	128(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	120(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	112(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	104(%rsp), %rsi         # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	96(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	88(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	80(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	72(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	64(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	56(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	48(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	40(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	32(%rsp), %rsi          # 8-byte Reload
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, %rdi
	movq	24(%rsp), %rsi          # 8-byte Reload
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
	movq	%rbx, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	push_back@PLT
	movq	%rbx, 192(%rsp)
	movq	248(%rsp), %rdi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	get_at@PLT
	movl	(%rax), %esi
	movq	192(%rsp), %rdi
	callq	character_location@PLT
	movl	%eax, 20(%rsp)
	movq	192(%rsp), %rdi
	movl	%eax, %esi
	callq	rotor_shift@PLT
	movq	%rax, 192(%rsp)
	movq	240(%rsp), %rdi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	get_at@PLT
	movl	(%rax), %esi
	movq	200(%rsp), %rdi
	callq	character_location@PLT
	movl	%eax, 20(%rsp)
	movq	200(%rsp), %rdi
	movl	%eax, %esi
	callq	rotor_shift@PLT
	movq	%rax, 200(%rsp)
	movq	248(%rsp), %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	callq	get_at@PLT
	movl	(%rax), %esi
	movq	208(%rsp), %rdi
	callq	character_location@PLT
	movl	%eax, 20(%rsp)
	movq	208(%rsp), %rdi
	movl	%eax, %esi
	callq	rotor_shift@PLT
	movq	%rax, 208(%rsp)
	movq	240(%rsp), %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	callq	get_at@PLT
	movl	(%rax), %esi
	movq	216(%rsp), %rdi
	callq	character_location@PLT
	movl	%eax, 20(%rsp)
	movq	216(%rsp), %rdi
	movl	%eax, %esi
	callq	rotor_shift@PLT
	movq	%rax, 216(%rsp)
	movq	248(%rsp), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	callq	get_at@PLT
	movl	(%rax), %esi
	movq	224(%rsp), %rdi
	callq	character_location@PLT
	movl	%eax, 20(%rsp)
	movq	224(%rsp), %rdi
	movl	%eax, %esi
	callq	rotor_shift@PLT
	movq	%rax, 224(%rsp)
	movq	240(%rsp), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	callq	get_at@PLT
	movl	(%rax), %esi
	movq	232(%rsp), %rdi
	callq	character_location@PLT
	movl	%eax, 20(%rsp)
	movq	232(%rsp), %rdi
	movl	%eax, %esi
	callq	rotor_shift@PLT
	movq	%rax, 232(%rsp)
	movq	264(%rsp), %rbp
	movq	224(%rsp), %r8
	movq	216(%rsp), %rcx
	movq	208(%rsp), %rdx
	movq	200(%rsp), %rsi
	movq	192(%rsp), %rdi
	movq	%rbp, (%rsp)
	movq	%rax, %r9
	callq	encryption_decryption@PLT
	movq	%rax, 280(%rsp)
	movl	260(%rsp), %edi
	callq	printint@PLT
	xorl	%eax, %eax
	addq	$1608, %rsp             # imm = 0x648
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
	.globl	encryption_decryption   # -- Begin function encryption_decryption
	.p2align	4, 0x90
	.type	encryption_decryption,@function
encryption_decryption:                  # @encryption_decryption
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, %rax
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movq	%rdx, -24(%rsp)
	movq	%rcx, -32(%rsp)
	movq	%r8, -40(%rsp)
	movq	%r9, -48(%rsp)
	retq
.Lfunc_end1:
	.size	encryption_decryption, .Lfunc_end1-encryption_decryption
	.cfi_endproc
                                        # -- End function
	.globl	rotor_shift             # -- Begin function rotor_shift
	.p2align	4, 0x90
	.type	rotor_shift,@function
rotor_shift:                            # @rotor_shift
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, -56(%rbp)
	movl	%esi, -64(%rbp)
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	get_at@PLT
	movl	(%rax), %eax
	movl	%eax, -44(%rbp)
	movl	$0, -40(%rbp)
	movl	$0, -36(%rbp)
	movl	$0, -60(%rbp)
	jmp	.LBB2_1
	.p2align	4, 0x90
.LBB2_7:                                # %merge33
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	-40(%rbp)
.LBB2_1:                                # %while
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_3 Depth 2
	movl	-40(%rbp), %eax
	cmpl	-64(%rbp), %eax
	jge	.LBB2_8
# %bb.2:                                # %while_body
                                        #   in Loop: Header=BB2_1 Depth=1
	movq	-56(%rbp), %rdi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	get_at@PLT
	movl	(%rax), %eax
	movl	%eax, -44(%rbp)
	movl	$0, -36(%rbp)
	jmp	.LBB2_3
	.p2align	4, 0x90
.LBB2_6:                                # %merge
                                        #   in Loop: Header=BB2_3 Depth=2
	incl	-36(%rbp)
.LBB2_3:                                # %while8
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$24, -36(%rbp)
	jg	.LBB2_7
# %bb.4:                                # %while_body9
                                        #   in Loop: Header=BB2_3 Depth=2
	movl	-36(%rbp), %r14d
	leal	1(%r14), %esi
	movl	%esi, -60(%rbp)
	movq	-56(%rbp), %r12
	movq	%r12, %rdi
	xorl	%eax, %eax
	callq	get_at@PLT
	movl	(%rax), %r15d
	movq	%rsp, %rbx
	leaq	-16(%rbx), %rsp
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, -16(%rbx)
	movl	%r15d, (%rax)
	movq	%r12, %rdi
	movl	%r14d, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	set_at@PLT
	cmpl	$24, -36(%rbp)
	jne	.LBB2_6
# %bb.5:                                # %if_body
                                        #   in Loop: Header=BB2_3 Depth=2
	movq	-56(%rbp), %r14
	movl	-44(%rbp), %r15d
	movq	%rsp, %rbx
	leaq	-16(%rbx), %rsp
	movl	$4, %edi
	callq	malloc@PLT
	movq	%rax, -16(%rbx)
	movl	%r15d, (%rax)
	movq	%r14, %rdi
	movl	$25, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	set_at@PLT
	jmp	.LBB2_6
.LBB2_8:                                # %merge39
	movq	-56(%rbp), %rax
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	rotor_shift, .Lfunc_end2-rotor_shift
	.cfi_endproc
                                        # -- End function
	.globl	character_location      # -- Begin function character_location
	.p2align	4, 0x90
	.type	character_location,@function
character_location:                     # @character_location
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movl	%esi, 12(%rsp)
	movl	$0, 8(%rsp)
	movl	$0, 4(%rsp)
	cmpl	$25, 4(%rsp)
	jg	.LBB3_4
	.p2align	4, 0x90
.LBB3_2:                                # %while_body
                                        # =>This Inner Loop Header: Depth=1
	movq	16(%rsp), %rdi
	movl	4(%rsp), %esi
	xorl	%eax, %eax
	callq	get_at@PLT
	movl	(%rax), %eax
	cmpl	12(%rsp), %eax
	je	.LBB3_5
# %bb.3:                                # %merge
                                        #   in Loop: Header=BB3_2 Depth=1
	incl	4(%rsp)
	cmpl	$25, 4(%rsp)
	jle	.LBB3_2
.LBB3_4:                                # %merge11
	movl	8(%rsp), %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.LBB3_5:                                # %if_body
	.cfi_def_cfa_offset 32
	movl	4(%rsp), %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end3:
	.size	character_location, .Lfunc_end3-character_location
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

	.type	.Lthe_str,@object       # @the_str
.Lthe_str:
	.asciz	"ZEROSIXHUNDREEDHOURSWEATHERTODAYISCLEARRAININTHEEVENINGHEILHITLER"
	.size	.Lthe_str, 66

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

	.type	.Ltest.6,@object        # @test.6
.Ltest.6:
	.asciz	"test test test!\n"
	.size	.Ltest.6, 17

	.type	.LnewLine.7,@object     # @newLine.7
.LnewLine.7:
	.asciz	"\n"
	.size	.LnewLine.7, 2

	.type	.Lfmt.8,@object         # @fmt.8
.Lfmt.8:
	.asciz	"%d"
	.size	.Lfmt.8, 3

	.type	.Lfmt.9,@object         # @fmt.9
.Lfmt.9:
	.asciz	"%f"
	.size	.Lfmt.9, 3

	.type	.Ltest.10,@object       # @test.10
.Ltest.10:
	.asciz	"test test test!\n"
	.size	.Ltest.10, 17

	.type	.LnewLine.11,@object    # @newLine.11
.LnewLine.11:
	.asciz	"\n"
	.size	.LnewLine.11, 2

	.type	.Lfmt.12,@object        # @fmt.12
.Lfmt.12:
	.asciz	"%d"
	.size	.Lfmt.12, 3

	.type	.Lfmt.13,@object        # @fmt.13
.Lfmt.13:
	.asciz	"%f"
	.size	.Lfmt.13, 3

	.section	".note.GNU-stack","",@progbits
