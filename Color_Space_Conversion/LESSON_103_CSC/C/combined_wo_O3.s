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
	.file	"CSC_main.c"
	.text
	.comm	R,3072,4
	.comm	G,3072,4
	.comm	B,3072,4
	.comm	Y,3072,4
	.comm	Cb,768,4
	.comm	Cr,768,4
	.comm	Cb_temp,3072,4
	.comm	Cr_temp,3072,4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"rb\000"
	.align	2
.LC1:
	.ascii	"./image_input_RGB_64_48_03.data\000"
	.align	2
.LC2:
	.ascii	"Cannot open file.\000"
	.align	2
.LC3:
	.ascii	"wb\000"
	.align	2
.LC4:
	.ascii	"./image_echo_R_64_48_03.data\000"
	.align	2
.LC5:
	.ascii	"./image_echo_G_64_48_03.data\000"
	.align	2
.LC6:
	.ascii	"./image_echo_B_64_48_03.data\000"
	.align	2
.LC7:
	.ascii	"./image_output_Y_64_48_03.data\000"
	.align	2
.LC8:
	.ascii	"Could not open %s\012\000"
	.align	2
.LC9:
	.ascii	"./image_output_Cb_64_48_03.data\000"
	.align	2
.LC10:
	.ascii	"./image_output_Cr_64_48_03.data\000"
	.align	2
.LC11:
	.ascii	"./image_output_RGB_64_48_03.data\000"
	.text
	.align	2
	.global	main
	.arch armv7-a
	.syntax unified
	.arm
	.fpu neon
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	movw	r1, #:lower16:.LC0
	movt	r1, #:upper16:.LC0
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	fopen
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L2
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	puts
	mov	r3, #1
	b	.L3
.L2:
	movw	r1, #:lower16:.LC3
	movt	r1, #:upper16:.LC3
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	bl	fopen
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L4
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	puts
	mov	r3, #1
	b	.L3
.L4:
	movw	r1, #:lower16:.LC3
	movt	r1, #:upper16:.LC3
	movw	r0, #:lower16:.LC5
	movt	r0, #:upper16:.LC5
	bl	fopen
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L5
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	puts
	mov	r3, #1
	b	.L3
.L5:
	movw	r1, #:lower16:.LC3
	movt	r1, #:upper16:.LC3
	movw	r0, #:lower16:.LC6
	movt	r0, #:upper16:.LC6
	bl	fopen
	str	r0, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L6
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	puts
	mov	r3, #1
	b	.L3
