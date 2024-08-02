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
	.file	"CSC_RGB_to_YCC_01.c"
	.text
	.align	2
	.arch armv7-a
	.syntax unified
	.arm
	.fpu neon
	.type	CSC_RGB_to_YCC_brute_force_float, %function
CSC_RGB_to_YCC_brute_force_float:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	ldr	r1, [fp, #-24]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d17, .L2
	vmul.f64	d16, d16, d17
	vmov.f64	d17, #1.6e+1
	vadd.f64	d17, d16, d17
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	ldr	r1, [fp, #-24]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L2+8
	vmul.f64	d16, d16, d18
	vadd.f64	d17, d17, d16
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	ldr	r1, [fp, #-24]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L2+16
	vmul.f64	d16, d16, d18
	vadd.f64	d7, d17, d16
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-32]	@ int
	ldr	r3, [fp, #-32]
	uxtb	r0, r3
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	ldr	r1, [fp, #-24]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-28]
	add	r0, r3, #1
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	ldr	r1, [fp, #-24]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d17, .L2
	vmul.f64	d16, d16, d17
	vmov.f64	d17, #1.6e+1
	vadd.f64	d17, d16, d17
	ldr	r3, [fp, #-28]
	add	r0, r3, #1
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	ldr	r1, [fp, #-24]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L2+8
	vmul.f64	d16, d16, d18
	vadd.f64	d17, d17, d16
	ldr	r3, [fp, #-28]
	add	r0, r3, #1
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	ldr	r1, [fp, #-24]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L2+16
	vmul.f64	d16, d16, d18
	vadd.f64	d7, d17, d16
	ldr	r3, [fp, #-28]
	add	r0, r3, #1
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-32]	@ int
	ldr	r3, [fp, #-32]
	uxtb	ip, r3
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	ldr	r1, [fp, #-24]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r3, [fp, #-24]
	add	r1, r3, #1
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d17, .L2
	vmul.f64	d16, d16, d17
	vmov.f64	d17, #1.6e+1
	vadd.f64	d17, d16, d17
	ldr	r3, [fp, #-24]
	add	r1, r3, #1
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L2+8
	vmul.f64	d16, d16, d18
	vadd.f64	d17, d17, d16
	ldr	r3, [fp, #-24]
	add	r1, r3, #1
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L2+16
	vmul.f64	d16, d16, d18
	vadd.f64	d7, d17, d16
	ldr	r3, [fp, #-24]
	add	r1, r3, #1
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-32]	@ int
	ldr	r3, [fp, #-32]
	uxtb	r0, r3
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-24]
	add	r1, r3, #1
	ldr	r3, [fp, #-28]
	add	r0, r3, #1
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d17, .L2
	vmul.f64	d16, d16, d17
	vmov.f64	d17, #1.6e+1
	vadd.f64	d17, d16, d17
	ldr	r3, [fp, #-24]
	add	r1, r3, #1
	ldr	r3, [fp, #-28]
	add	r0, r3, #1
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L2+8
	vmul.f64	d16, d16, d18
	vadd.f64	d17, d17, d16
	ldr	r3, [fp, #-24]
	add	r1, r3, #1
	ldr	r3, [fp, #-28]
	add	r0, r3, #1
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L2+16
	vmul.f64	d16, d16, d18
	vadd.f64	d7, d17, d16
	ldr	r3, [fp, #-24]
	add	r1, r3, #1
	ldr	r3, [fp, #-28]
	add	r0, r3, #1
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-32]	@ int
	ldr	r3, [fp, #-32]
	uxtb	ip, r3
	b	.L3
.L4:
	.align	3
.L2:
	.word	549755814
	.word	1070625456
	.word	-1683627180
	.word	1071653060
	.word	721554506
	.word	1069094535
	.word	-68719477
	.word	1069740457
	.word	1992864825
	.word	1070768062
	.word	1958505087
	.word	1071388819
	.word	0
	.word	1080033280
.L3:
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	ldr	r1, [fp, #-24]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d17, .L2+24
	vmul.f64	d16, d16, d17
	vldr.64	d17, .L2+48
	vsub.f64	d17, d17, d16
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	ldr	r1, [fp, #-24]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L2+32
	vmul.f64	d16, d16, d18
	vsub.f64	d17, d17, d16
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	ldr	r1, [fp, #-24]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L2+40
	vmul.f64	d16, d16, d18
	vadd.f64	d7, d17, d16
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-32]	@ int
	ldr	r3, [fp, #-32]
	strb	r3, [fp, #-13]
	ldr	r3, [fp, #-28]
	add	r0, r3, #1
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	ldr	r1, [fp, #-24]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d17, .L2+24
	vmul.f64	d16, d16, d17
	vldr.64	d17, .L2+48
	vsub.f64	d17, d17, d16
	ldr	r3, [fp, #-28]
	add	r0, r3, #1
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	ldr	r1, [fp, #-24]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L2+32
	vmul.f64	d16, d16, d18
	vsub.f64	d17, d17, d16
	ldr	r3, [fp, #-28]
	add	r0, r3, #1
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	ldr	r1, [fp, #-24]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L2+40
	vmul.f64	d16, d16, d18
	vadd.f64	d7, d17, d16
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-32]	@ int
	ldr	r3, [fp, #-32]
	strb	r3, [fp, #-14]
	ldr	r3, [fp, #-24]
	add	r1, r3, #1
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d17, .L2+24
	vmul.f64	d16, d16, d17
	vldr.64	d17, .L2+48
	vsub.f64	d17, d17, d16
	ldr	r3, [fp, #-24]
	add	r1, r3, #1
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L2+32
	vmul.f64	d16, d16, d18
	vsub.f64	d17, d17, d16
	ldr	r3, [fp, #-24]
	add	r1, r3, #1
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L2+40
	vmul.f64	d16, d16, d18
	vadd.f64	d7, d17, d16
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-32]	@ int
	ldr	r3, [fp, #-32]
	strb	r3, [fp, #-15]
	ldr	r3, [fp, #-24]
	add	r1, r3, #1
	ldr	r3, [fp, #-28]
	add	r0, r3, #1
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d17, .L2+24
	vmul.f64	d16, d16, d17
	vldr.64	d17, .L2+48
	vsub.f64	d17, d17, d16
	ldr	r3, [fp, #-24]
	add	r1, r3, #1
	ldr	r3, [fp, #-28]
	add	r0, r3, #1
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L2+32
	vmul.f64	d16, d16, d18
	vsub.f64	d17, d17, d16
	ldr	r3, [fp, #-24]
	add	r1, r3, #1
	ldr	r3, [fp, #-28]
	add	r0, r3, #1
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L2+40
	vmul.f64	d16, d16, d18
	vadd.f64	d7, d17, d16
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-32]	@ int
	ldr	r3, [fp, #-32]
	strb	r3, [fp, #-16]
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	ldr	r1, [fp, #-24]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d17, .L2+40
	vmul.f64	d16, d16, d17
	vldr.64	d17, .L2+48
	vadd.f64	d17, d16, d17
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	ldr	r1, [fp, #-24]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L5
	vmul.f64	d16, d16, d18
	vsub.f64	d17, d17, d16
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	ldr	r1, [fp, #-24]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L5+8
	vmul.f64	d16, d16, d18
	vsub.f64	d7, d17, d16
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-32]	@ int
	ldr	r3, [fp, #-32]
	strb	r3, [fp, #-17]
	ldr	r3, [fp, #-28]
	add	r0, r3, #1
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	ldr	r1, [fp, #-24]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d17, .L5+16
	vmul.f64	d16, d16, d17
	vldr.64	d17, .L5+24
	vadd.f64	d17, d16, d17
	ldr	r3, [fp, #-28]
	add	r0, r3, #1
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	ldr	r1, [fp, #-24]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L5
	vmul.f64	d16, d16, d18
	vsub.f64	d17, d17, d16
	ldr	r3, [fp, #-28]
	add	r0, r3, #1
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	ldr	r1, [fp, #-24]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L5+8
	vmul.f64	d16, d16, d18
	vsub.f64	d7, d17, d16
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-32]	@ int
	ldr	r3, [fp, #-32]
	strb	r3, [fp, #-18]
	ldr	r3, [fp, #-24]
	add	r1, r3, #1
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d17, .L5+16
	vmul.f64	d16, d16, d17
	vldr.64	d17, .L5+24
	vadd.f64	d17, d16, d17
	ldr	r3, [fp, #-24]
	add	r1, r3, #1
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L5
	vmul.f64	d16, d16, d18
	vsub.f64	d17, d17, d16
	ldr	r3, [fp, #-24]
	add	r1, r3, #1
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L5+8
	vmul.f64	d16, d16, d18
	vsub.f64	d7, d17, d16
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-32]	@ int
	ldr	r3, [fp, #-32]
	strb	r3, [fp, #-19]
	ldr	r3, [fp, #-24]
	add	r1, r3, #1
	ldr	r3, [fp, #-28]
	add	r0, r3, #1
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d17, .L5+16
	vmul.f64	d16, d16, d17
	vldr.64	d17, .L5+24
	vadd.f64	d17, d16, d17
	ldr	r3, [fp, #-24]
	add	r1, r3, #1
	ldr	r3, [fp, #-28]
	add	r0, r3, #1
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L5
	vmul.f64	d16, d16, d18
	vsub.f64	d17, d17, d16
	ldr	r3, [fp, #-24]
	add	r1, r3, #1
	ldr	r3, [fp, #-28]
	add	r0, r3, #1
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	vmov	s15, r3	@ int
	vcvt.f64.s32	d16, s15
	vldr.64	d18, .L5+8
	vmul.f64	d16, d16, d18
	vsub.f64	d7, d17, d16
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-32]	@ int
	ldr	r3, [fp, #-32]
	strb	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	asr	r4, r3, #1
	ldr	r3, [fp, #-28]
	asr	r5, r3, #1
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	ldrb	r2, [fp, #-15]	@ zero_extendqisi2
	ldrb	r1, [fp, #-14]	@ zero_extendqisi2
	ldrb	r0, [fp, #-13]	@ zero_extendqisi2
	bl	chrominance_downsample
	mov	r3, r0
	mov	r1, r3
	movw	r2, #:lower16:Cb
	movt	r2, #:upper16:Cb
	mov	r3, r4
	lsl	r3, r3, #1
	add	r3, r3, r4
	lsl	r3, r3, #3
	add	r3, r2, r3
	add	r3, r3, r5
	mov	r2, r1
	strb	r2, [r3]
	ldr	r3, [fp, #-24]
	asr	r4, r3, #1
	ldr	r3, [fp, #-28]
	asr	r5, r3, #1
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldrb	r2, [fp, #-19]	@ zero_extendqisi2
	ldrb	r1, [fp, #-18]	@ zero_extendqisi2
	ldrb	r0, [fp, #-17]	@ zero_extendqisi2
	bl	chrominance_downsample
	mov	r3, r0
	mov	r1, r3
	movw	r2, #:lower16:Cr
	movt	r2, #:upper16:Cr
	mov	r3, r4
	lsl	r3, r3, #1
	add	r3, r3, r4
	lsl	r3, r3, #3
	add	r3, r2, r3
	add	r3, r3, r5
	mov	r2, r1
	strb	r2, [r3]
	nop
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, pc}
.L6:
	.align	3
.L5:
	.word	-549755814
	.word	1071091023
	.word	1443109011
	.word	1068641550
	.word	1958505087
	.word	1071388819
	.word	0
	.word	1080033280
	.size	CSC_RGB_to_YCC_brute_force_float, .-CSC_RGB_to_YCC_brute_force_float
	.align	2
	.syntax unified
	.arm
	.fpu neon
	.type	CSC_RGB_to_YCC_brute_force_int, %function
CSC_RGB_to_YCC_brute_force_int:
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #104
	str	r0, [fp, #-112]
	str	r1, [fp, #-116]
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	ldr	r1, [fp, #-112]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-116]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-116]
	add	r0, r3, #1
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	ldr	r1, [fp, #-112]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-112]
	add	r1, r3, #1
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-116]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-112]
	add	r1, r3, #1
	ldr	r3, [fp, #-116]
	add	r0, r3, #1
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-28]
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	ldr	r1, [fp, #-112]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-116]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-116]
	add	r0, r3, #1
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	ldr	r1, [fp, #-112]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-112]
	add	r1, r3, #1
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-116]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-112]
	add	r1, r3, #1
	ldr	r3, [fp, #-116]
	add	r0, r3, #1
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-44]
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	ldr	r1, [fp, #-112]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-116]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-116]
	add	r0, r3, #1
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	ldr	r1, [fp, #-112]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-112]
	add	r1, r3, #1
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-116]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-112]
	add	r1, r3, #1
	ldr	r3, [fp, #-116]
	add	r0, r3, #1
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-60]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #5
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r1, r3, #4096
	ldr	r2, [fp, #-32]
	mov	r3, r2
	lsl	r3, r3, #7
	add	r3, r3, r2
	add	r1, r1, r3
	ldr	r2, [fp, #-48]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
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
	lsl	r3, r3, #5
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r1, r3, #4096
	ldr	r2, [fp, #-36]
	mov	r3, r2
	lsl	r3, r3, #7
	add	r3, r3, r2
	add	r1, r1, r3
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	add	r3, r1, r3
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-68]
	add	r3, r3, #128
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-68]
	asr	r3, r3, #8
	str	r3, [fp, #-68]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	lsl	r3, r3, #5
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r1, r3, #4096
	ldr	r2, [fp, #-40]
	mov	r3, r2
	lsl	r3, r3, #7
	add	r3, r3, r2
	add	r1, r1, r3
	ldr	r2, [fp, #-56]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	add	r3, r1, r3
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-72]
	add	r3, r3, #128
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-72]
	asr	r3, r3, #8
	str	r3, [fp, #-72]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	lsl	r3, r3, #5
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r1, r3, #4096
	ldr	r2, [fp, #-44]
	mov	r3, r2
	lsl	r3, r3, #7
	add	r3, r3, r2
	add	r1, r1, r3
	ldr	r2, [fp, #-60]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	add	r3, r1, r3
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-76]
	add	r3, r3, #128
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-76]
	asr	r3, r3, #8
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-64]
	uxtb	r0, r3
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	ldr	r1, [fp, #-112]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-116]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-116]
	add	r0, r3, #1
	ldr	r3, [fp, #-68]
	uxtb	ip, r3
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	ldr	r1, [fp, #-112]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r3, [fp, #-112]
	add	r1, r3, #1
	ldr	r3, [fp, #-72]
	uxtb	r0, r3
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-116]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, [fp, #-112]
	add	r1, r3, #1
	ldr	r3, [fp, #-116]
	add	r0, r3, #1
	ldr	r3, [fp, #-76]
	uxtb	ip, r3
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	mvn	r2, #37
	mul	r3, r2, r3
	add	r2, r3, #32768
	ldr	r3, [fp, #-32]
	mvn	r1, #73
	mul	r3, r1, r3
	add	r1, r2, r3
	ldr	r2, [fp, #-48]
	mov	r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r3, r3, #4
	add	r3, r1, r3
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-80]
	add	r3, r3, #128
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-80]
	asr	r3, r3, #8
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-20]
	mvn	r2, #37
	mul	r3, r2, r3
	add	r2, r3, #32768
	ldr	r3, [fp, #-36]
	mvn	r1, #73
	mul	r3, r1, r3
	add	r1, r2, r3
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r3, r3, #4
	add	r3, r1, r3
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-84]
	add	r3, r3, #128
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-84]
	asr	r3, r3, #8
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-24]
	mvn	r2, #37
	mul	r3, r2, r3
	add	r2, r3, #32768
	ldr	r3, [fp, #-40]
	mvn	r1, #73
	mul	r3, r1, r3
	add	r1, r2, r3
	ldr	r2, [fp, #-56]
	mov	r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r3, r3, #4
	add	r3, r1, r3
	str	r3, [fp, #-88]
	ldr	r3, [fp, #-88]
	add	r3, r3, #128
	str	r3, [fp, #-88]
	ldr	r3, [fp, #-88]
	asr	r3, r3, #8
	str	r3, [fp, #-88]
	ldr	r3, [fp, #-28]
	mvn	r2, #37
	mul	r3, r2, r3
	add	r2, r3, #32768
	ldr	r3, [fp, #-44]
	mvn	r1, #73
	mul	r3, r1, r3
	add	r1, r2, r3
	ldr	r2, [fp, #-60]
	mov	r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r3, r3, #4
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
	sub	r3, r3, r2
	lsl	r3, r3, #4
	add	r2, r3, #32768
	ldr	r3, [fp, #-32]
	mvn	r1, #93
	mul	r3, r1, r3
	add	r1, r2, r3
	ldr	r2, [fp, #-48]
	mov	r3, r2
	lsl	r3, r3, #28
	sub	r3, r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r3, r3, #1
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
	sub	r3, r3, r2
	lsl	r3, r3, #4
	add	r2, r3, #32768
	ldr	r3, [fp, #-36]
	mvn	r1, #93
	mul	r3, r1, r3
	add	r1, r2, r3
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #28
	sub	r3, r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r1, r3
	str	r3, [fp, #-100]
	ldr	r3, [fp, #-100]
	add	r3, r3, #128
	str	r3, [fp, #-100]
	ldr	r3, [fp, #-100]
	asr	r3, r3, #8
	str	r3, [fp, #-100]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r3, r3, #4
	add	r2, r3, #32768
	ldr	r3, [fp, #-40]
	mvn	r1, #93
	mul	r3, r1, r3
	add	r1, r2, r3
	ldr	r2, [fp, #-56]
	mov	r3, r2
	lsl	r3, r3, #28
	sub	r3, r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r1, r3
	str	r3, [fp, #-104]
	ldr	r3, [fp, #-104]
	add	r3, r3, #128
	str	r3, [fp, #-104]
	ldr	r3, [fp, #-104]
	asr	r3, r3, #8
	str	r3, [fp, #-104]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r3, r3, #4
	add	r2, r3, #32768
	ldr	r3, [fp, #-44]
	mvn	r1, #93
	mul	r3, r1, r3
	add	r1, r2, r3
	ldr	r2, [fp, #-60]
	mov	r3, r2
	lsl	r3, r3, #28
	sub	r3, r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r1, r3
	str	r3, [fp, #-108]
	ldr	r3, [fp, #-108]
	add	r3, r3, #128
	str	r3, [fp, #-108]
	ldr	r3, [fp, #-108]
	asr	r3, r3, #8
	str	r3, [fp, #-108]
	ldr	r3, [fp, #-80]
	uxtb	r0, r3
	ldr	r3, [fp, #-84]
	uxtb	r1, r3
	ldr	r3, [fp, #-88]
	uxtb	r2, r3
	ldr	r3, [fp, #-92]
	uxtb	ip, r3
	ldr	r3, [fp, #-112]
	asr	r4, r3, #1
	ldr	r3, [fp, #-116]
	asr	r5, r3, #1
	mov	r3, ip
	bl	chrominance_downsample
	mov	r3, r0
	mov	r1, r3
	movw	r2, #:lower16:Cb
	movt	r2, #:upper16:Cb
	mov	r3, r4
	lsl	r3, r3, #1
	add	r3, r3, r4
	lsl	r3, r3, #3
	add	r3, r2, r3
	add	r3, r3, r5
	mov	r2, r1
	strb	r2, [r3]
	ldr	r3, [fp, #-96]
	uxtb	r0, r3
	ldr	r3, [fp, #-100]
	uxtb	r1, r3
	ldr	r3, [fp, #-104]
	uxtb	r2, r3
	ldr	r3, [fp, #-108]
	uxtb	ip, r3
	ldr	r3, [fp, #-112]
	asr	r4, r3, #1
	ldr	r3, [fp, #-116]
	asr	r5, r3, #1
	mov	r3, ip
	bl	chrominance_downsample
	mov	r3, r0
	mov	r1, r3
	movw	r2, #:lower16:Cr
	movt	r2, #:upper16:Cr
	mov	r3, r4
	lsl	r3, r3, #1
	add	r3, r3, r4
	lsl	r3, r3, #3
	add	r3, r2, r3
	add	r3, r3, r5
	mov	r2, r1
	strb	r2, [r3]
	nop
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, pc}
	.size	CSC_RGB_to_YCC_brute_force_int, .-CSC_RGB_to_YCC_brute_force_int
	.align	2
	.syntax unified
	.arm
	.fpu neon
	.type	chrominance_downsample, %function
chrominance_downsample:
	@ args = 0, pretend = 0, frame = 8
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
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	chrominance_downsample, .-chrominance_downsample
	.align	2
	.global	CSC_RGB_to_YCC
	.syntax unified
	.arm
	.fpu neon
	.type	CSC_RGB_to_YCC, %function
CSC_RGB_to_YCC:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #62
	str	r3, [fp, #-8]
	b	.L11
.L14:
	mov	r3, #46
	str	r3, [fp, #-12]
	b	.L12
.L13:
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	CSC_RGB_to_YCC_neon
	nop
	ldr	r3, [fp, #-12]
	sub	r3, r3, #2
	str	r3, [fp, #-12]
.L12:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L13
	ldr	r3, [fp, #-8]
	sub	r3, r3, #2
	str	r3, [fp, #-8]
.L11:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L14
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	CSC_RGB_to_YCC, .-CSC_RGB_to_YCC
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
