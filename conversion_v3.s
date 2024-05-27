	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"conversion_v3.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"RGB\000"
	.align	2
.LC1:
	.ascii	"YCC %.0f %.0f %.0f\000"
	.align	2
.LC2:
	.ascii	"RGB %.0f %.0f %.0f\000"
	.text
	.align	2
	.global	main
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #56
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
	movw	r1, #:lower16:.LC0
	movt	r1, #:upper16:.LC0
	ldr	r0, [fp, #-8]
	bl	strcmp
	mov	r3, r0
	cmp	r3, #0
	bne	.L2
	ldr	r3, [fp, #-44]
	add	r3, r3, #8
	ldr	r3, [r3]
	mov	r0, r3
	bl	atof
	vmov.f64	d7, d0
	vcvt.f32.f64	s15, d7
	vstr.32	s15, [fp, #-12]
	ldr	r3, [fp, #-44]
	add	r3, r3, #12
	ldr	r3, [r3]
	mov	r0, r3
	bl	atof
	vmov.f64	d7, d0
	vcvt.f32.f64	s15, d7
	vstr.32	s15, [fp, #-16]
	ldr	r3, [fp, #-44]
	add	r3, r3, #16
	ldr	r3, [r3]
	mov	r0, r3
	bl	atof
	vmov.f64	d7, d0
	vcvt.f32.f64	s15, d7
	vstr.32	s15, [fp, #-20]
	vldr.32	s15, [fp, #-12]
	vcvt.f64.f32	d7, s15
	vldr.64	d6, .L65
	vmul.f64	d6, d7, d6
	vldr.32	s15, [fp, #-16]
	vcvt.f64.f32	d7, s15
	vldr.64	d5, .L65+8
	vmul.f64	d7, d7, d5
	vadd.f64	d6, d6, d7
	vldr.32	s15, [fp, #-20]
	vcvt.f64.f32	d7, s15
	vldr.64	d5, .L65+16
	vmul.f64	d7, d7, d5
	vadd.f64	d7, d6, d7
	vldr.64	d6, .L65+24
	vcmpe.f64	d7, d6
	vmrs	APSR_nzcv, FPSCR
	ble	.L53
	vldr.64	d5, .L65+24
	b	.L5
.L53:
	vldr.32	s15, [fp, #-12]
	vcvt.f64.f32	d7, s15
	vldr.64	d6, .L65
	vmul.f64	d6, d7, d6
	vldr.32	s15, [fp, #-16]
	vcvt.f64.f32	d7, s15
	vldr.64	d5, .L65+8
	vmul.f64	d7, d7, d5
	vadd.f64	d6, d6, d7
	vldr.32	s15, [fp, #-20]
	vcvt.f64.f32	d7, s15
	vldr.64	d5, .L65+16
	vmul.f64	d7, d7, d5
	vadd.f64	d7, d6, d7
	vcmpe.f64	d7, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L54
	vldr.64	d5, .L65+32
	b	.L5
.L54:
	vldr.32	s15, [fp, #-12]
	vcvt.f64.f32	d7, s15
	vldr.64	d6, .L65
	vmul.f64	d6, d7, d6
	vldr.32	s15, [fp, #-16]
	vcvt.f64.f32	d7, s15
	vldr.64	d5, .L65+8
	vmul.f64	d7, d7, d5
	vadd.f64	d6, d6, d7
	vldr.32	s15, [fp, #-20]
	vcvt.f64.f32	d7, s15
	vldr.64	d5, .L65+16
	vmul.f64	d7, d7, d5
	vadd.f64	d5, d6, d7
.L5:
	vldr.32	s15, [fp, #-12]
	vcvt.f64.f32	d7, s15
	vldr.64	d6, .L65+40
	vmul.f64	d7, d7, d6
	vldr.64	d6, .L65+48
	vsub.f64	d6, d6, d7
	vldr.32	s15, [fp, #-16]
	vcvt.f64.f32	d7, s15
	vldr.64	d4, .L65+56
	vmul.f64	d7, d7, d4
	vsub.f64	d6, d6, d7
	vldr.32	s15, [fp, #-20]
	vcvt.f64.f32	d7, s15
	vmov.f64	d4, #5.0e-1
	vmul.f64	d7, d7, d4
	vadd.f64	d7, d6, d7
	vldr.64	d6, .L65+24
	vcmpe.f64	d7, d6
	vmrs	APSR_nzcv, FPSCR
	ble	.L55
	vldr.64	d7, .L65+24
	b	.L11
.L55:
	vldr.32	s15, [fp, #-12]
	vcvt.f64.f32	d7, s15
	vldr.64	d6, .L65+40
	vmul.f64	d7, d7, d6
	vldr.64	d6, .L65+48
	vsub.f64	d6, d6, d7
	vldr.32	s15, [fp, #-16]
	vcvt.f64.f32	d7, s15
	vldr.64	d4, .L65+56
	vmul.f64	d7, d7, d4
	vsub.f64	d6, d6, d7
	vldr.32	s15, [fp, #-20]
	vcvt.f64.f32	d7, s15
	vmov.f64	d4, #5.0e-1
	vmul.f64	d7, d7, d4
	vadd.f64	d7, d6, d7
	vcmpe.f64	d7, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L56
	vldr.64	d7, .L65+32
	b	.L11
.L56:
	vldr.32	s15, [fp, #-12]
	vcvt.f64.f32	d7, s15
	vldr.64	d6, .L65+40
	vmul.f64	d7, d7, d6
	vldr.64	d6, .L65+48
	vsub.f64	d6, d6, d7
	vldr.32	s15, [fp, #-16]
	vcvt.f64.f32	d7, s15
	vldr.64	d4, .L65+56
	vmul.f64	d7, d7, d4
	vsub.f64	d6, d6, d7
	vldr.32	s15, [fp, #-20]
	vcvt.f64.f32	d7, s15
	vmov.f64	d4, #5.0e-1
	vmul.f64	d7, d7, d4
	vadd.f64	d7, d6, d7
.L11:
	vldr.32	s13, [fp, #-12]
	vcvt.f64.f32	d6, s13
	vmov.f64	d4, #5.0e-1
	vmul.f64	d6, d6, d4
	vldr.64	d4, .L65+48
	vadd.f64	d4, d6, d4
	vldr.32	s13, [fp, #-16]
	vcvt.f64.f32	d6, s13
	vldr.64	d3, .L65+64
	vmul.f64	d6, d6, d3
	vsub.f64	d4, d4, d6
	vldr.32	s13, [fp, #-20]
	vcvt.f64.f32	d6, s13
	vldr.64	d3, .L65+72
	vmul.f64	d6, d6, d3
	vsub.f64	d6, d4, d6
	vldr.64	d4, .L65+24
	vcmpe.f64	d6, d4
	vmrs	APSR_nzcv, FPSCR
	ble	.L57
	vldr.64	d6, .L65+24
	b	.L17
.L57:
	vldr.32	s13, [fp, #-12]
	vcvt.f64.f32	d6, s13
	vmov.f64	d4, #5.0e-1
	vmul.f64	d6, d6, d4
	vldr.64	d4, .L65+48
	vadd.f64	d4, d6, d4
	vldr.32	s13, [fp, #-16]
	vcvt.f64.f32	d6, s13
	vldr.64	d3, .L65+64
	vmul.f64	d6, d6, d3
	vsub.f64	d4, d4, d6
	vldr.32	s13, [fp, #-20]
	vcvt.f64.f32	d6, s13
	vldr.64	d3, .L65+72
	vmul.f64	d6, d6, d3
	vsub.f64	d6, d4, d6
	vcmpe.f64	d6, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L58
	vldr.64	d6, .L65+32
	b	.L17
.L58:
	vldr.32	s13, [fp, #-12]
	vcvt.f64.f32	d6, s13
	vmov.f64	d4, #5.0e-1
	vmul.f64	d6, d6, d4
	vldr.64	d4, .L65+48
	vadd.f64	d4, d6, d4
	vldr.32	s13, [fp, #-16]
	vcvt.f64.f32	d6, s13
	vldr.64	d3, .L65+64
	vmul.f64	d6, d6, d3
	vsub.f64	d4, d4, d6
	vldr.32	s13, [fp, #-20]
	vcvt.f64.f32	d6, s13
	vldr.64	d3, .L65+72
	vmul.f64	d6, d6, d3
	vsub.f64	d6, d4, d6
.L17:
	vstr.64	d6, [sp, #8]
	vstr.64	d7, [sp]
	vmov	r2, r3, d5
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	printf
	b	.L21
.L2:
	ldr	r3, [fp, #-44]
	add	r3, r3, #8
	ldr	r3, [r3]
	mov	r0, r3
	bl	atof
	vmov.f64	d7, d0
	vcvt.f32.f64	s15, d7
	vstr.32	s15, [fp, #-24]
	ldr	r3, [fp, #-44]
	add	r3, r3, #12
	ldr	r3, [r3]
	mov	r0, r3
	bl	atof
	vmov.f64	d7, d0
	vcvt.f32.f64	s15, d7
	vstr.32	s15, [fp, #-28]
	ldr	r3, [fp, #-44]
	add	r3, r3, #16
	ldr	r3, [r3]
	mov	r0, r3
	bl	atof
	vmov.f64	d7, d0
	vcvt.f32.f64	s15, d7
	vstr.32	s15, [fp, #-32]
	vldr.32	s15, [fp, #-24]
	vcvt.f64.f32	d6, s15
	vldr.32	s15, [fp, #-32]
	vldr.32	s14, .L65+88
	vsub.f32	s15, s15, s14
	vcvt.f64.f32	d7, s15
	vldr.64	d5, .L65+80
	vmul.f64	d7, d7, d5
	vadd.f64	d7, d6, d7
	vldr.64	d6, .L65+24
	vcmpe.f64	d7, d6
	vmrs	APSR_nzcv, FPSCR
	ble	.L59
	vldr.64	d5, .L65+24
	b	.L24
.L59:
	vldr.32	s15, [fp, #-24]
	vcvt.f64.f32	d6, s15
	vldr.32	s15, [fp, #-32]
	vldr.32	s14, .L65+88
	vsub.f32	s15, s15, s14
	vcvt.f64.f32	d7, s15
	vldr.64	d5, .L65+80
	vmul.f64	d7, d7, d5
	vadd.f64	d7, d6, d7
	vcmpe.f64	d7, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L60
	vldr.64	d5, .L65+32
	b	.L24
.L66:
	.align	3
.L65:
	.word	-446676599
	.word	1070801616
	.word	962072674
	.word	1071827124
	.word	-1614907703
	.word	1069362970
	.word	0
	.word	1081073664
	.word	0
	.word	0
	.word	684995744
	.word	1069914404
	.word	0
	.word	1080033280
	.word	-342497872
	.word	1070936941
	.word	-1060204087
	.word	1071303624
	.word	-54150948
	.word	1068814556
	.word	-1924145349
	.word	1073114775
	.word	1124073472
.L60:
	vldr.32	s15, [fp, #-24]
	vcvt.f64.f32	d6, s15
	vldr.32	s15, [fp, #-32]
	vldr.32	s14, .L65+88
	vsub.f32	s15, s15, s14
	vcvt.f64.f32	d7, s15
	vldr.64	d5, .L67
	vmul.f64	d7, d7, d5
	vadd.f64	d5, d6, d7
.L24:
	vldr.32	s15, [fp, #-24]
	vcvt.f64.f32	d6, s15
	vldr.32	s15, [fp, #-28]
	vldr.32	s14, .L67+48
	vsub.f32	s15, s15, s14
	vcvt.f64.f32	d7, s15
	vldr.64	d4, .L67+8
	vmul.f64	d7, d7, d4
	vsub.f64	d6, d6, d7
	vldr.32	s15, [fp, #-32]
	vldr.32	s14, .L67+48
	vsub.f32	s15, s15, s14
	vcvt.f64.f32	d7, s15
	vldr.64	d4, .L67+16
	vmul.f64	d7, d7, d4
	vsub.f64	d7, d6, d7
	vldr.64	d6, .L67+24
	vcmpe.f64	d7, d6
	vmrs	APSR_nzcv, FPSCR
	ble	.L61
	vldr.64	d7, .L67+24
	b	.L30
.L61:
	vldr.32	s15, [fp, #-24]
	vcvt.f64.f32	d6, s15
	vldr.32	s15, [fp, #-28]
	vldr.32	s14, .L67+48
	vsub.f32	s15, s15, s14
	vcvt.f64.f32	d7, s15
	vldr.64	d4, .L67+8
	vmul.f64	d7, d7, d4
	vsub.f64	d6, d6, d7
	vldr.32	s15, [fp, #-32]
	vldr.32	s14, .L67+48
	vsub.f32	s15, s15, s14
	vcvt.f64.f32	d7, s15
	vldr.64	d4, .L67+16
	vmul.f64	d7, d7, d4
	vsub.f64	d7, d6, d7
	vcmpe.f64	d7, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L62
	vldr.64	d7, .L67+32
	b	.L30
.L62:
	vldr.32	s15, [fp, #-24]
	vcvt.f64.f32	d6, s15
	vldr.32	s15, [fp, #-28]
	vldr.32	s14, .L67+48
	vsub.f32	s15, s15, s14
	vcvt.f64.f32	d7, s15
	vldr.64	d4, .L67+8
	vmul.f64	d7, d7, d4
	vsub.f64	d6, d6, d7
	vldr.32	s15, [fp, #-32]
	vldr.32	s14, .L67+48
	vsub.f32	s15, s15, s14
	vcvt.f64.f32	d7, s15
	vldr.64	d4, .L67+16
	vmul.f64	d7, d7, d4
	vsub.f64	d7, d6, d7
.L30:
	vldr.32	s13, [fp, #-24]
	vcvt.f64.f32	d4, s13
	vldr.32	s13, [fp, #-28]
	vldr.32	s12, .L67+48
	vsub.f32	s13, s13, s12
	vcvt.f64.f32	d6, s13
	vldr.64	d3, .L67+40
	vmul.f64	d6, d6, d3
	vadd.f64	d6, d4, d6
	vldr.64	d4, .L67+24
	vcmpe.f64	d6, d4
	vmrs	APSR_nzcv, FPSCR
	ble	.L63
	vldr.64	d6, .L67+24
	b	.L36
.L63:
	vldr.32	s13, [fp, #-24]
	vcvt.f64.f32	d4, s13
	vldr.32	s13, [fp, #-28]
	vldr.32	s12, .L67+48
	vsub.f32	s13, s13, s12
	vcvt.f64.f32	d6, s13
	vldr.64	d3, .L67+40
	vmul.f64	d6, d6, d3
	vadd.f64	d6, d4, d6
	vcmpe.f64	d6, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L64
	vldr.64	d6, .L67+32
	b	.L36
.L64:
	vldr.32	s13, [fp, #-24]
	vcvt.f64.f32	d4, s13
	vldr.32	s13, [fp, #-28]
	vldr.32	s12, .L67+48
	vsub.f32	s13, s13, s12
	vcvt.f64.f32	d6, s13
	vldr.64	d3, .L67+40
	vmul.f64	d6, d6, d3
	vadd.f64	d6, d4, d6
.L36:
	vstr.64	d6, [sp, #8]
	vstr.64	d7, [sp]
	vmov	r2, r3, d5
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	printf
.L21:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L68:
	.align	3
.L67:
	.word	-1924145349
	.word	1073114775
	.word	5772436
	.word	1070990931
	.word	-1113805279
	.word	1072093747
	.word	0
	.word	1081073664
	.word	0
	.word	0
	.word	-1408749273
	.word	1073502748
	.word	1124073472
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
