	.file	"conversion_v2.c"
	.text
	.type	in_bounds, @function
in_bounds:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -4(%rbp)
	movss	-4(%rbp), %xmm0
	comiss	.LC0(%rip), %xmm0
	jbe	.L9
	movss	.LC0(%rip), %xmm0
	jmp	.L4
.L9:
	pxor	%xmm0, %xmm0
	comiss	-4(%rbp), %xmm0
	jbe	.L10
	pxor	%xmm0, %xmm0
	jmp	.L4
.L10:
	movss	-4(%rbp), %xmm0
.L4:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	in_bounds, .-in_bounds
	.section	.rodata
.LC11:
	.string	"YCC %.0f %.0f %.0f"
	.text
	.type	rgb_to_ycc, @function
rgb_to_ycc:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movss	%xmm0, -20(%rbp)
	movss	%xmm1, -24(%rbp)
	movss	%xmm2, -28(%rbp)
	pxor	%xmm1, %xmm1
	cvtss2sd	-20(%rbp), %xmm1
	movsd	.LC2(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	pxor	%xmm2, %xmm2
	cvtss2sd	-24(%rbp), %xmm2
	movsd	.LC3(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	pxor	%xmm2, %xmm2
	cvtss2sd	-28(%rbp), %xmm2
	movsd	.LC4(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -12(%rbp)
	pxor	%xmm1, %xmm1
	cvtss2sd	-20(%rbp), %xmm1
	movsd	.LC5(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movsd	.LC6(%rip), %xmm0
	subsd	%xmm1, %xmm0
	pxor	%xmm2, %xmm2
	cvtss2sd	-24(%rbp), %xmm2
	movsd	.LC7(%rip), %xmm1
	mulsd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	subsd	%xmm2, %xmm1
	pxor	%xmm2, %xmm2
	cvtss2sd	-28(%rbp), %xmm2
	movsd	.LC8(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -8(%rbp)
	pxor	%xmm1, %xmm1
	cvtss2sd	-20(%rbp), %xmm1
	movsd	.LC8(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movsd	.LC6(%rip), %xmm0
	addsd	%xmm1, %xmm0
	pxor	%xmm2, %xmm2
	cvtss2sd	-24(%rbp), %xmm2
	movsd	.LC9(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	pxor	%xmm2, %xmm2
	cvtss2sd	-28(%rbp), %xmm2
	movsd	.LC10(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -4(%rbp)
	movl	-4(%rbp), %eax
	movd	%eax, %xmm0
	call	in_bounds
	pxor	%xmm3, %xmm3
	cvtss2sd	%xmm0, %xmm3
	movsd	%xmm3, -40(%rbp)
	movl	-8(%rbp), %eax
	movd	%eax, %xmm0
	call	in_bounds
	pxor	%xmm4, %xmm4
	cvtss2sd	%xmm0, %xmm4
	movsd	%xmm4, -48(%rbp)
	movl	-12(%rbp), %eax
	movd	%eax, %xmm0
	call	in_bounds
	pxor	%xmm5, %xmm5
	cvtss2sd	%xmm0, %xmm5
	movq	%xmm5, %rax
	movsd	-40(%rbp), %xmm2
	movsd	-48(%rbp), %xmm1
	movq	%rax, %xmm0
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$3, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	rgb_to_ycc, .-rgb_to_ycc
	.section	.rodata
.LC17:
	.string	"RGB %.0f %.0f %.0f"
	.text
	.type	ycc_to_rgb, @function
ycc_to_rgb:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movss	%xmm0, -20(%rbp)
	movss	%xmm1, -24(%rbp)
	movss	%xmm2, -28(%rbp)
	pxor	%xmm1, %xmm1
	cvtss2sd	-20(%rbp), %xmm1
	movss	-28(%rbp), %xmm0
	movss	.LC12(%rip), %xmm2
	subss	%xmm2, %xmm0
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm0, %xmm2
	movsd	.LC13(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -12(%rbp)
	pxor	%xmm0, %xmm0
	cvtss2sd	-20(%rbp), %xmm0
	movss	-24(%rbp), %xmm1
	movss	.LC12(%rip), %xmm2
	subss	%xmm2, %xmm1
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm1, %xmm2
	movsd	.LC14(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movss	-28(%rbp), %xmm1
	movss	.LC12(%rip), %xmm2
	subss	%xmm2, %xmm1
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm1, %xmm2
	movsd	.LC15(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -8(%rbp)
	pxor	%xmm1, %xmm1
	cvtss2sd	-20(%rbp), %xmm1
	movss	-24(%rbp), %xmm0
	movss	.LC12(%rip), %xmm2
	subss	%xmm2, %xmm0
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm0, %xmm2
	movsd	.LC16(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -4(%rbp)
	movl	-4(%rbp), %eax
	movd	%eax, %xmm0
	call	in_bounds
	pxor	%xmm3, %xmm3
	cvtss2sd	%xmm0, %xmm3
	movsd	%xmm3, -40(%rbp)
	movl	-8(%rbp), %eax
	movd	%eax, %xmm0
	call	in_bounds
	pxor	%xmm4, %xmm4
	cvtss2sd	%xmm0, %xmm4
	movsd	%xmm4, -48(%rbp)
	movl	-12(%rbp), %eax
	movd	%eax, %xmm0
	call	in_bounds
	pxor	%xmm5, %xmm5
	cvtss2sd	%xmm0, %xmm5
	movq	%xmm5, %rax
	movsd	-40(%rbp), %xmm2
	movsd	-48(%rbp), %xmm1
	movq	%rax, %xmm0
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$3, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	ycc_to_rgb, .-ycc_to_rgb
	.section	.rodata
.LC18:
	.string	"RGB"
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	.LC18(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L14
	movq	-48(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atof@PLT
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -20(%rbp)
	movq	-48(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atof@PLT
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -16(%rbp)
	movq	-48(%rbp), %rax
	addq	$32, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atof@PLT
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -12(%rbp)
	movss	-12(%rbp), %xmm1
	movss	-16(%rbp), %xmm0
	movl	-20(%rbp), %eax
	movaps	%xmm1, %xmm2
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	rgb_to_ycc
	jmp	.L15
.L14:
	movq	-48(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atof@PLT
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -32(%rbp)
	movq	-48(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atof@PLT
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -28(%rbp)
	movq	-48(%rbp), %rax
	addq	$32, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atof@PLT
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -24(%rbp)
	movss	-24(%rbp), %xmm1
	movss	-28(%rbp), %xmm0
	movl	-32(%rbp), %eax
	movaps	%xmm1, %xmm2
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	ycc_to_rgb
.L15:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1132396544
	.align 8
.LC2:
	.long	-446676599
	.long	1070801616
	.align 8
.LC3:
	.long	962072674
	.long	1071827124
	.align 8
.LC4:
	.long	-1614907703
	.long	1069362970
	.align 8
.LC5:
	.long	684995744
	.long	1069914404
	.align 8
.LC6:
	.long	0
	.long	1080033280
	.align 8
.LC7:
	.long	-342497872
	.long	1070936941
	.align 8
.LC8:
	.long	0
	.long	1071644672
	.align 8
.LC9:
	.long	-1060204087
	.long	1071303624
	.align 8
.LC10:
	.long	-54150948
	.long	1068814556
	.align 4
.LC12:
	.long	1124073472
	.align 8
.LC13:
	.long	-1924145349
	.long	1073114775
	.align 8
.LC14:
	.long	5772436
	.long	1070990931
	.align 8
.LC15:
	.long	-1113805279
	.long	1072093747
	.align 8
.LC16:
	.long	-1408749273
	.long	1073502748
	.ident	"GCC: (GNU) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
