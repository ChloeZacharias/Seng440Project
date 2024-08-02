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
	.file	"CSC_YCC_to_RGB_01.c"
	.text
	.align	2
	.arch armv7-a
	.syntax unified
	.arm
	.fpu neon
	.type	saturation_float, %function
saturation_float:
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
	mov	r3, #255
	b	.L4
.L9:
	vldr.32	s15, [fp, #-8]
	vcmpe.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L10
	mov	r3, #0
	b	.L4
.L10:
	vldr.32	s15, [fp, #-8]
	vcvt.u32.f32	s15, s15
	vstr.32	s15, [fp, #-12]	@ int
	ldr	r3, [fp, #-12]
	uxtb	r3, r3
.L4:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L12:
	.align	2
.L11:
	.word	1132396544
	.size	saturation_float, .-saturation_float
	.align	2
	.syntax unified
	.arm
	.fpu neon
	.type	CSC_YCC_to_RGB_brute_force_float, %function
CSC_YCC_to_RGB_brute_force_float:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #56
	str	r0, [fp, #-64]
	str	r1, [fp, #-68]
	bl	chrominance_array_upsample
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	ldr	r1, [fp, #-64]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vmov.f64	d17, #1.6e+1
	vsub.f64	d16, d16, d17
	vldr.64	d17, .L14
	vmul.f64	d17, d16, d17
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	ldr	r1, [fp, #-64]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L14+32
	vsub.f64	d16, d16, d18
	vldr.64	d18, .L14+8
	vmul.f64	d16, d16, d18
	vadd.f64	d16, d17, d16
	vcvt.f32.f64	s15, d16
	vstr.32	s15, [fp, #-16]
	vldr.32	s0, [fp, #-16]
	bl	saturation_float
	mov	r3, r0
	mov	r0, r3
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	ldr	r1, [fp, #-64]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-68]
	add	r0, r3, #1
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	ldr	r1, [fp, #-64]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vmov.f64	d17, #1.6e+1
	vsub.f64	d16, d16, d17
	vldr.64	d17, .L14
	vmul.f64	d17, d16, d17
	ldr	r3, [fp, #-68]
	add	r0, r3, #1
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	ldr	r1, [fp, #-64]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L14+32
	vsub.f64	d16, d16, d18
	vldr.64	d18, .L14+8
	vmul.f64	d16, d16, d18
	vadd.f64	d16, d17, d16
	vcvt.f32.f64	s15, d16
	vstr.32	s15, [fp, #-20]
	ldr	r3, [fp, #-68]
	add	r4, r3, #1
	vldr.32	s0, [fp, #-20]
	bl	saturation_float
	mov	r3, r0
	mov	r0, r3
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	ldr	r1, [fp, #-64]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r4
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-64]
	add	r1, r3, #1
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vmov.f64	d17, #1.6e+1
	vsub.f64	d16, d16, d17
	vldr.64	d17, .L14
	vmul.f64	d17, d16, d17
	ldr	r3, [fp, #-64]
	add	r1, r3, #1
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L14+32
	vsub.f64	d16, d16, d18
	vldr.64	d18, .L14+8
	vmul.f64	d16, d16, d18
	vadd.f64	d16, d17, d16
	vcvt.f32.f64	s15, d16
	vstr.32	s15, [fp, #-24]
	ldr	r3, [fp, #-64]
	add	r4, r3, #1
	vldr.32	s0, [fp, #-24]
	bl	saturation_float
	mov	r3, r0
	mov	r1, r3
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	mov	r3, r4
	lsl	r3, r3, #1
	add	r3, r3, r4
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	mov	r2, r1
	strb	r2, [r3]
	ldr	r3, [fp, #-64]
	add	r1, r3, #1
	ldr	r3, [fp, #-68]
	add	r0, r3, #1
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vmov.f64	d17, #1.6e+1
	vsub.f64	d16, d16, d17
	vldr.64	d17, .L14
	vmul.f64	d17, d16, d17
	ldr	r3, [fp, #-64]
	add	r1, r3, #1
	ldr	r3, [fp, #-68]
	add	r0, r3, #1
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L14+32
	vsub.f64	d16, d16, d18
	vldr.64	d18, .L14+8
	vmul.f64	d16, d16, d18
	vadd.f64	d16, d17, d16
	vcvt.f32.f64	s15, d16
	vstr.32	s15, [fp, #-28]
	ldr	r3, [fp, #-64]
	add	r4, r3, #1
	ldr	r3, [fp, #-68]
	add	r5, r3, #1
	vldr.32	s0, [fp, #-28]
	bl	saturation_float
	mov	r3, r0
	mov	r1, r3
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	mov	r3, r4
	lsl	r3, r3, #1
	add	r3, r3, r4
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r5
	mov	r2, r1
	strb	r2, [r3]
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	ldr	r1, [fp, #-64]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vmov.f64	d17, #1.6e+1
	vsub.f64	d16, d16, d17
	vldr.64	d17, .L14
	vmul.f64	d17, d16, d17
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	ldr	r1, [fp, #-64]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L14+32
	vsub.f64	d16, d16, d18
	vldr.64	d18, .L14+24
	vmul.f64	d16, d16, d18
	vsub.f64	d17, d17, d16
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	ldr	r1, [fp, #-64]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	b	.L15
.L16:
	.align	3
.L14:
	.word	1992864825
	.word	1072865214
	.word	1271310320
	.word	1073318199
	.word	1992864825
	.word	1072865214
	.word	-1821066134
	.word	1072301080
	.word	0
	.word	1080033280
	.word	-584115552
	.word	1071187492
.L15:
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L14+32
	vsub.f64	d16, d16, d18
	vldr.64	d18, .L14+40
	vmul.f64	d16, d16, d18
	vsub.f64	d16, d17, d16
	vcvt.f32.f64	s15, d16
	vstr.32	s15, [fp, #-32]
	vldr.32	s0, [fp, #-32]
	bl	saturation_float
	mov	r3, r0
	mov	r0, r3
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	ldr	r1, [fp, #-64]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-68]
	add	r0, r3, #1
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	ldr	r1, [fp, #-64]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vmov.f64	d17, #1.6e+1
	vsub.f64	d16, d16, d17
	vldr.64	d17, .L14+16
	vmul.f64	d17, d16, d17
	ldr	r3, [fp, #-68]
	add	r0, r3, #1
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	ldr	r1, [fp, #-64]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L14+32
	vsub.f64	d16, d16, d18
	vldr.64	d18, .L14+24
	vmul.f64	d16, d16, d18
	vsub.f64	d17, d17, d16
	ldr	r3, [fp, #-68]
	add	r0, r3, #1
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	ldr	r1, [fp, #-64]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L14+32
	vsub.f64	d16, d16, d18
	vldr.64	d18, .L14+40
	vmul.f64	d16, d16, d18
	vsub.f64	d16, d17, d16
	vcvt.f32.f64	s15, d16
	vstr.32	s15, [fp, #-36]
	ldr	r3, [fp, #-68]
	add	r4, r3, #1
	vldr.32	s0, [fp, #-36]
	bl	saturation_float
	mov	r3, r0
	mov	r0, r3
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	ldr	r1, [fp, #-64]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r4
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-64]
	add	r1, r3, #1
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vmov.f64	d17, #1.6e+1
	vsub.f64	d16, d16, d17
	vldr.64	d17, .L14+16
	vmul.f64	d17, d16, d17
	ldr	r3, [fp, #-64]
	add	r1, r3, #1
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L14+32
	vsub.f64	d16, d16, d18
	vldr.64	d18, .L14+24
	vmul.f64	d16, d16, d18
	vsub.f64	d17, d17, d16
	ldr	r3, [fp, #-64]
	add	r1, r3, #1
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L14+32
	vsub.f64	d16, d16, d18
	vldr.64	d18, .L14+40
	vmul.f64	d16, d16, d18
	vsub.f64	d16, d17, d16
	vcvt.f32.f64	s15, d16
	vstr.32	s15, [fp, #-40]
	ldr	r3, [fp, #-64]
	add	r4, r3, #1
	vldr.32	s0, [fp, #-40]
	bl	saturation_float
	mov	r3, r0
	mov	r1, r3
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	mov	r3, r4
	lsl	r3, r3, #1
	add	r3, r3, r4
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	mov	r2, r1
	strb	r2, [r3]
	ldr	r3, [fp, #-64]
	add	r1, r3, #1
	ldr	r3, [fp, #-68]
	add	r0, r3, #1
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vmov.f64	d17, #1.6e+1
	vsub.f64	d16, d16, d17
	vldr.64	d17, .L14+16
	vmul.f64	d17, d16, d17
	ldr	r3, [fp, #-64]
	add	r1, r3, #1
	ldr	r3, [fp, #-68]
	add	r0, r3, #1
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L14+32
	vsub.f64	d16, d16, d18
	vldr.64	d18, .L14+24
	vmul.f64	d16, d16, d18
	vsub.f64	d17, d17, d16
	ldr	r3, [fp, #-64]
	add	r1, r3, #1
	ldr	r3, [fp, #-68]
	add	r0, r3, #1
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L14+32
	vsub.f64	d16, d16, d18
	vldr.64	d18, .L14+40
	vmul.f64	d16, d16, d18
	vsub.f64	d16, d17, d16
	vcvt.f32.f64	s15, d16
	vstr.32	s15, [fp, #-44]
	ldr	r3, [fp, #-64]
	add	r4, r3, #1
	ldr	r3, [fp, #-68]
	add	r5, r3, #1
	vldr.32	s0, [fp, #-44]
	bl	saturation_float
	mov	r3, r0
	mov	r1, r3
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	mov	r3, r4
	lsl	r3, r3, #1
	add	r3, r3, r4
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r5
	mov	r2, r1
	strb	r2, [r3]
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	ldr	r1, [fp, #-64]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vmov.f64	d17, #1.6e+1
	vsub.f64	d16, d16, d17
	vldr.64	d17, .L17
	vmul.f64	d17, d16, d17
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	ldr	r1, [fp, #-64]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L17+8
	vsub.f64	d16, d16, d18
	vldr.64	d18, .L17+16
	vmul.f64	d16, d16, d18
	vadd.f64	d16, d17, d16
	vcvt.f32.f64	s15, d16
	vstr.32	s15, [fp, #-48]
	vldr.32	s0, [fp, #-48]
	bl	saturation_float
	mov	r3, r0
	mov	r0, r3
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	ldr	r1, [fp, #-64]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-68]
	add	r0, r3, #1
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	ldr	r1, [fp, #-64]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vmov.f64	d17, #1.6e+1
	vsub.f64	d16, d16, d17
	vldr.64	d17, .L17
	vmul.f64	d17, d16, d17
	ldr	r3, [fp, #-68]
	add	r0, r3, #1
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	ldr	r1, [fp, #-64]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L17+8
	vsub.f64	d16, d16, d18
	vldr.64	d18, .L17+16
	vmul.f64	d16, d16, d18
	vadd.f64	d16, d17, d16
	vcvt.f32.f64	s15, d16
	vstr.32	s15, [fp, #-52]
	ldr	r3, [fp, #-68]
	add	r4, r3, #1
	vldr.32	s0, [fp, #-52]
	bl	saturation_float
	mov	r3, r0
	mov	r0, r3
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	ldr	r1, [fp, #-64]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r4
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-64]
	add	r1, r3, #1
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vmov.f64	d17, #1.6e+1
	vsub.f64	d16, d16, d17
	vldr.64	d17, .L17
	vmul.f64	d17, d16, d17
	ldr	r3, [fp, #-64]
	add	r1, r3, #1
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L17+8
	vsub.f64	d16, d16, d18
	vldr.64	d18, .L17+16
	vmul.f64	d16, d16, d18
	vadd.f64	d16, d17, d16
	vcvt.f32.f64	s15, d16
	vstr.32	s15, [fp, #-56]
	ldr	r3, [fp, #-64]
	add	r4, r3, #1
	vldr.32	s0, [fp, #-56]
	bl	saturation_float
	mov	r3, r0
	mov	r1, r3
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	mov	r3, r4
	lsl	r3, r3, #1
	add	r3, r3, r4
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	mov	r2, r1
	strb	r2, [r3]
	ldr	r3, [fp, #-64]
	add	r1, r3, #1
	ldr	r3, [fp, #-68]
	add	r0, r3, #1
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vmov.f64	d17, #1.6e+1
	vsub.f64	d16, d16, d17
	vldr.64	d17, .L17
	vmul.f64	d17, d16, d17
	ldr	r3, [fp, #-64]
	add	r1, r3, #1
	ldr	r3, [fp, #-68]
	add	r0, r3, #1
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L17+8
	vsub.f64	d16, d16, d18
	vldr.64	d18, .L17+16
	vmul.f64	d16, d16, d18
	vadd.f64	d16, d17, d16
	vcvt.f32.f64	s15, d16
	vstr.32	s15, [fp, #-60]
	ldr	r3, [fp, #-64]
	add	r4, r3, #1
	ldr	r3, [fp, #-68]
	add	r5, r3, #1
	vldr.32	s0, [fp, #-60]
	bl	saturation_float
	mov	r3, r0
	mov	r1, r3
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	mov	r3, r4
	lsl	r3, r3, #1
	add	r3, r3, r4
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r5
	mov	r2, r1
	strb	r2, [r3]
	nop
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, pc}
.L18:
	.align	3
.L17:
	.word	1992864825
	.word	1072865214
	.word	0
	.word	1080033280
	.word	790273982
	.word	1073751261
	.size	CSC_YCC_to_RGB_brute_force_float, .-CSC_YCC_to_RGB_brute_force_float
	.align	2
	.syntax unified
	.arm
	.fpu neon
	.type	saturation_int, %function
saturation_int:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #255
	ble	.L20
	mov	r3, #255
	b	.L21
.L20:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L22
	mov	r3, #0
	b	.L21
.L22:
	ldr	r3, [fp, #-8]
	uxtb	r3, r3
.L21:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	saturation_int, .-saturation_int
	.align	2
	.syntax unified
	.arm
	.fpu neon
	.type	CSC_YCC_to_RGB_brute_force_int, %function
CSC_YCC_to_RGB_brute_force_int:
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #104
	str	r0, [fp, #-104]
	str	r1, [fp, #-108]
	bl	chrominance_array_upsample
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	ldr	r1, [fp, #-104]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-108]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-108]
	add	r0, r3, #1
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	ldr	r1, [fp, #-104]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-104]
	add	r1, r3, #1
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-108]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-104]
	add	r1, r3, #1
	ldr	r3, [fp, #-108]
	add	r0, r3, #1
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-20]
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	ldr	r1, [fp, #-104]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-108]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-108]
	add	r0, r3, #1
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	ldr	r1, [fp, #-104]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-104]
	add	r1, r3, #1
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-108]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-104]
	add	r1, r3, #1
	ldr	r3, [fp, #-108]
	add	r0, r3, #1
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-36]
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	ldr	r1, [fp, #-104]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-108]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-108]
	add	r0, r3, #1
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	ldr	r1, [fp, #-104]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-104]
	add	r1, r3, #1
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-108]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-104]
	add	r1, r3, #1
	ldr	r3, [fp, #-108]
	add	r0, r3, #1
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #16
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #16
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #16
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #16
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #128
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	sub	r3, r3, #128
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	sub	r3, r3, #128
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-36]
	sub	r3, r3, #128
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	sub	r3, r3, #128
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #128
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-48]
	sub	r3, r3, #128
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-52]
	sub	r3, r3, #128
	str	r3, [fp, #-52]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r1, r3
	ldr	r2, [fp, #-40]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r2, r3, #4
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r1, r3
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-56]
	add	r3, r3, #128
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-56]
	asr	r3, r3, #8
	str	r3, [fp, #-56]
	ldr	r2, [fp, #-12]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r1, r3
	ldr	r2, [fp, #-44]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r2, r3, #4
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r1, r3
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-60]
	add	r3, r3, #128
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-60]
	asr	r3, r3, #8
	str	r3, [fp, #-60]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r1, r3
	ldr	r2, [fp, #-48]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r2, r3, #4
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r1, r3
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-64]
	add	r3, r3, #128
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-64]
	asr	r3, r3, #8
	str	r3, [fp, #-64]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r1, r3
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r2, r3, #4
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r1, r3
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-68]
	add	r3, r3, #128
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-68]
	asr	r3, r3, #8
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-56]
	uxtb	r0, r3
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	ldr	r1, [fp, #-104]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-108]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-108]
	add	r0, r3, #1
	ldr	r3, [fp, #-60]
	uxtb	ip, r3
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	ldr	r1, [fp, #-104]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r3, [fp, #-104]
	add	r1, r3, #1
	ldr	r3, [fp, #-64]
	uxtb	r0, r3
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-108]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-104]
	add	r1, r3, #1
	ldr	r3, [fp, #-108]
	add	r0, r3, #1
	ldr	r3, [fp, #-68]
	uxtb	ip, r3
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r1, r3
	ldr	r3, [fp, #-40]
	mvn	r2, #51
	mul	r3, r2, r3
	add	r1, r1, r3
	ldr	r2, [fp, #-24]
	mov	r3, r2
	lsl	r3, r3, #27
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	add	r3, r1, r3
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-72]
	add	r3, r3, #128
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-72]
	asr	r3, r3, #8
	str	r3, [fp, #-72]
	ldr	r2, [fp, #-12]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r1, r3
	ldr	r3, [fp, #-44]
	mvn	r2, #51
	mul	r3, r2, r3
	add	r1, r1, r3
	ldr	r2, [fp, #-28]
	mov	r3, r2
	lsl	r3, r3, #27
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	add	r3, r1, r3
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-76]
	add	r3, r3, #128
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-76]
	asr	r3, r3, #8
	str	r3, [fp, #-76]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r1, r3
	ldr	r3, [fp, #-48]
	mvn	r2, #51
	mul	r3, r2, r3
	add	r1, r1, r3
	ldr	r2, [fp, #-32]
	mov	r3, r2
	lsl	r3, r3, #27
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	add	r3, r1, r3
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-80]
	add	r3, r3, #128
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-80]
	asr	r3, r3, #8
	str	r3, [fp, #-80]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r1, r3
	ldr	r3, [fp, #-52]
	mvn	r2, #51
	mul	r3, r2, r3
	add	r1, r1, r3
	ldr	r2, [fp, #-36]
	mov	r3, r2
	lsl	r3, r3, #27
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	add	r3, r1, r3
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-84]
	add	r3, r3, #128
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-84]
	asr	r3, r3, #8
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-72]
	uxtb	r0, r3
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	ldr	r1, [fp, #-104]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-108]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-108]
	add	r0, r3, #1
	ldr	r3, [fp, #-76]
	uxtb	ip, r3
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	ldr	r1, [fp, #-104]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r3, [fp, #-104]
	add	r1, r3, #1
	ldr	r3, [fp, #-80]
	uxtb	r0, r3
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-108]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-104]
	add	r1, r3, #1
	ldr	r3, [fp, #-108]
	add	r0, r3, #1
	ldr	r3, [fp, #-84]
	uxtb	ip, r3
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r1, r3
	ldr	r2, [fp, #-24]
	mov	r3, r2
	lsl	r3, r3, #7
	add	r3, r3, r2
	add	r3, r1, r3
	str	r3, [fp, #-88]
	ldr	r3, [fp, #-88]
	add	r3, r3, #128
	str	r3, [fp, #-88]
	ldr	r3, [fp, #-88]
	asr	r3, r3, #8
	str	r3, [fp, #-88]
	ldr	r2, [fp, #-12]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r1, r3
	ldr	r2, [fp, #-28]
	mov	r3, r2
	lsl	r3, r3, #7
	add	r3, r3, r2
	add	r3, r1, r3
	str	r3, [fp, #-92]
	ldr	r3, [fp, #-92]
	add	r3, r3, #128
	str	r3, [fp, #-92]
	ldr	r3, [fp, #-92]
	asr	r3, r3, #8
	str	r3, [fp, #-92]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r1, r3
	ldr	r2, [fp, #-32]
	mov	r3, r2
	lsl	r3, r3, #7
	add	r3, r3, r2
	add	r3, r1, r3
	str	r3, [fp, #-96]
	ldr	r3, [fp, #-96]
	add	r3, r3, #128
	str	r3, [fp, #-96]
	ldr	r3, [fp, #-96]
	asr	r3, r3, #8
	str	r3, [fp, #-96]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r1, r3
	ldr	r2, [fp, #-36]
	mov	r3, r2
	lsl	r3, r3, #7
	add	r3, r3, r2
	add	r3, r1, r3
	str	r3, [fp, #-100]
	ldr	r3, [fp, #-100]
	add	r3, r3, #128
	str	r3, [fp, #-100]
	ldr	r3, [fp, #-100]
	asr	r3, r3, #8
	str	r3, [fp, #-100]
	ldr	r3, [fp, #-88]
	uxtb	r0, r3
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	ldr	r1, [fp, #-104]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-108]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-108]
	add	r0, r3, #1
	ldr	r3, [fp, #-92]
	uxtb	ip, r3
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	ldr	r1, [fp, #-104]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r3, [fp, #-104]
	add	r1, r3, #1
	ldr	r3, [fp, #-96]
	uxtb	r0, r3
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-108]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-104]
	add	r1, r3, #1
	ldr	r3, [fp, #-108]
	add	r0, r3, #1
	ldr	r3, [fp, #-100]
	uxtb	ip, r3
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	CSC_YCC_to_RGB_brute_force_int, .-CSC_YCC_to_RGB_brute_force_int
	.align	2
	.syntax unified
	.arm
	.fpu neon
	.type	chrominance_upsample, %function
chrominance_upsample:
	@ args = 12, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	ip, r0
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, ip
	strb	r3, [fp, #-5]
	mov	r3, r0
	strb	r3, [fp, #-6]
	mov	r3, r1
	strb	r3, [fp, #-7]
	mov	r3, r2
	strb	r3, [fp, #-8]
	ldr	r3, [fp, #4]
	ldrb	r2, [fp, #-5]
	strb	r2, [r3]
	ldr	r3, [fp, #8]
	ldrb	r2, [fp, #-5]
	strb	r2, [r3]
	ldr	r3, [fp, #12]
	ldrb	r2, [fp, #-5]
	strb	r2, [r3]
	nop
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	chrominance_upsample, .-chrominance_upsample
	.align	2
	.syntax unified
	.arm
	.fpu neon
	.type	chrominance_array_upsample, %function
chrominance_array_upsample:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #36
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L26
.L29:
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L27
.L28:
	movw	r2, #:lower16:Cb
	movt	r2, #:upper16:Cb
	ldr	r1, [fp, #-16]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	ip, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-20]
	add	r0, r3, #1
	movw	r2, #:lower16:Cb
	movt	r2, #:upper16:Cb
	ldr	r1, [fp, #-16]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	lr, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	add	r1, r3, #1
	movw	r2, #:lower16:Cb
	movt	r2, #:upper16:Cb
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r4, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	add	r1, r3, #1
	ldr	r3, [fp, #-20]
	add	r0, r3, #1
	movw	r2, #:lower16:Cb
	movt	r2, #:upper16:Cb
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r2, [r3]	@ zero_extendqisi2
	sub	r3, fp, #23
	str	r3, [sp, #8]
	sub	r3, fp, #22
	str	r3, [sp, #4]
	sub	r3, fp, #21
	str	r3, [sp]
	mov	r3, r2
	mov	r2, r4
	mov	r1, lr
	mov	r0, ip
	bl	chrominance_upsample
	ldr	r3, [fp, #-16]
	lsl	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	ip, r3, #1
	movw	r2, #:lower16:Cb
	movt	r2, #:upper16:Cb
	ldr	r0, [fp, #-16]
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r0, [r3]	@ zero_extendqisi2
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, ip
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	add	r0, r3, #1
	ldrb	ip, [fp, #-21]	@ zero_extendqisi2
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	add	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r0, r3, #1
	ldrb	ip, [fp, #-22]	@ zero_extendqisi2
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	add	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	add	r0, r3, #1
	ldrb	ip, [fp, #-23]	@ zero_extendqisi2
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	movw	r2, #:lower16:Cr
	movt	r2, #:upper16:Cr
	ldr	r1, [fp, #-16]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	ip, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-20]
	add	r0, r3, #1
	movw	r2, #:lower16:Cr
	movt	r2, #:upper16:Cr
	ldr	r1, [fp, #-16]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	lr, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	add	r1, r3, #1
	movw	r2, #:lower16:Cr
	movt	r2, #:upper16:Cr
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r4, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	add	r1, r3, #1
	ldr	r3, [fp, #-20]
	add	r0, r3, #1
	movw	r2, #:lower16:Cr
	movt	r2, #:upper16:Cr
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r2, [r3]	@ zero_extendqisi2
	sub	r3, fp, #23
	str	r3, [sp, #8]
	sub	r3, fp, #22
	str	r3, [sp, #4]
	sub	r3, fp, #21
	str	r3, [sp]
	mov	r3, r2
	mov	r2, r4
	mov	r1, lr
	mov	r0, ip
	bl	chrominance_upsample
	ldr	r3, [fp, #-16]
	lsl	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	ip, r3, #1
	movw	r2, #:lower16:Cr
	movt	r2, #:upper16:Cr
	ldr	r0, [fp, #-16]
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r0, [r3]	@ zero_extendqisi2
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, ip
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	add	r0, r3, #1
	ldrb	ip, [fp, #-21]	@ zero_extendqisi2
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	add	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r0, r3, #1
	ldrb	ip, [fp, #-22]	@ zero_extendqisi2
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	add	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	add	r0, r3, #1
	ldrb	ip, [fp, #-23]	@ zero_extendqisi2
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L27:
	ldr	r3, [fp, #-20]
	cmp	r3, #22
	ble	.L28
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L26:
	ldr	r3, [fp, #-16]
	cmp	r3, #30
	ble	.L29
	mov	r3, #23
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L30
.L31:
	movw	r2, #:lower16:Cb
	movt	r2, #:upper16:Cb
	ldr	r1, [fp, #-16]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r0, [r3]	@ zero_extendqisi2
	movw	r2, #:lower16:Cb
	movt	r2, #:upper16:Cb
	ldr	r1, [fp, #-16]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	ip, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	add	r1, r3, #1
	movw	r2, #:lower16:Cb
	movt	r2, #:upper16:Cb
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	lr, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	add	r1, r3, #1
	movw	r2, #:lower16:Cb
	movt	r2, #:upper16:Cb
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	sub	r3, fp, #23
	str	r3, [sp, #8]
	sub	r3, fp, #22
	str	r3, [sp, #4]
	sub	r3, fp, #21
	str	r3, [sp]
	mov	r3, r2
	mov	r2, lr
	mov	r1, ip
	bl	chrominance_upsample
	ldr	r3, [fp, #-16]
	lsl	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	ip, r3, #1
	movw	r2, #:lower16:Cb
	movt	r2, #:upper16:Cb
	ldr	r0, [fp, #-16]
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r0, [r3]	@ zero_extendqisi2
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, ip
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	add	r0, r3, #1
	ldrb	ip, [fp, #-21]	@ zero_extendqisi2
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	add	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r0, r3, #1
	ldrb	ip, [fp, #-22]	@ zero_extendqisi2
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	add	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	add	r0, r3, #1
	ldrb	ip, [fp, #-23]	@ zero_extendqisi2
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	movw	r2, #:lower16:Cr
	movt	r2, #:upper16:Cr
	ldr	r1, [fp, #-16]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r0, [r3]	@ zero_extendqisi2
	movw	r2, #:lower16:Cr
	movt	r2, #:upper16:Cr
	ldr	r1, [fp, #-16]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	ip, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	add	r1, r3, #1
	movw	r2, #:lower16:Cr
	movt	r2, #:upper16:Cr
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	lr, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	add	r1, r3, #1
	movw	r2, #:lower16:Cr
	movt	r2, #:upper16:Cr
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	sub	r3, fp, #23
	str	r3, [sp, #8]
	sub	r3, fp, #22
	str	r3, [sp, #4]
	sub	r3, fp, #21
	str	r3, [sp]
	mov	r3, r2
	mov	r2, lr
	mov	r1, ip
	bl	chrominance_upsample
	ldr	r3, [fp, #-16]
	lsl	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	ip, r3, #1
	movw	r2, #:lower16:Cr
	movt	r2, #:upper16:Cr
	ldr	r0, [fp, #-16]
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r0, [r3]	@ zero_extendqisi2
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, ip
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	add	r0, r3, #1
	ldrb	ip, [fp, #-21]	@ zero_extendqisi2
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	add	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r0, r3, #1
	ldrb	ip, [fp, #-22]	@ zero_extendqisi2
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	add	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	add	r0, r3, #1
	ldrb	ip, [fp, #-23]	@ zero_extendqisi2
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L30:
	ldr	r3, [fp, #-16]
	cmp	r3, #30
	ble	.L31
	mov	r3, #31
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L32
.L33:
	movw	r2, #:lower16:Cb
	movt	r2, #:upper16:Cb
	ldr	r1, [fp, #-16]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	ip, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-20]
	add	r0, r3, #1
	movw	r2, #:lower16:Cb
	movt	r2, #:upper16:Cb
	ldr	r1, [fp, #-16]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	lr, [r3]	@ zero_extendqisi2
	movw	r2, #:lower16:Cb
	movt	r2, #:upper16:Cb
	ldr	r1, [fp, #-16]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r4, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-20]
	add	r0, r3, #1
	movw	r2, #:lower16:Cb
	movt	r2, #:upper16:Cb
	ldr	r1, [fp, #-16]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r2, [r3]	@ zero_extendqisi2
	sub	r3, fp, #23
	str	r3, [sp, #8]
	sub	r3, fp, #22
	str	r3, [sp, #4]
	sub	r3, fp, #21
	str	r3, [sp]
	mov	r3, r2
	mov	r2, r4
	mov	r1, lr
	mov	r0, ip
	bl	chrominance_upsample
	ldr	r3, [fp, #-16]
	lsl	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	ip, r3, #1
	movw	r2, #:lower16:Cb
	movt	r2, #:upper16:Cb
	ldr	r0, [fp, #-16]
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r0, [r3]	@ zero_extendqisi2
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, ip
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	add	r0, r3, #1
	ldrb	ip, [fp, #-21]	@ zero_extendqisi2
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	add	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r0, r3, #1
	ldrb	ip, [fp, #-22]	@ zero_extendqisi2
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	add	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	add	r0, r3, #1
	ldrb	ip, [fp, #-23]	@ zero_extendqisi2
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	movw	r2, #:lower16:Cr
	movt	r2, #:upper16:Cr
	ldr	r1, [fp, #-16]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	ip, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-20]
	add	r0, r3, #1
	movw	r2, #:lower16:Cr
	movt	r2, #:upper16:Cr
	ldr	r1, [fp, #-16]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	lr, [r3]	@ zero_extendqisi2
	movw	r2, #:lower16:Cr
	movt	r2, #:upper16:Cr
	ldr	r1, [fp, #-16]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r4, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-20]
	add	r0, r3, #1
	movw	r2, #:lower16:Cr
	movt	r2, #:upper16:Cr
	ldr	r1, [fp, #-16]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r2, [r3]	@ zero_extendqisi2
	sub	r3, fp, #23
	str	r3, [sp, #8]
	sub	r3, fp, #22
	str	r3, [sp, #4]
	sub	r3, fp, #21
	str	r3, [sp]
	mov	r3, r2
	mov	r2, r4
	mov	r1, lr
	mov	r0, ip
	bl	chrominance_upsample
	ldr	r3, [fp, #-16]
	lsl	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	ip, r3, #1
	movw	r2, #:lower16:Cr
	movt	r2, #:upper16:Cr
	ldr	r0, [fp, #-16]
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r0, [r3]	@ zero_extendqisi2
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, ip
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	add	r0, r3, #1
	ldrb	ip, [fp, #-21]	@ zero_extendqisi2
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	add	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r0, r3, #1
	ldrb	ip, [fp, #-22]	@ zero_extendqisi2
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	add	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	add	r0, r3, #1
	ldrb	ip, [fp, #-23]	@ zero_extendqisi2
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L32:
	ldr	r3, [fp, #-16]
	cmp	r3, #22
	ble	.L33
	mov	r3, #31
	str	r3, [fp, #-16]
	mov	r3, #23
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	lsl	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	ip, r3, #1
	movw	r2, #:lower16:Cb
	movt	r2, #:upper16:Cb
	ldr	r0, [fp, #-16]
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r0, [r3]	@ zero_extendqisi2
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, ip
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	add	ip, r3, #1
	movw	r2, #:lower16:Cb
	movt	r2, #:upper16:Cb
	ldr	r0, [fp, #-16]
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r0, [r3]	@ zero_extendqisi2
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, ip
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	add	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	ip, r3, #1
	movw	r2, #:lower16:Cb
	movt	r2, #:upper16:Cb
	ldr	r0, [fp, #-16]
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r0, [r3]	@ zero_extendqisi2
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, ip
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	add	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	add	ip, r3, #1
	movw	r2, #:lower16:Cb
	movt	r2, #:upper16:Cb
	ldr	r0, [fp, #-16]
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r0, [r3]	@ zero_extendqisi2
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, ip
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	ip, r3, #1
	movw	r2, #:lower16:Cr
	movt	r2, #:upper16:Cr
	ldr	r0, [fp, #-16]
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r0, [r3]	@ zero_extendqisi2
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, ip
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	add	ip, r3, #1
	movw	r2, #:lower16:Cr
	movt	r2, #:upper16:Cr
	ldr	r0, [fp, #-16]
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r0, [r3]	@ zero_extendqisi2
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, ip
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	add	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	ip, r3, #1
	movw	r2, #:lower16:Cr
	movt	r2, #:upper16:Cr
	ldr	r0, [fp, #-16]
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r0, [r3]	@ zero_extendqisi2
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, ip
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	add	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	add	ip, r3, #1
	movw	r2, #:lower16:Cr
	movt	r2, #:upper16:Cr
	ldr	r0, [fp, #-16]
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r0, [r3]	@ zero_extendqisi2
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, ip
	mov	r2, r0
	strb	r2, [r3]
	nop
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, pc}
	.size	chrominance_array_upsample, .-chrominance_array_upsample
	.align	2
	.global	CSC_YCC_to_RGB
	.syntax unified
	.arm
	.fpu neon
	.type	CSC_YCC_to_RGB, %function
CSC_YCC_to_RGB:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	bl	upsample
	mov	r3, #62
	strb	r3, [fp, #-5]
	b	.L35
.L38:
	mov	r3, #46
	strb	r3, [fp, #-6]
	b	.L36
.L37:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldrb	r2, [fp, #-6]	@ zero_extendqisi2
	mov	r1, r2
	mov	r0, r3
	bl	CSC_YCC_to_RGB_neon
	nop
	ldrb	r3, [fp, #-6]
	sub	r3, r3, #2
	strb	r3, [fp, #-6]
.L36:
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L37
	ldrb	r3, [fp, #-5]
	sub	r3, r3, #2
	strb	r3, [fp, #-5]
.L35:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L38
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	CSC_YCC_to_RGB, .-CSC_YCC_to_RGB
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
