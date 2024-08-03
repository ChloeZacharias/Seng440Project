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
	.file	"conversion_v2.c"
	.text
	.align	2
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	in_bounds, %function
in_bounds:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	vstr.32	s0, [fp, #-8]
	vldr.32	s15, [fp, #-8]
	vldr.32	s14, .L11
	vcmpe.f32	s15, s14
	vmrs	APSR_nzcv, FPSCR
	ble	.L9
	mov	r3, #0
	movt	r3, 17279
	b	.L4
.L9:
	vldr.32	s15, [fp, #-8]
	vcmpe.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L10
	mov	r3, #0
	b	.L4
.L10:
	ldr	r3, [fp, #-8]	@ float
.L4:
	vmov	s15, r3
	vmov.f32	s0, s15
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L12:
	.align	2
.L11:
	.word	1132396544
	.size	in_bounds, .-in_bounds
	.section	.rodata
	.align	2
.LC0:
	.ascii	"YCC %.0f %.0f %.0f\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	rgb_to_ycc, %function
rgb_to_ycc:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	vpush.64	{d8, d9}
	add	fp, sp, #20
	sub	sp, sp, #48
	vstr.32	s0, [fp, #-40]
	vstr.32	s1, [fp, #-44]
	vstr.32	s2, [fp, #-48]
	vldr.32	s15, [fp, #-40]
	vcvt.f64.f32	d7, s15
	vldr.64	d6, .L14
	vmul.f64	d6, d7, d6
	vldr.32	s15, [fp, #-44]
	vcvt.f64.f32	d7, s15
	vldr.64	d5, .L14+8
	vmul.f64	d7, d7, d5
	vadd.f64	d6, d6, d7
	vldr.32	s15, [fp, #-48]
	vcvt.f64.f32	d7, s15
	vldr.64	d5, .L14+16
	vmul.f64	d7, d7, d5
	vadd.f64	d7, d6, d7
	vcvt.f32.f64	s15, d7
	vstr.32	s15, [fp, #-24]
	vldr.32	s15, [fp, #-40]
	vcvt.f64.f32	d7, s15
	vldr.64	d6, .L14+24
	vmul.f64	d7, d7, d6
	vldr.64	d6, .L14+32
	vsub.f64	d6, d6, d7
	vldr.32	s15, [fp, #-44]
	vcvt.f64.f32	d7, s15
	vldr.64	d5, .L14+40
	vmul.f64	d7, d7, d5
	vsub.f64	d6, d6, d7
	vldr.32	s15, [fp, #-48]
	vcvt.f64.f32	d7, s15
	vmov.f64	d5, #5.0e-1
	vmul.f64	d7, d7, d5
	vadd.f64	d7, d6, d7
	vcvt.f32.f64	s15, d7
	vstr.32	s15, [fp, #-28]
	vldr.32	s15, [fp, #-40]
	vcvt.f64.f32	d7, s15
	vmov.f64	d6, #5.0e-1
	vmul.f64	d7, d7, d6
	vldr.64	d6, .L14+32
	vadd.f64	d6, d7, d6
	vldr.32	s15, [fp, #-44]
	vcvt.f64.f32	d7, s15
	vldr.64	d5, .L14+48
	vmul.f64	d7, d7, d5
	vsub.f64	d6, d6, d7
	vldr.32	s15, [fp, #-48]
	vcvt.f64.f32	d7, s15
	vldr.64	d5, .L14+56
	vmul.f64	d7, d7, d5
	vsub.f64	d7, d6, d7
	vcvt.f32.f64	s15, d7
	vstr.32	s15, [fp, #-32]
	vldr.32	s0, [fp, #-24]
	bl	in_bounds
	vmov.f32	s15, s0
	vcvt.f64.f32	d9, s15
	vldr.32	s0, [fp, #-28]
	bl	in_bounds
	vmov.f32	s15, s0
	vcvt.f64.f32	d8, s15
	vldr.32	s0, [fp, #-32]
	bl	in_bounds
	vmov.f32	s15, s0
	vcvt.f64.f32	d7, s15
	vstr.64	d7, [sp, #8]
	vstr.64	d8, [sp]
	vmov	r2, r3, d9
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	printf
	nop
	sub	sp, fp, #20
	@ sp needed
	vldm	sp!, {d8-d9}
	pop	{fp, pc}
.L15:
	.align	3
.L14:
	.word	-446676599
	.word	1070801616
	.word	962072674
	.word	1071827124
	.word	-1614907703
	.word	1069362970
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
	.size	rgb_to_ycc, .-rgb_to_ycc
	.section	.rodata
	.align	2
.LC1:
	.ascii	"RGB %.0f %.0f %.0f\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	ycc_to_rgb, %function
ycc_to_rgb:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	vpush.64	{d8, d9}
	add	fp, sp, #20
	sub	sp, sp, #48
	vstr.32	s0, [fp, #-40]
	vstr.32	s1, [fp, #-44]
	vstr.32	s2, [fp, #-48]
	vldr.32	s15, [fp, #-40]
	vcvt.f64.f32	d6, s15
	vldr.32	s15, [fp, #-48]
	vldr.32	s14, .L17+32
	vsub.f32	s15, s15, s14
	vcvt.f64.f32	d7, s15
	vldr.64	d5, .L17
	vmul.f64	d7, d7, d5
	vadd.f64	d7, d6, d7
	vcvt.f32.f64	s15, d7
	vstr.32	s15, [fp, #-24]
	vldr.32	s15, [fp, #-40]
	vcvt.f64.f32	d6, s15
	vldr.32	s15, [fp, #-44]
	vldr.32	s14, .L17+32
	vsub.f32	s15, s15, s14
	vcvt.f64.f32	d7, s15
	vldr.64	d5, .L17+8
	vmul.f64	d7, d7, d5
	vsub.f64	d6, d6, d7
	vldr.32	s15, [fp, #-48]
	vldr.32	s14, .L17+32
	vsub.f32	s15, s15, s14
	vcvt.f64.f32	d7, s15
	vldr.64	d5, .L17+16
	vmul.f64	d7, d7, d5
	vsub.f64	d7, d6, d7
	vcvt.f32.f64	s15, d7
	vstr.32	s15, [fp, #-28]
	vldr.32	s15, [fp, #-40]
	vcvt.f64.f32	d6, s15
	vldr.32	s15, [fp, #-44]
	vldr.32	s14, .L17+32
	vsub.f32	s15, s15, s14
	vcvt.f64.f32	d7, s15
	vldr.64	d5, .L17+24
	vmul.f64	d7, d7, d5
	vadd.f64	d7, d6, d7
	vcvt.f32.f64	s15, d7
	vstr.32	s15, [fp, #-32]
	vldr.32	s0, [fp, #-24]
	bl	in_bounds
	vmov.f32	s15, s0
	vcvt.f64.f32	d9, s15
	vldr.32	s0, [fp, #-28]
	bl	in_bounds
	vmov.f32	s15, s0
	vcvt.f64.f32	d8, s15
	vldr.32	s0, [fp, #-32]
	bl	in_bounds
	vmov.f32	s15, s0
	vcvt.f64.f32	d7, s15
	vstr.64	d7, [sp, #8]
	vstr.64	d8, [sp]
	vmov	r2, r3, d9
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	printf
	nop
	sub	sp, fp, #20
	@ sp needed
	vldm	sp!, {d8-d9}
	pop	{fp, pc}
.L18:
	.align	3
.L17:
	.word	-1924145349
	.word	1073114775
	.word	5772436
	.word	1070990931
	.word	-1113805279
	.word	1072093747
	.word	-1408749273
	.word	1073502748
	.word	1124073472
	.size	ycc_to_rgb, .-ycc_to_rgb
	.section	.rodata
	.align	2
.LC2:
	.ascii	"RGB\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
	movw	r1, #:lower16:.LC2
	movt	r1, #:upper16:.LC2
	ldr	r0, [fp, #-8]
	bl	strcmp
	mov	r3, r0
	cmp	r3, #0
	bne	.L20
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
	vldr.32	s2, [fp, #-20]
	vldr.32	s1, [fp, #-16]
	vldr.32	s0, [fp, #-12]
	bl	rgb_to_ycc
	b	.L21
.L20:
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
	vldr.32	s2, [fp, #-32]
	vldr.32	s1, [fp, #-28]
	vldr.32	s0, [fp, #-24]
	bl	ycc_to_rgb
.L21:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
