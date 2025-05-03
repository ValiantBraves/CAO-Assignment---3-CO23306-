	.text
	.file	"matrix_mul.c"
	.globl	multiply_matrices               # -- Begin function multiply_matrices
	.p2align	4, 0x90
	.type	multiply_matrices,@function
multiply_matrices:                      # @multiply_matrices
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movl	$0, -8(%rbp)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
                                        #       Child Loop BB0_5 Depth 3
	cmpl	$100, -8(%rbp)
	jge	.LBB0_12
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movl	$0, -4(%rbp)
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_5 Depth 3
	cmpl	$100, -4(%rbp)
	jge	.LBB0_10
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	movq	-24(%rbp), %rax
	movslq	-8(%rbp), %rcx
	imulq	$400, %rcx, %rcx                # imm = 0x190
	addq	%rcx, %rax
	movslq	-4(%rbp), %rcx
	xorps	%xmm0, %xmm0
	movss	%xmm0, (%rax,%rcx,4)
	movl	$0, -12(%rbp)
.LBB0_5:                                #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$100, -12(%rbp)
	jge	.LBB0_8
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=3
	movq	-40(%rbp), %rax
	movslq	-8(%rbp), %rcx
	imulq	$400, %rcx, %rcx                # imm = 0x190
	addq	%rcx, %rax
	movslq	-12(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-32(%rbp), %rax
	movslq	-12(%rbp), %rcx
	imulq	$400, %rcx, %rcx                # imm = 0x190
	addq	%rcx, %rax
	movslq	-4(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	movq	-24(%rbp), %rax
	movslq	-8(%rbp), %rcx
	imulq	$400, %rcx, %rcx                # imm = 0x190
	addq	%rcx, %rax
	movslq	-4(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	mulss	%xmm1, %xmm0
	addss	%xmm2, %xmm0
	movss	%xmm0, (%rax,%rcx,4)
# %bb.7:                                #   in Loop: Header=BB0_5 Depth=3
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB0_5
.LBB0_8:                                #   in Loop: Header=BB0_3 Depth=2
	jmp	.LBB0_9
.LBB0_9:                                #   in Loop: Header=BB0_3 Depth=2
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB0_3
.LBB0_10:                               #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_11
.LBB0_11:                               #   in Loop: Header=BB0_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB0_1
.LBB0_12:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	multiply_matrices, .Lfunc_end0-multiply_matrices
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function main
.LCPI1_0:
	.quad	0x412e848000000000              # double 1.0E+6
.LCPI1_1:
	.quad	0x4024000000000000              # double 10
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$120048, %rsp                   # imm = 0x1D4F0
	movl	$0, -36(%rbp)
	xorl	%edi, %edi
	callq	time@PLT
	movl	%eax, %edi
	callq	srand@PLT
	movl	$0, -8(%rbp)
.LBB1_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	cmpl	$100, -8(%rbp)
	jge	.LBB1_8
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movl	$0, -4(%rbp)
.LBB1_3:                                #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$100, -4(%rbp)
	jge	.LBB1_6
# %bb.4:                                #   in Loop: Header=BB1_3 Depth=2
	callq	rand@PLT
	movl	$100, %ecx
	cltd
	idivl	%ecx
	cvtsi2ss	%edx, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	.LCPI1_1(%rip), %xmm1           # xmm1 = [1.0E+1,0.0E+0]
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movslq	-8(%rbp), %rax
	leaq	-80048(%rbp), %rcx
	imulq	$400, %rax, %rax                # imm = 0x190
	addq	%rax, %rcx
	movslq	-4(%rbp), %rax
	movss	%xmm0, (%rcx,%rax,4)
	callq	rand@PLT
	movl	$100, %ecx
	cltd
	idivl	%ecx
	cvtsi2ss	%edx, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	.LCPI1_1(%rip), %xmm1           # xmm1 = [1.0E+1,0.0E+0]
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movslq	-8(%rbp), %rax
	leaq	-40048(%rbp), %rcx
	imulq	$400, %rax, %rax                # imm = 0x190
	addq	%rax, %rcx
	movslq	-4(%rbp), %rax
	movss	%xmm0, (%rcx,%rax,4)
# %bb.5:                                #   in Loop: Header=BB1_3 Depth=2
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB1_3
.LBB1_6:                                #   in Loop: Header=BB1_1 Depth=1
	jmp	.LBB1_7
.LBB1_7:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB1_1
.LBB1_8:
	callq	clock@PLT
	movq	%rax, -32(%rbp)
	leaq	-80048(%rbp), %rdi
	leaq	-40048(%rbp), %rsi
	leaq	-120048(%rbp), %rdx
	callq	multiply_matrices
	callq	clock@PLT
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	subq	-32(%rbp), %rax
	cvtsi2sd	%rax, %xmm0
	movsd	.LCPI1_0(%rip), %xmm1           # xmm1 = [1.0E+6,0.0E+0]
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-16(%rbp), %xmm0                # xmm0 = mem[0],zero
	movabsq	$.L.str, %rdi
	movb	$1, %al
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$120048, %rsp                   # imm = 0x1D4F0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Matrix multiplication completed in %.3f seconds\n"
	.size	.L.str, 49

	.ident	"Debian clang version 19.1.7 (3)"
	.section	".note.GNU-stack","",@progbits