.L6:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L7
.L10:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L8
.L9:
	ldr	r0, [fp, #-16]
	bl	fgetc
	mov	r3, r0
	uxtb	r0, r3
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	ldr	r1, [fp, #-8]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	ldr	r1, [fp, #-8]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldr	r1, [fp, #-20]
	mov	r0, r3
	bl	fputc
	ldr	r0, [fp, #-16]
	bl	fgetc
	mov	r3, r0
	uxtb	r0, r3
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	ldr	r1, [fp, #-8]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	ldr	r1, [fp, #-8]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldr	r1, [fp, #-24]
	mov	r0, r3
	bl	fputc
	ldr	r0, [fp, #-16]
	bl	fgetc
	mov	r3, r0
	uxtb	r0, r3
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	ldr	r1, [fp, #-8]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	ldr	r1, [fp, #-8]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldr	r1, [fp, #-28]
	mov	r0, r3
	bl	fputc
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L8:
	ldr	r3, [fp, #-12]
	cmp	r3, #47
	ble	.L9
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L7:
	ldr	r3, [fp, #-8]
	cmp	r3, #63
	ble	.L10
	ldr	r0, [fp, #-28]
	bl	fclose
	ldr	r0, [fp, #-24]
	bl	fclose
	ldr	r0, [fp, #-20]
	bl	fclose
	ldr	r0, [fp, #-16]
	bl	fclose
	bl	CSC_RGB_to_YCC
	movw	r1, #:lower16:.LC3
	movt	r1, #:upper16:.LC3
	movw	r0, #:lower16:.LC7
	movt	r0, #:upper16:.LC7
	bl	fopen
	str	r0, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L11
	movw	r3, #:lower16:stderr
	movt	r3, #:upper16:stderr
	ldr	r3, [r3]
	movw	r2, #:lower16:.LC7
	movt	r2, #:upper16:.LC7
	movw	r1, #:lower16:.LC8
	movt	r1, #:upper16:.LC8
	mov	r0, r3
	bl	fprintf
	mov	r3, #1
	b	.L3
.L11:
	movw	r1, #:lower16:.LC3
	movt	r1, #:upper16:.LC3
	movw	r0, #:lower16:.LC9
	movt	r0, #:upper16:.LC9
	bl	fopen
	str	r0, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bne	.L12
	movw	r3, #:lower16:stderr
	movt	r3, #:upper16:stderr
	ldr	r3, [r3]
	movw	r2, #:lower16:.LC9
	movt	r2, #:upper16:.LC9
	movw	r1, #:lower16:.LC8
	movt	r1, #:upper16:.LC8
	mov	r0, r3
	bl	fprintf
	mov	r3, #1
	b	.L3
.L12:
	movw	r1, #:lower16:.LC3
	movt	r1, #:upper16:.LC3
	movw	r0, #:lower16:.LC10
	movt	r0, #:upper16:.LC10
	bl	fopen
	str	r0, [fp, #-40]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	bne	.L13
	movw	r3, #:lower16:stderr
	movt	r3, #:upper16:stderr
	ldr	r3, [r3]
	movw	r2, #:lower16:.LC10
	movt	r2, #:upper16:.LC10
	movw	r1, #:lower16:.LC8
	movt	r1, #:upper16:.LC8
	mov	r0, r3
	bl	fprintf
	mov	r3, #1
	b	.L3
.L13:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L14
.L17:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L15
.L16:
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	ldr	r1, [fp, #-8]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldr	r1, [fp, #-32]
	mov	r0, r3
	bl	fputc
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L15:
	ldr	r3, [fp, #-12]
	cmp	r3, #47
	ble	.L16
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L14:
	ldr	r3, [fp, #-8]
	cmp	r3, #63
	ble	.L17
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L18
.L21:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L19
.L20:
	movw	r2, #:lower16:Cb
	movt	r2, #:upper16:Cb
	ldr	r1, [fp, #-8]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldr	r1, [fp, #-36]
	mov	r0, r3
	bl	fputc
	movw	r2, #:lower16:Cr
	movt	r2, #:upper16:Cr
	ldr	r1, [fp, #-8]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldr	r1, [fp, #-40]
	mov	r0, r3
	bl	fputc
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L19:
	ldr	r3, [fp, #-12]
	cmp	r3, #23
	ble	.L20
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L18:
	ldr	r3, [fp, #-8]
	cmp	r3, #31
	ble	.L21
	ldr	r0, [fp, #-40]
	bl	fclose
	ldr	r0, [fp, #-36]
	bl	fclose
	ldr	r0, [fp, #-32]
	bl	fclose
	bl	CSC_YCC_to_RGB
	movw	r1, #:lower16:.LC3
	movt	r1, #:upper16:.LC3
	movw	r0, #:lower16:.LC11
	movt	r0, #:upper16:.LC11
	bl	fopen
	str	r0, [fp, #-44]
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	bne	.L22
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	puts
	mov	r3, #1
	b	.L3
.L22:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L23
.L26:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L24
.L25:
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	ldr	r1, [fp, #-8]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldr	r1, [fp, #-44]
	mov	r0, r3
	bl	fputc
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	ldr	r1, [fp, #-8]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldr	r1, [fp, #-44]
	mov	r0, r3
	bl	fputc
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	ldr	r1, [fp, #-8]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldr	r1, [fp, #-44]
	mov	r0, r3
	bl	fputc
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L24:
	ldr	r3, [fp, #-12]
	cmp	r3, #47
	ble	.L25
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L23:
	ldr	r3, [fp, #-8]
	cmp	r3, #63
	ble	.L26
	ldr	r0, [fp, #-44]
	bl	fclose
	mov	r3, #0
.L3:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
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
	.file	"neon_conversions.c"
	.text
	.align	2
	.arch armv7-a
	.syntax unified
	.arm
	.fpu neon
	.type	clamp_y, %function
clamp_y:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, fp}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	mov	r4, #3
	b	.L2
.L5:
	mov	r3, r4
	lsl	r3, r3, #2
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	ldr	r3, [r3]
	cmp	r3, #15
	bhi	.L3
	mov	r3, r4
	lsl	r3, r3, #2
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	mov	r2, #16
	str	r2, [r3]
.L3:
	mov	r3, r4
	lsl	r3, r3, #2
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	ldr	r3, [r3]
	cmp	r3, #235
	bls	.L4
	mov	r3, r4
	lsl	r3, r3, #2
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	mov	r2, #235
	str	r2, [r3]
.L4:
	uxtb	r3, r4
	sub	r3, r3, #1
	uxtb	r3, r3
	sxtb	r4, r3
.L2:
	cmp	r4, #0
	bge	.L5
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{r4, fp}
	bx	lr
	.size	clamp_y, .-clamp_y
	.align	2
	.syntax unified
	.arm
	.fpu neon
	.type	clamp_crcb, %function
clamp_crcb:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, #3
	str	r3, [fp, #-8]
	b	.L7
.L10:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3]
	cmp	r3, #15
	bhi	.L8
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	mov	r2, #16
	str	r2, [r3]
.L8:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3]
	cmp	r3, #240
	bls	.L9
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	mov	r2, #240
	str	r2, [r3]
.L9:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L7:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L10
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	clamp_crcb, .-clamp_crcb
	.align	2
	.syntax unified
	.arm
	.fpu neon
	.type	clamp_rgb, %function
clamp_rgb:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, #3
	str	r3, [fp, #-8]
	b	.L12
.L15:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3]
	cmp	r3, #0
	bge	.L13
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3]
.L13:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3]
	cmp	r3, #255
	ble	.L14
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	mov	r2, #255
	str	r2, [r3]
.L14:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L12:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L15
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	clamp_rgb, .-clamp_rgb
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
	b	.L20
.L23:
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L21
.L22:
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
.L21:
	ldr	r3, [fp, #-20]
	cmp	r3, #22
	ble	.L22
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L20:
	ldr	r3, [fp, #-16]
	cmp	r3, #30
	ble	.L23
	mov	r3, #23
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L24
.L25:
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
.L24:
	ldr	r3, [fp, #-16]
	cmp	r3, #30
	ble	.L25
	mov	r3, #31
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L26
.L27:
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
.L26:
	ldr	r3, [fp, #-20]
	cmp	r3, #22
	ble	.L27
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
	.global	upsample
	.syntax unified
	.arm
	.fpu neon
	.type	upsample, %function
upsample:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, fp}
	add	fp, sp, #8
	sub	sp, sp, #12
	mov	r4, #31
	mov	r5, #23
	str	r4, [fp, #-16]
	b	.L29
.L32:
	str	r5, [fp, #-20]
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
	ldrb	r4, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	lsl	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r0, r3, #1
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, r4
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	add	r0, r3, #1
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, r4
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	add	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r0, r3, #1
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, r4
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	add	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	add	r0, r3, #1
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, r4
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
	ldrb	r4, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	lsl	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r0, r3, #1
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, r4
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	add	r0, r3, #1
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, r4
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	add	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r0, r3, #1
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, r4
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	add	r1, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	add	r0, r3, #1
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, r4
	strb	r2, [r3]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
.L30:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L31
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
.L29:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L32
	nop
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, r5, fp}
	bx	lr
	.size	upsample, .-upsample
	.align	2
	.global	CSC_RGB_to_YCC_neon
	.syntax unified
	.arm
	.fpu neon
	.type	CSC_RGB_to_YCC_neon, %function
CSC_RGB_to_YCC_neon:
	@ args = 0, pretend = 0, frame = 1472
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #1472
	str	r0, [fp, #-1480]
	str	r1, [fp, #-1484]
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	ldr	r1, [fp, #-1480]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-1484]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-1140]
	ldr	r3, [fp, #-1484]
	add	r0, r3, #1
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	ldr	r1, [fp, #-1480]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-1136]
	ldr	r3, [fp, #-1480]
	add	r1, r3, #1
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-1484]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-1132]
	ldr	r3, [fp, #-1480]
	add	r1, r3, #1
	ldr	r3, [fp, #-1484]
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
	str	r3, [fp, #-1128]
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	ldr	r1, [fp, #-1480]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-1484]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-1156]
	ldr	r3, [fp, #-1484]
	add	r0, r3, #1
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	ldr	r1, [fp, #-1480]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-1152]
	ldr	r3, [fp, #-1480]
	add	r1, r3, #1
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-1484]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-1148]
	ldr	r3, [fp, #-1480]
	add	r1, r3, #1
	ldr	r3, [fp, #-1484]
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
	str	r3, [fp, #-1144]
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	ldr	r1, [fp, #-1480]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-1484]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-1172]
	ldr	r3, [fp, #-1484]
	add	r0, r3, #1
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	ldr	r1, [fp, #-1480]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-1168]
	ldr	r3, [fp, #-1480]
	add	r1, r3, #1
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-1484]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-1164]
	ldr	r3, [fp, #-1480]
	add	r1, r3, #1
	ldr	r3, [fp, #-1484]
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
	str	r3, [fp, #-1160]
	sub	r3, fp, #1120
	sub	r3, r3, #12
	sub	r3, r3, #8
	str	r3, [fp, #-1124]
	ldr	r3, [fp, #-1124]
	vld1.32	{d16-d17}, [r3]
	vstr	d16, [fp, #-28]
	vstr	d17, [fp, #-20]
	sub	r3, fp, #1136
	sub	r3, r3, #12
	sub	r3, r3, #8
	str	r3, [fp, #-1120]
	ldr	r3, [fp, #-1120]
	vld1.32	{d16-d17}, [r3]
	vstr	d16, [fp, #-44]
	vstr	d17, [fp, #-36]
	sub	r3, fp, #1152
	sub	r3, r3, #12
	sub	r3, r3, #8
	str	r3, [fp, #-1116]
	ldr	r3, [fp, #-1116]
	vld1.32	{d16-d17}, [r3]
	vstr	d16, [fp, #-60]
	vstr	d17, [fp, #-52]
	mov	r3, #66
	str	r3, [fp, #-1112]
	ldr	r3, [fp, #-1112]
	vdup.32	q8, r3
	vstr	d16, [fp, #-76]
	vstr	d17, [fp, #-68]
	sub	r3, fp, #12
	sub	r3, r3, #1072
	sub	r3, r3, #8
	vldr	d16, [fp, #-28]
	vldr	d17, [fp, #-20]
	vst1.64	{d16-d17}, [r3:64]
	sub	r3, fp, #12
	sub	r3, r3, #1088
	sub	r3, r3, #8
	vldr	d16, [fp, #-76]
	vldr	d17, [fp, #-68]
	vst1.64	{d16-d17}, [r3:64]
	sub	r3, fp, #12
	sub	r2, r3, #1072
	sub	r2, r2, #8
	sub	r3, fp, #12
	sub	r3, r3, #1088
	sub	r3, r3, #8
	vld1.64	{d18-d19}, [r2:64]
	vld1.64	{d16-d17}, [r3:64]
	vmul.i32	q8, q9, q8
	vstr	d16, [fp, #-92]
	vstr	d17, [fp, #-84]
	mov	r3, #129
	str	r3, [fp, #-1072]
	ldr	r3, [fp, #-1072]
	vdup.32	q8, r3
	vstr	d16, [fp, #-108]
	vstr	d17, [fp, #-100]
	sub	r3, fp, #12
	sub	r3, r3, #1040
	vldr	d16, [fp, #-44]
	vldr	d17, [fp, #-36]
	vst1.64	{d16-d17}, [r3:64]
	sub	r3, fp, #12
	sub	r3, r3, #1056
	vldr	d16, [fp, #-108]
	vldr	d17, [fp, #-100]
	vst1.64	{d16-d17}, [r3:64]
	sub	r3, fp, #12
	sub	r2, r3, #1040
	sub	r3, fp, #12
	sub	r3, r3, #1056
	vld1.64	{d18-d19}, [r2:64]
	vld1.64	{d16-d17}, [r3:64]
	vmul.i32	q8, q9, q8
	vstr	d16, [fp, #-124]
	vstr	d17, [fp, #-116]
	mov	r3, #25
	str	r3, [fp, #-1032]
	ldr	r3, [fp, #-1032]
	vdup.32	q8, r3
	vstr	d16, [fp, #-140]
	vstr	d17, [fp, #-132]
	vldr	d16, [fp, #-60]
	vldr	d17, [fp, #-52]
	vstr	d16, [fp, #-1012]
	vstr	d17, [fp, #-1004]
	vldr	d16, [fp, #-140]
	vldr	d17, [fp, #-132]
	sub	r3, fp, #1024
	sub	r3, r3, #4
	vst1.64	{d16-d17}, [r3:64]
	vldr	d18, [fp, #-1012]
	vldr	d19, [fp, #-1004]
	sub	r3, fp, #1024
	sub	r3, r3, #4
	vld1.64	{d16-d17}, [r3:64]
	vmul.i32	q8, q9, q8
	vstr	d16, [fp, #-156]
	vstr	d17, [fp, #-148]
	vldr	d16, [fp, #-92]
	vldr	d17, [fp, #-84]
	vstr	d16, [fp, #-980]
	vstr	d17, [fp, #-972]
	vldr	d16, [fp, #-124]
	vldr	d17, [fp, #-116]
	vstr	d16, [fp, #-996]
	vstr	d17, [fp, #-988]
	vldr	d16, [fp, #-980]
	vldr	d17, [fp, #-972]
	vldr	d18, [fp, #-996]
	vldr	d19, [fp, #-988]
	vqadd.u32	q8, q8, q9
	vstr	d16, [fp, #-172]
	vstr	d17, [fp, #-164]
	vldr	d16, [fp, #-172]
	vldr	d17, [fp, #-164]
	vstr	d16, [fp, #-948]
	vstr	d17, [fp, #-940]
	vldr	d16, [fp, #-156]
	vldr	d17, [fp, #-148]
	vstr	d16, [fp, #-964]
	vstr	d17, [fp, #-956]
	vldr	d16, [fp, #-948]
	vldr	d17, [fp, #-940]
	vldr	d18, [fp, #-964]
	vldr	d19, [fp, #-956]
	vqadd.u32	q8, q8, q9
	vstr	d16, [fp, #-172]
	vstr	d17, [fp, #-164]
	mov	r3, #4096
	str	r3, [fp, #-932]
	ldr	r3, [fp, #-932]
	vdup.32	q8, r3
	vstr	d16, [fp, #-188]
	vstr	d17, [fp, #-180]
	mov	r3, #128
	str	r3, [fp, #-928]
	ldr	r3, [fp, #-928]
	vdup.32	q8, r3
	vstr	d16, [fp, #-204]
	vstr	d17, [fp, #-196]
	vldr	d16, [fp, #-172]
	vldr	d17, [fp, #-164]
	vstr	d16, [fp, #-908]
	vstr	d17, [fp, #-900]
	vldr	d16, [fp, #-188]
	vldr	d17, [fp, #-180]
	vstr	d16, [fp, #-924]
	vstr	d17, [fp, #-916]
	vldr	d16, [fp, #-908]
	vldr	d17, [fp, #-900]
	vldr	d18, [fp, #-924]
	vldr	d19, [fp, #-916]
	vqadd.u32	q8, q8, q9
	vstr	d16, [fp, #-172]
	vstr	d17, [fp, #-164]
	vldr	d16, [fp, #-172]
	vldr	d17, [fp, #-164]
	vstr	d16, [fp, #-876]
	vstr	d17, [fp, #-868]
	vldr	d16, [fp, #-204]
	vldr	d17, [fp, #-196]
	vstr	d16, [fp, #-892]
	vstr	d17, [fp, #-884]
	vldr	d16, [fp, #-876]
	vldr	d17, [fp, #-868]
	vldr	d18, [fp, #-892]
	vldr	d19, [fp, #-884]
	vqadd.u32	q8, q8, q9
	vstr	d16, [fp, #-172]
	vstr	d17, [fp, #-164]
	vldr	d16, [fp, #-172]
	vldr	d17, [fp, #-164]
	vstr	d16, [fp, #-860]
	vstr	d17, [fp, #-852]
	vldr	d16, [fp, #-860]
	vldr	d17, [fp, #-852]
	vshr.u32	q8, q8, #8
	vstr	d16, [fp, #-172]
	vstr	d17, [fp, #-164]
	sub	r3, fp, #1168
	sub	r3, r3, #12
	sub	r3, r3, #8
	str	r3, [fp, #-828]
	vldr	d16, [fp, #-172]
	vldr	d17, [fp, #-164]
	vstr	d16, [fp, #-844]
	vstr	d17, [fp, #-836]
	vldr	d16, [fp, #-844]
	vldr	d17, [fp, #-836]
	ldr	r3, [fp, #-828]
	vst1.32	{d16-d17}, [r3]
	sub	r3, fp, #1168
	sub	r3, r3, #12
	sub	r3, r3, #8
	mov	r0, r3
	bl	clamp_y
	ldr	r3, [fp, #-1188]
	uxtb	r0, r3
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	ldr	r1, [fp, #-1480]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-1484]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	ldr	r2, [fp, #-1184]
	ldr	r3, [fp, #-1484]
	add	r0, r3, #1
	uxtb	ip, r2
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	ldr	r1, [fp, #-1480]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r2, [fp, #-1180]
	ldr	r3, [fp, #-1480]
	add	r1, r3, #1
	uxtb	r0, r2
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-1484]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	ldr	r2, [fp, #-1176]
	ldr	r3, [fp, #-1480]
	add	r1, r3, #1
	ldr	r3, [fp, #-1484]
	add	r0, r3, #1
	uxtb	ip, r2
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
	mov	r3, #38
	str	r3, [fp, #-824]
	ldr	r3, [fp, #-824]
	vdup.32	q8, r3
	vstr	d16, [fp, #-76]
	vstr	d17, [fp, #-68]
	vldr	d16, [fp, #-28]
	vldr	d17, [fp, #-20]
	vstr	d16, [fp, #-804]
	vstr	d17, [fp, #-796]
	vldr	d16, [fp, #-76]
	vldr	d17, [fp, #-68]
	vstr	d16, [fp, #-820]
	vstr	d17, [fp, #-812]
	vldr	d18, [fp, #-804]
	vldr	d19, [fp, #-796]
	vldr	d16, [fp, #-820]
	vldr	d17, [fp, #-812]
	vmul.i32	q8, q9, q8
	vstr	d16, [fp, #-92]
	vstr	d17, [fp, #-84]
	mov	r3, #74
	str	r3, [fp, #-784]
	ldr	r3, [fp, #-784]
	vdup.32	q8, r3
	vstr	d16, [fp, #-108]
	vstr	d17, [fp, #-100]
	vldr	d16, [fp, #-44]
	vldr	d17, [fp, #-36]
	vstr	d16, [fp, #-764]
	vstr	d17, [fp, #-756]
	vldr	d16, [fp, #-108]
	vldr	d17, [fp, #-100]
	vstr	d16, [fp, #-780]
	vstr	d17, [fp, #-772]
	vldr	d18, [fp, #-764]
	vldr	d19, [fp, #-756]
	vldr	d16, [fp, #-780]
	vldr	d17, [fp, #-772]
	vmul.i32	q8, q9, q8
	vstr	d16, [fp, #-124]
	vstr	d17, [fp, #-116]
	mov	r3, #112
	str	r3, [fp, #-744]
	ldr	r3, [fp, #-744]
	vdup.32	q8, r3
	vstr	d16, [fp, #-140]
	vstr	d17, [fp, #-132]
	vldr	d16, [fp, #-60]
	vldr	d17, [fp, #-52]
	vstr	d16, [fp, #-724]
	vstr	d17, [fp, #-716]
	vldr	d16, [fp, #-140]
	vldr	d17, [fp, #-132]
	vstr	d16, [fp, #-740]
	vstr	d17, [fp, #-732]
	vldr	d18, [fp, #-724]
	vldr	d19, [fp, #-716]
	vldr	d16, [fp, #-740]
	vldr	d17, [fp, #-732]
	vmul.i32	q8, q9, q8
	vstr	d16, [fp, #-156]
	vstr	d17, [fp, #-148]
	mov	r3, #32768
	str	r3, [fp, #-704]
	ldr	r3, [fp, #-704]
	vdup.32	q8, r3
	vstr	d16, [fp, #-220]
	vstr	d17, [fp, #-212]
	vldr	d16, [fp, #-220]
	vldr	d17, [fp, #-212]
	vstr	d16, [fp, #-684]
	vstr	d17, [fp, #-676]
	vldr	d16, [fp, #-156]
	vldr	d17, [fp, #-148]
	vstr	d16, [fp, #-700]
	vstr	d17, [fp, #-692]
	vldr	d16, [fp, #-684]
	vldr	d17, [fp, #-676]
	vldr	d18, [fp, #-700]
	vldr	d19, [fp, #-692]
	vqadd.u32	q8, q8, q9
	vstr	d16, [fp, #-236]
	vstr	d17, [fp, #-228]
	vldr	d16, [fp, #-236]
	vldr	d17, [fp, #-228]
	vstr	d16, [fp, #-652]
	vstr	d17, [fp, #-644]
	vldr	d16, [fp, #-92]
	vldr	d17, [fp, #-84]
	vstr	d16, [fp, #-668]
	vstr	d17, [fp, #-660]
	vldr	d16, [fp, #-652]
	vldr	d17, [fp, #-644]
	vldr	d18, [fp, #-668]
	vldr	d19, [fp, #-660]
	vqsub.u32	q8, q8, q9
	vstr	d16, [fp, #-236]
	vstr	d17, [fp, #-228]
	vldr	d16, [fp, #-236]
	vldr	d17, [fp, #-228]
	vstr	d16, [fp, #-620]
	vstr	d17, [fp, #-612]
	vldr	d16, [fp, #-124]
	vldr	d17, [fp, #-116]
	vstr	d16, [fp, #-636]
	vstr	d17, [fp, #-628]
	vldr	d16, [fp, #-620]
	vldr	d17, [fp, #-612]
	vldr	d18, [fp, #-636]
	vldr	d19, [fp, #-628]
	vqsub.u32	q8, q8, q9
	vstr	d16, [fp, #-236]
	vstr	d17, [fp, #-228]
	vldr	d16, [fp, #-236]
	vldr	d17, [fp, #-228]
	vstr	d16, [fp, #-588]
	vstr	d17, [fp, #-580]
	vldr	d16, [fp, #-204]
	vldr	d17, [fp, #-196]
	vstr	d16, [fp, #-604]
	vstr	d17, [fp, #-596]
	vldr	d16, [fp, #-588]
	vldr	d17, [fp, #-580]
	vldr	d18, [fp, #-604]
	vldr	d19, [fp, #-596]
	vqadd.u32	q8, q8, q9
	vstr	d16, [fp, #-236]
	vstr	d17, [fp, #-228]
	vldr	d16, [fp, #-236]
	vldr	d17, [fp, #-228]
	vstr	d16, [fp, #-572]
	vstr	d17, [fp, #-564]
	vldr	d16, [fp, #-572]
	vldr	d17, [fp, #-564]
	vshr.u32	q8, q8, #8
	vstr	d16, [fp, #-236]
	vstr	d17, [fp, #-228]
	sub	r3, fp, #1184
	sub	r3, r3, #12
	sub	r3, r3, #8
	str	r3, [fp, #-540]
	vldr	d16, [fp, #-236]
	vldr	d17, [fp, #-228]
	vstr	d16, [fp, #-556]
	vstr	d17, [fp, #-548]
	vldr	d16, [fp, #-556]
	vldr	d17, [fp, #-548]
	ldr	r3, [fp, #-540]
	vst1.32	{d16-d17}, [r3]
	sub	r3, fp, #1184
	sub	r3, r3, #12
	sub	r3, r3, #8
	mov	r0, r3
	bl	clamp_crcb
	mov	r3, #112
	str	r3, [fp, #-536]
	ldr	r3, [fp, #-536]
	vdup.32	q8, r3
	vstr	d16, [fp, #-76]
	vstr	d17, [fp, #-68]
	vldr	d16, [fp, #-28]
	vldr	d17, [fp, #-20]
	vstr	d16, [fp, #-516]
	vstr	d17, [fp, #-508]
	vldr	d16, [fp, #-76]
	vldr	d17, [fp, #-68]
	vstr	d16, [fp, #-532]
	vstr	d17, [fp, #-524]
	vldr	d18, [fp, #-516]
	vldr	d19, [fp, #-508]
	vldr	d16, [fp, #-532]
	vldr	d17, [fp, #-524]
	vmul.i32	q8, q9, q8
	vstr	d16, [fp, #-92]
	vstr	d17, [fp, #-84]
	mov	r3, #94
	str	r3, [fp, #-496]
	ldr	r3, [fp, #-496]
	vdup.32	q8, r3
	vstr	d16, [fp, #-108]
	vstr	d17, [fp, #-100]
	vldr	d16, [fp, #-44]
	vldr	d17, [fp, #-36]
	vstr	d16, [fp, #-476]
	vstr	d17, [fp, #-468]
	vldr	d16, [fp, #-108]
	vldr	d17, [fp, #-100]
	vstr	d16, [fp, #-492]
	vstr	d17, [fp, #-484]
	vldr	d18, [fp, #-476]
	vldr	d19, [fp, #-468]
	vldr	d16, [fp, #-492]
	vldr	d17, [fp, #-484]
	vmul.i32	q8, q9, q8
	vstr	d16, [fp, #-124]
	vstr	d17, [fp, #-116]
	mov	r3, #18
	str	r3, [fp, #-456]
	ldr	r3, [fp, #-456]
	vdup.32	q8, r3
	vstr	d16, [fp, #-140]
	vstr	d17, [fp, #-132]
	vldr	d16, [fp, #-60]
	vldr	d17, [fp, #-52]
	vstr	d16, [fp, #-436]
	vstr	d17, [fp, #-428]
	vldr	d16, [fp, #-140]
	vldr	d17, [fp, #-132]
	vstr	d16, [fp, #-452]
	vstr	d17, [fp, #-444]
	vldr	d18, [fp, #-436]
	vldr	d19, [fp, #-428]
	vldr	d16, [fp, #-452]
	vldr	d17, [fp, #-444]
	vmul.i32	q8, q9, q8
	vstr	d16, [fp, #-156]
	vstr	d17, [fp, #-148]
	vldr	d16, [fp, #-220]
	vldr	d17, [fp, #-212]
	vstr	d16, [fp, #-404]
	vstr	d17, [fp, #-396]
	vldr	d16, [fp, #-92]
	vldr	d17, [fp, #-84]
	vstr	d16, [fp, #-420]
	vstr	d17, [fp, #-412]
	vldr	d16, [fp, #-404]
	vldr	d17, [fp, #-396]
	vldr	d18, [fp, #-420]
	vldr	d19, [fp, #-412]
	vqadd.u32	q8, q8, q9
	vstr	d16, [fp, #-252]
	vstr	d17, [fp, #-244]
	vldr	d16, [fp, #-252]
	vldr	d17, [fp, #-244]
	vstr	d16, [fp, #-372]
	vstr	d17, [fp, #-364]
	vldr	d16, [fp, #-204]
	vldr	d17, [fp, #-196]
	vstr	d16, [fp, #-388]
	vstr	d17, [fp, #-380]
	vldr	d16, [fp, #-372]
	vldr	d17, [fp, #-364]
	vldr	d18, [fp, #-388]
	vldr	d19, [fp, #-380]
	vqadd.u32	q8, q8, q9
	vstr	d16, [fp, #-252]
	vstr	d17, [fp, #-244]
	vldr	d16, [fp, #-252]
	vldr	d17, [fp, #-244]
	vstr	d16, [fp, #-340]
	vstr	d17, [fp, #-332]
	vldr	d16, [fp, #-124]
	vldr	d17, [fp, #-116]
	vstr	d16, [fp, #-356]
	vstr	d17, [fp, #-348]
	vldr	d16, [fp, #-340]
	vldr	d17, [fp, #-332]
	vldr	d18, [fp, #-356]
	vldr	d19, [fp, #-348]
	vqsub.u32	q8, q8, q9
	vstr	d16, [fp, #-252]
	vstr	d17, [fp, #-244]
	vldr	d16, [fp, #-252]
	vldr	d17, [fp, #-244]
	vstr	d16, [fp, #-308]
	vstr	d17, [fp, #-300]
	vldr	d16, [fp, #-156]
	vldr	d17, [fp, #-148]
	vstr	d16, [fp, #-324]
	vstr	d17, [fp, #-316]
	vldr	d16, [fp, #-308]
	vldr	d17, [fp, #-300]
	vldr	d18, [fp, #-324]
	vldr	d19, [fp, #-316]
	vqsub.u32	q8, q8, q9
	vstr	d16, [fp, #-252]
	vstr	d17, [fp, #-244]
	vldr	d16, [fp, #-252]
	vldr	d17, [fp, #-244]
	vstr	d16, [fp, #-292]
	vstr	d17, [fp, #-284]
	vldr	d16, [fp, #-292]
	vldr	d17, [fp, #-284]
	vshr.u32	q8, q8, #8
	vstr	d16, [fp, #-252]
	vstr	d17, [fp, #-244]
	sub	r3, fp, #1200
	sub	r3, r3, #12
	sub	r3, r3, #8
	str	r3, [fp, #-256]
	vldr	d16, [fp, #-252]
	vldr	d17, [fp, #-244]
	vstr	d16, [fp, #-276]
	vstr	d17, [fp, #-268]
	vldr	d16, [fp, #-276]
	vldr	d17, [fp, #-268]
	ldr	r3, [fp, #-256]
	vst1.32	{d16-d17}, [r3]
	sub	r3, fp, #1200
	sub	r3, r3, #12
	sub	r3, r3, #8
	mov	r0, r3
	bl	clamp_crcb
	ldr	r3, [fp, #-1220]
	uxtb	r0, r3
	ldr	r3, [fp, #-1216]
	uxtb	r1, r3
	ldr	r3, [fp, #-1212]
	uxtb	r2, r3
	ldr	r3, [fp, #-1208]
	uxtb	ip, r3
	ldr	r3, [fp, #-1480]
	asr	r4, r3, #1
	ldr	r3, [fp, #-1484]
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
	ldr	r3, [fp, #-1204]
	uxtb	r0, r3
	ldr	r3, [fp, #-1200]
	uxtb	r1, r3
	ldr	r3, [fp, #-1196]
	uxtb	r2, r3
	ldr	r3, [fp, #-1192]
	uxtb	ip, r3
	ldr	r3, [fp, #-1480]
	asr	r4, r3, #1
	ldr	r3, [fp, #-1484]
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
	nop
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, pc}
	.size	CSC_RGB_to_YCC_neon, .-CSC_RGB_to_YCC_neon
	.align	2
	.global	CSC_YCC_to_RGB_neon
	.syntax unified
	.arm
	.fpu neon
	.type	CSC_YCC_to_RGB_neon, %function
CSC_YCC_to_RGB_neon:
	@ args = 0, pretend = 0, frame = 1288
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #1280
	sub	sp, sp, #8
	str	r0, [fp, #-1288]
	str	r1, [fp, #-1292]
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	ldr	r1, [fp, #-1288]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-1292]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-948]
	ldr	r3, [fp, #-1292]
	add	r0, r3, #1
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	ldr	r1, [fp, #-1288]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-944]
	ldr	r3, [fp, #-1288]
	add	r1, r3, #1
	movw	r2, #:lower16:Y
	movt	r2, #:upper16:Y
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-1292]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-940]
	ldr	r3, [fp, #-1288]
	add	r1, r3, #1
	ldr	r3, [fp, #-1292]
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
	str	r3, [fp, #-936]
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	ldr	r1, [fp, #-1288]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-1292]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-964]
	ldr	r3, [fp, #-1292]
	add	r0, r3, #1
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	ldr	r1, [fp, #-1288]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-960]
	ldr	r3, [fp, #-1288]
	add	r1, r3, #1
	movw	r2, #:lower16:Cb_temp
	movt	r2, #:upper16:Cb_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-1292]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-956]
	ldr	r3, [fp, #-1288]
	add	r1, r3, #1
	ldr	r3, [fp, #-1292]
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
	str	r3, [fp, #-952]
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	ldr	r1, [fp, #-1288]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-1292]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-980]
	ldr	r3, [fp, #-1292]
	add	r0, r3, #1
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	ldr	r1, [fp, #-1288]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-976]
	ldr	r3, [fp, #-1288]
	add	r1, r3, #1
	movw	r2, #:lower16:Cr_temp
	movt	r2, #:upper16:Cr_temp
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-1292]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-972]
	ldr	r3, [fp, #-1288]
	add	r1, r3, #1
	ldr	r3, [fp, #-1292]
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
	str	r3, [fp, #-968]
	sub	r3, fp, #948
	str	r3, [fp, #-932]
	ldr	r3, [fp, #-932]
	vld1.32	{d16-d17}, [r3]
	vstr	d16, [fp, #-20]
	vstr	d17, [fp, #-12]
	mov	r3, #16
	str	r3, [fp, #-928]
	ldr	r3, [fp, #-928]
	vdup.32	q8, r3
	vstr	d16, [fp, #-36]
	vstr	d17, [fp, #-28]
	vldr	d16, [fp, #-20]
	vldr	d17, [fp, #-12]
	vstr	d16, [fp, #-908]
	vstr	d17, [fp, #-900]
	vldr	d16, [fp, #-36]
	vldr	d17, [fp, #-28]
	vstr	d16, [fp, #-924]
	vstr	d17, [fp, #-916]
	vldr	d16, [fp, #-908]
	vldr	d17, [fp, #-900]
	vldr	d18, [fp, #-924]
	vldr	d19, [fp, #-916]
	vqsub.s32	q8, q8, q9
	vstr	d16, [fp, #-20]
	vstr	d17, [fp, #-12]
	mov	r3, #128
	str	r3, [fp, #-892]
	ldr	r3, [fp, #-892]
	vdup.32	q8, r3
	vstr	d16, [fp, #-52]
	vstr	d17, [fp, #-44]
	sub	r3, fp, #964
	str	r3, [fp, #-888]
	ldr	r3, [fp, #-888]
	vld1.32	{d16-d17}, [r3]
	vstr	d16, [fp, #-68]
	vstr	d17, [fp, #-60]
	vldr	d16, [fp, #-68]
	vldr	d17, [fp, #-60]
	vstr	d16, [fp, #-868]
	vstr	d17, [fp, #-860]
	vldr	d16, [fp, #-52]
	vldr	d17, [fp, #-44]
	vstr	d16, [fp, #-884]
	vstr	d17, [fp, #-876]
	vldr	d16, [fp, #-868]
	vldr	d17, [fp, #-860]
	vldr	d18, [fp, #-884]
	vldr	d19, [fp, #-876]
	vqsub.s32	q8, q8, q9
	vstr	d16, [fp, #-68]
	vstr	d17, [fp, #-60]
	sub	r3, fp, #980
	str	r3, [fp, #-848]
	ldr	r3, [fp, #-848]
	vld1.32	{d16-d17}, [r3]
	vstr	d16, [fp, #-84]
	vstr	d17, [fp, #-76]
	vldr	d16, [fp, #-84]
	vldr	d17, [fp, #-76]
	vstr	d16, [fp, #-828]
	vstr	d17, [fp, #-820]
	vldr	d16, [fp, #-52]
	vldr	d17, [fp, #-44]
	vstr	d16, [fp, #-844]
	vstr	d17, [fp, #-836]
	vldr	d16, [fp, #-828]
	vldr	d17, [fp, #-820]
	vldr	d18, [fp, #-844]
	vldr	d19, [fp, #-836]
	vqsub.s32	q8, q8, q9
	vstr	d16, [fp, #-84]
	vstr	d17, [fp, #-76]
	mov	r3, #74
	str	r3, [fp, #-808]
	ldr	r3, [fp, #-808]
	vdup.32	q8, r3
	vstr	d16, [fp, #-100]
	vstr	d17, [fp, #-92]
	vldr	d16, [fp, #-20]
	vldr	d17, [fp, #-12]
	vstr	d16, [fp, #-788]
	vstr	d17, [fp, #-780]
	vldr	d16, [fp, #-100]
	vldr	d17, [fp, #-92]
	vstr	d16, [fp, #-804]
	vstr	d17, [fp, #-796]
	vldr	d18, [fp, #-788]
	vldr	d19, [fp, #-780]
	vldr	d16, [fp, #-804]
	vldr	d17, [fp, #-796]
	vmul.i32	q8, q9, q8
	vstr	d16, [fp, #-116]
	vstr	d17, [fp, #-108]
	mov	r3, #102
	str	r3, [fp, #-768]
	ldr	r3, [fp, #-768]
	vdup.32	q8, r3
	vstr	d16, [fp, #-132]
	vstr	d17, [fp, #-124]
	vldr	d16, [fp, #-84]
	vldr	d17, [fp, #-76]
	vstr	d16, [fp, #-748]
	vstr	d17, [fp, #-740]
	vldr	d16, [fp, #-132]
	vldr	d17, [fp, #-124]
	vstr	d16, [fp, #-764]
	vstr	d17, [fp, #-756]
	vldr	d18, [fp, #-748]
	vldr	d19, [fp, #-740]
	vldr	d16, [fp, #-764]
	vldr	d17, [fp, #-756]
	vmul.i32	q8, q9, q8
	vstr	d16, [fp, #-148]
	vstr	d17, [fp, #-140]
	vldr	d16, [fp, #-116]
	vldr	d17, [fp, #-108]
	vstr	d16, [fp, #-716]
	vstr	d17, [fp, #-708]
	vldr	d16, [fp, #-148]
	vldr	d17, [fp, #-140]
	vstr	d16, [fp, #-732]
	vstr	d17, [fp, #-724]
	vldr	d16, [fp, #-716]
	vldr	d17, [fp, #-708]
	vldr	d18, [fp, #-732]
	vldr	d19, [fp, #-724]
	vqadd.s32	q8, q8, q9
	vstr	d16, [fp, #-164]
	vstr	d17, [fp, #-156]
	mov	r3, #256
	str	r3, [fp, #-696]
	ldr	r3, [fp, #-696]
	vdup.32	q8, r3
	vstr	d16, [fp, #-180]
	vstr	d17, [fp, #-172]
	vldr	d16, [fp, #-164]
	vldr	d17, [fp, #-156]
	vstr	d16, [fp, #-676]
	vstr	d17, [fp, #-668]
	vldr	d16, [fp, #-180]
	vldr	d17, [fp, #-172]
	vstr	d16, [fp, #-692]
	vstr	d17, [fp, #-684]
	vldr	d16, [fp, #-676]
	vldr	d17, [fp, #-668]
	vldr	d18, [fp, #-692]
	vldr	d19, [fp, #-684]
	vqadd.s32	q8, q8, q9
	vstr	d16, [fp, #-164]
	vstr	d17, [fp, #-156]
	vldr	d16, [fp, #-164]
	vldr	d17, [fp, #-156]
	vstr	d16, [fp, #-660]
	vstr	d17, [fp, #-652]
	vldr	d16, [fp, #-660]
	vldr	d17, [fp, #-652]
	vshr.s32	q8, q8, #6
	vstr	d16, [fp, #-164]
	vstr	d17, [fp, #-156]
	sub	r3, fp, #996
	str	r3, [fp, #-624]
	vldr	d16, [fp, #-164]
	vldr	d17, [fp, #-156]
	vstr	d16, [fp, #-644]
	vstr	d17, [fp, #-636]
	ldr	r3, [fp, #-624]
	vldr	d16, [fp, #-644]
	vldr	d17, [fp, #-636]
	vst1.32	{d16-d17}, [r3]
	sub	r3, fp, #996
	mov	r0, r3
	bl	clamp_rgb
	ldr	r3, [fp, #-996]
	uxtb	r0, r3
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	ldr	r1, [fp, #-1288]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-1292]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	ldr	r2, [fp, #-992]
	ldr	r3, [fp, #-1292]
	add	r0, r3, #1
	uxtb	ip, r2
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	ldr	r1, [fp, #-1288]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r2, [fp, #-988]
	ldr	r3, [fp, #-1288]
	add	r1, r3, #1
	uxtb	r0, r2
	movw	r2, #:lower16:R
	movt	r2, #:upper16:R
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-1292]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	ldr	r2, [fp, #-984]
	ldr	r3, [fp, #-1288]
	add	r1, r3, #1
	ldr	r3, [fp, #-1292]
	add	r0, r3, #1
	uxtb	ip, r2
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
	mov	r3, #52
	str	r3, [fp, #-620]
	ldr	r3, [fp, #-620]
	vdup.32	q8, r3
	vstr	d16, [fp, #-196]
	vstr	d17, [fp, #-188]
	mov	r3, #25
	str	r3, [fp, #-616]
	ldr	r3, [fp, #-616]
	vdup.32	q8, r3
	vstr	d16, [fp, #-212]
	vstr	d17, [fp, #-204]
	vldr	d16, [fp, #-84]
	vldr	d17, [fp, #-76]
	vstr	d16, [fp, #-596]
	vstr	d17, [fp, #-588]
	vldr	d16, [fp, #-196]
	vldr	d17, [fp, #-188]
	vstr	d16, [fp, #-612]
	vstr	d17, [fp, #-604]
	vldr	d18, [fp, #-596]
	vldr	d19, [fp, #-588]
	vldr	d16, [fp, #-612]
	vldr	d17, [fp, #-604]
	vmul.i32	q8, q9, q8
	vstr	d16, [fp, #-148]
	vstr	d17, [fp, #-140]
	vldr	d16, [fp, #-68]
	vldr	d17, [fp, #-60]
	vstr	d16, [fp, #-564]
	vstr	d17, [fp, #-556]
	vldr	d16, [fp, #-212]
	vldr	d17, [fp, #-204]
	vstr	d16, [fp, #-580]
	vstr	d17, [fp, #-572]
	vldr	d18, [fp, #-564]
	vldr	d19, [fp, #-556]
	vldr	d16, [fp, #-580]
	vldr	d17, [fp, #-572]
	vmul.i32	q8, q9, q8
	vstr	d16, [fp, #-228]
	vstr	d17, [fp, #-220]
	vldr	d16, [fp, #-116]
	vldr	d17, [fp, #-108]
	vstr	d16, [fp, #-532]
	vstr	d17, [fp, #-524]
	vldr	d16, [fp, #-148]
	vldr	d17, [fp, #-140]
	vstr	d16, [fp, #-548]
	vstr	d17, [fp, #-540]
	vldr	d16, [fp, #-532]
	vldr	d17, [fp, #-524]
	vldr	d18, [fp, #-548]
	vldr	d19, [fp, #-540]
	vqsub.s32	q8, q8, q9
	vstr	d16, [fp, #-244]
	vstr	d17, [fp, #-236]
	vldr	d16, [fp, #-244]
	vldr	d17, [fp, #-236]
	vstr	d16, [fp, #-500]
	vstr	d17, [fp, #-492]
	vldr	d16, [fp, #-228]
	vldr	d17, [fp, #-220]
	vstr	d16, [fp, #-516]
	vstr	d17, [fp, #-508]
	vldr	d16, [fp, #-500]
	vldr	d17, [fp, #-492]
	vldr	d18, [fp, #-516]
	vldr	d19, [fp, #-508]
	vqsub.s32	q8, q8, q9
	vstr	d16, [fp, #-244]
	vstr	d17, [fp, #-236]
	vldr	d16, [fp, #-244]
	vldr	d17, [fp, #-236]
	vstr	d16, [fp, #-468]
	vstr	d17, [fp, #-460]
	vldr	d16, [fp, #-180]
	vldr	d17, [fp, #-172]
	vstr	d16, [fp, #-484]
	vstr	d17, [fp, #-476]
	vldr	d16, [fp, #-468]
	vldr	d17, [fp, #-460]
	vldr	d18, [fp, #-484]
	vldr	d19, [fp, #-476]
	vqadd.s32	q8, q8, q9
	vstr	d16, [fp, #-244]
	vstr	d17, [fp, #-236]
	vldr	d16, [fp, #-244]
	vldr	d17, [fp, #-236]
	vstr	d16, [fp, #-452]
	vstr	d17, [fp, #-444]
	vldr	d16, [fp, #-452]
	vldr	d17, [fp, #-444]
	vshr.s32	q8, q8, #6
	vstr	d16, [fp, #-244]
	vstr	d17, [fp, #-236]
	sub	r3, fp, #1012
	str	r3, [fp, #-420]
	vldr	d16, [fp, #-244]
	vldr	d17, [fp, #-236]
	vstr	d16, [fp, #-436]
	vstr	d17, [fp, #-428]
	ldr	r3, [fp, #-420]
	vldr	d16, [fp, #-436]
	vldr	d17, [fp, #-428]
	vst1.32	{d16-d17}, [r3]
	sub	r3, fp, #1012
	mov	r0, r3
	bl	clamp_rgb
	ldr	r3, [fp, #-1012]
	uxtb	r0, r3
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	ldr	r1, [fp, #-1288]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-1292]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	ldr	r2, [fp, #-1008]
	ldr	r3, [fp, #-1292]
	add	r0, r3, #1
	uxtb	ip, r2
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	ldr	r1, [fp, #-1288]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r2, [fp, #-1004]
	ldr	r3, [fp, #-1288]
	add	r1, r3, #1
	uxtb	r0, r2
	movw	r2, #:lower16:G
	movt	r2, #:upper16:G
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-1292]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	ldr	r2, [fp, #-1000]
	ldr	r3, [fp, #-1288]
	add	r1, r3, #1
	ldr	r3, [fp, #-1292]
	add	r0, r3, #1
	uxtb	ip, r2
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
	mov	r3, #129
	str	r3, [fp, #-416]
	ldr	r3, [fp, #-416]
	vdup.32	q8, r3
	vstr	d16, [fp, #-260]
	vstr	d17, [fp, #-252]
	vldr	d16, [fp, #-68]
	vldr	d17, [fp, #-60]
	vstr	d16, [fp, #-396]
	vstr	d17, [fp, #-388]
	vldr	d16, [fp, #-260]
	vldr	d17, [fp, #-252]
	vstr	d16, [fp, #-412]
	vstr	d17, [fp, #-404]
	vldr	d18, [fp, #-396]
	vldr	d19, [fp, #-388]
	vldr	d16, [fp, #-412]
	vldr	d17, [fp, #-404]
	vmul.i32	q8, q9, q8
	vstr	d16, [fp, #-228]
	vstr	d17, [fp, #-220]
	vldr	d16, [fp, #-116]
	vldr	d17, [fp, #-108]
	vstr	d16, [fp, #-364]
	vstr	d17, [fp, #-356]
	vldr	d16, [fp, #-228]
	vldr	d17, [fp, #-220]
	vstr	d16, [fp, #-380]
	vstr	d17, [fp, #-372]
	vldr	d16, [fp, #-364]
	vldr	d17, [fp, #-356]
	vldr	d18, [fp, #-380]
	vldr	d19, [fp, #-372]
	vqadd.s32	q8, q8, q9
	vstr	d16, [fp, #-276]
	vstr	d17, [fp, #-268]
	vldr	d16, [fp, #-276]
	vldr	d17, [fp, #-268]
	vstr	d16, [fp, #-332]
	vstr	d17, [fp, #-324]
	vldr	d16, [fp, #-180]
	vldr	d17, [fp, #-172]
	vstr	d16, [fp, #-348]
	vstr	d17, [fp, #-340]
	vldr	d16, [fp, #-332]
	vldr	d17, [fp, #-324]
	vldr	d18, [fp, #-348]
	vldr	d19, [fp, #-340]
	vqadd.s32	q8, q8, q9
	vstr	d16, [fp, #-276]
	vstr	d17, [fp, #-268]
	vldr	d16, [fp, #-276]
	vldr	d17, [fp, #-268]
	vstr	d16, [fp, #-316]
	vstr	d17, [fp, #-308]
	vldr	d16, [fp, #-316]
	vldr	d17, [fp, #-308]
	vshr.s32	q8, q8, #6
	vstr	d16, [fp, #-276]
	vstr	d17, [fp, #-268]
	sub	r3, fp, #1024
	sub	r3, r3, #4
	str	r3, [fp, #-280]
	vldr	d16, [fp, #-276]
	vldr	d17, [fp, #-268]
	vstr	d16, [fp, #-300]
	vstr	d17, [fp, #-292]
	ldr	r3, [fp, #-280]
	vldr	d16, [fp, #-300]
	vldr	d17, [fp, #-292]
	vst1.32	{d16-d17}, [r3]
	sub	r3, fp, #1024
	sub	r3, r3, #4
	mov	r0, r3
	bl	clamp_rgb
	ldr	r3, [fp, #-1028]
	uxtb	r0, r3
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	ldr	r1, [fp, #-1288]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-1292]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	ldr	r2, [fp, #-1024]
	ldr	r3, [fp, #-1292]
	add	r0, r3, #1
	uxtb	ip, r2
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	ldr	r1, [fp, #-1288]
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, ip
	strb	r2, [r3]
	ldr	r2, [fp, #-1020]
	ldr	r3, [fp, #-1288]
	add	r1, r3, #1
	uxtb	r0, r2
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-1292]
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	ldr	r2, [fp, #-1016]
	ldr	r3, [fp, #-1288]
	add	r1, r3, #1
	ldr	r3, [fp, #-1292]
	add	r0, r3, #1
	uxtb	ip, r2
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
	.size	CSC_YCC_to_RGB_neon, .-CSC_YCC_to_RGB_neon
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
