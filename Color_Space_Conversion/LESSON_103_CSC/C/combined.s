	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"CSC_main.c"
	.text
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.arch armv7-a
	.syntax unified
	.arm
	.fpu neon
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:.LC0
	movw	r0, #:lower16:.LC1
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movt	r1, #:upper16:.LC0
	sub	sp, sp, #20
	movt	r0, #:upper16:.LC1
	bl	fopen
	subs	r5, r0, #0
	beq	.L4
	movw	r1, #:lower16:.LC3
	movw	r0, #:lower16:.LC4
	movt	r1, #:upper16:.LC3
	movt	r0, #:upper16:.LC4
	bl	fopen
	subs	r9, r0, #0
	beq	.L4
	movw	r1, #:lower16:.LC3
	movw	r0, #:lower16:.LC5
	movt	r1, #:upper16:.LC3
	movt	r0, #:upper16:.LC5
	bl	fopen
	subs	r10, r0, #0
	beq	.L4
	movw	r1, #:lower16:.LC3
	movw	r0, #:lower16:.LC6
	movt	r1, #:upper16:.LC3
	movt	r0, #:upper16:.LC6
	bl	fopen
	subs	fp, r0, #0
	beq	.L4
	movw	r3, #:lower16:R
	movt	r3, #:upper16:R
	add	r0, r3, #47
	mov	r8, r0
	ldr	r1, .L42
	ldr	r2, .L42+4
	sub	r1, r1, r3
	sub	r3, r2, r3
	str	r0, [sp, #12]
	str	r1, [sp, #4]
	str	r3, [sp, #8]
.L5:
	ldr	r3, [sp, #4]
	sub	r4, r8, #48
	add	r7, r3, r8
	ldr	r3, [sp, #8]
	add	r6, r3, r8
.L6:
	mov	r0, r5
	bl	fgetc
	mov	r1, r9
	strb	r0, [r4, #1]!
	uxtb	r0, r0
	bl	fputc
	mov	r0, r5
	bl	fgetc
	mov	r3, r0
	mov	r1, r10
	strb	r3, [r7, #1]!
	uxtb	r0, r0
	bl	fputc
	mov	r0, r5
	bl	fgetc
	mov	r3, r0
	mov	r1, fp
	uxtb	r0, r0
	strb	r3, [r6, #1]!
	bl	fputc
	cmp	r4, r8
	bne	.L6
	ldr	r3, .L42+8
	add	r8, r4, #48
	cmp	r8, r3
	bne	.L5
	mov	r0, fp
	bl	fclose
	mov	r0, r10
	bl	fclose
	mov	r0, r9
	bl	fclose
	mov	r0, r5
	bl	fclose
	bl	CSC_RGB_to_YCC
	movw	r1, #:lower16:.LC3
	movw	r0, #:lower16:.LC7
	movt	r1, #:upper16:.LC3
	movt	r0, #:upper16:.LC7
	bl	fopen
	subs	r5, r0, #0
	beq	.L39
	movw	r1, #:lower16:.LC3
	movw	r0, #:lower16:.LC9
	movt	r1, #:upper16:.LC3
	movt	r0, #:upper16:.LC9
	bl	fopen
	subs	r6, r0, #0
	beq	.L40
	movw	r1, #:lower16:.LC3
	movw	r0, #:lower16:.LC10
	movt	r1, #:upper16:.LC3
	movt	r0, #:upper16:.LC10
	bl	fopen
	subs	r7, r0, #0
	ldrne	r4, .L42+12
	addne	r8, r4, #3072
	beq	.L41
.L12:
	sub	r9, r4, #48
.L11:
	ldrb	r0, [r9, #1]!	@ zero_extendqisi2
	mov	r1, r5
	bl	fputc
	cmp	r9, r4
	bne	.L11
	add	r4, r9, #48
	cmp	r4, r8
	bne	.L12
	movw	r10, #:lower16:Cb
	ldr	r3, .L42+16
	movt	r10, #:upper16:Cb
	add	r8, r10, #24
	add	r9, r10, #792
	sub	r10, r3, r10
.L13:
	sub	r4, r8, #24
	add	fp, r10, r8
.L14:
	mov	r1, r6
	ldrb	r0, [r4], #1	@ zero_extendqisi2
	bl	fputc
	mov	r1, r7
	ldrb	r0, [fp], #1	@ zero_extendqisi2
	bl	fputc
	cmp	r4, r8
	bne	.L14
	add	r8, r4, #24
	cmp	r8, r9
	bne	.L13
	mov	r0, r7
	bl	fclose
	mov	r0, r6
	bl	fclose
	mov	r0, r5
	bl	fclose
	bl	CSC_YCC_to_RGB
	movw	r1, #:lower16:.LC3
	movw	r0, #:lower16:.LC11
	movt	r1, #:upper16:.LC3
	movt	r0, #:upper16:.LC11
	bl	fopen
	subs	r5, r0, #0
	beq	.L4
	ldmib	sp, {r9, r10}
	ldr	r8, [sp, #12]
.L16:
	sub	r4, r8, #48
	add	r7, r8, r9
	add	r6, r8, r10
.L17:
	mov	r1, r5
	ldrb	r0, [r4, #1]!	@ zero_extendqisi2
	bl	fputc
	mov	r1, r5
	ldrb	r0, [r7, #1]!	@ zero_extendqisi2
	bl	fputc
	mov	r1, r5
	ldrb	r0, [r6, #1]!	@ zero_extendqisi2
	bl	fputc
	cmp	r8, r4
	bne	.L17
	ldr	r3, .L42+8
	add	r8, r8, #48
	cmp	r8, r3
	bne	.L16
	mov	r0, r5
	bl	fclose
	mov	r0, #0
	b	.L1
.L4:
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	puts
	mov	r0, #1
.L1:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L39:
	movw	r3, #:lower16:stderr
	movw	r2, #:lower16:.LC7
	movw	r1, #:lower16:.LC8
	movt	r3, #:upper16:stderr
	ldr	r0, [r3]
	movt	r2, #:upper16:.LC7
	movt	r1, #:upper16:.LC8
	bl	fprintf
	mov	r0, #1
	b	.L1
.L40:
	movw	r3, #:lower16:stderr
	movw	r2, #:lower16:.LC9
	movw	r1, #:lower16:.LC8
	movt	r3, #:upper16:stderr
	ldr	r0, [r3]
	movt	r2, #:upper16:.LC9
	movt	r1, #:upper16:.LC8
	bl	fprintf
	mov	r0, #1
	b	.L1
.L41:
	movw	r3, #:lower16:stderr
	movw	r2, #:lower16:.LC10
	movw	r1, #:lower16:.LC8
	movt	r3, #:upper16:stderr
	ldr	r0, [r3]
	movt	r2, #:upper16:.LC10
	movt	r1, #:upper16:.LC8
	bl	fprintf
	mov	r0, #1
	b	.L1
.L43:
	.align	2
.L42:
	.word	G-48
	.word	B-48
	.word	R+3119
	.word	Y+47
	.word	Cr-24
	.size	main, .-main
	.comm	Cr_temp,3072,4
	.comm	Cb_temp,3072,4
	.comm	Cr,768,4
	.comm	Cb,768,4
	.comm	Y,3072,4
	.comm	B,3072,4
	.comm	G,3072,4
	.comm	R,3072,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"rb\000"
	.space	1
.LC1:
	.ascii	"./image_input_RGB_64_48_03.data\000"
.LC2:
	.ascii	"Cannot open file.\000"
	.space	2
.LC3:
	.ascii	"wb\000"
	.space	1
.LC4:
	.ascii	"./image_echo_R_64_48_03.data\000"
	.space	3
.LC5:
	.ascii	"./image_echo_G_64_48_03.data\000"
	.space	3
.LC6:
	.ascii	"./image_echo_B_64_48_03.data\000"
	.space	3
.LC7:
	.ascii	"./image_output_Y_64_48_03.data\000"
	.space	1
.LC8:
	.ascii	"Could not open %s\012\000"
	.space	1
.LC9:
	.ascii	"./image_output_Cb_64_48_03.data\000"
.LC10:
	.ascii	"./image_output_Cr_64_48_03.data\000"
.LC11:
	.ascii	"./image_output_RGB_64_48_03.data\000"
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
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"CSC_RGB_to_YCC_01.c"
	.text
	.align	2
	.global	CSC_RGB_to_YCC
	.arch armv7-a
	.syntax unified
	.arm
	.fpu neon
	.type	CSC_RGB_to_YCC, %function
CSC_RGB_to_YCC:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #62
.L2:
	mov	r4, #46
.L3:
	mov	r1, r4
	mov	r0, r5
	bl	CSC_RGB_to_YCC_neon
	subs	r4, r4, #2
	bne	.L3
	subs	r5, r5, #2
	bne	.L2
	pop	{r4, r5, r6, pc}
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
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"CSC_YCC_to_RGB_01.c"
	.text
	.align	2
	.global	CSC_YCC_to_RGB
	.arch armv7-a
	.syntax unified
	.arm
	.fpu neon
	.type	CSC_YCC_to_RGB, %function
CSC_YCC_to_RGB:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	upsample
	mov	r5, #62
.L2:
	mov	r4, #46
.L3:
	mov	r1, r4
	mov	r0, r5
	bl	CSC_YCC_to_RGB_neon
	subs	r4, r4, #2
	bne	.L3
	subs	r5, r5, #2
	bne	.L2
	pop	{r4, r5, r6, pc}
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
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"neon_conversions.c"
	.text
	.align	2
	.global	upsample
	.arch armv7-a
	.syntax unified
	.arm
	.fpu neon
	.type	upsample, %function
upsample:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:Cb
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r6, #62560
	movw	r7, #3071
	movw	r5, #3070
	ldr	r10, .L8
	movt	r3, #:upper16:Cb
	ldr	fp, .L8+4
	add	r9, r3, #744
	sub	r10, r10, r3
	movt	r6, 65535
.L2:
	ldr	r3, .L8+8
	add	ip, r9, #24
	add	r2, fp, r5
	add	r8, r10, r9
	add	r3, r3, r5
.L3:
	ldrb	r0, [ip, #-1]!	@ zero_extendqisi2
	ldrb	r1, [r8, #-1]!	@ zero_extendqisi2
	add	r4, r2, r6
	add	lr, r3, r6
	cmp	ip, r9
	strb	r0, [r2, #46]
	strb	r0, [r2, #47]
	strb	r1, [r3, #46]
	strb	r1, [r3, #47]
	strb	r0, [r4, r5]
	strb	r1, [lr, r5]
	sub	r2, r2, #2
	strb	r0, [r4, r7]
	sub	r3, r3, #2
	strb	r1, [lr, r7]
	bne	.L3
	add	r6, r6, #96
	cmp	r6, #96
	sub	r5, r5, #96
	sub	r7, r7, #96
	sub	r9, ip, #24
	bne	.L2
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L9:
	.align	2
.L8:
	.word	Cr+24
	.word	Cb_temp-94
	.word	Cr_temp-94
	.size	upsample, .-upsample
	.align	2
	.global	CSC_RGB_to_YCC_neon
	.syntax unified
	.arm
	.fpu neon
	.type	CSC_RGB_to_YCC_neon, %function
CSC_RGB_to_YCC_neon:
	@ args = 0, pretend = 0, frame = 144
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:R
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r4, #:lower16:G
	add	r6, r0, #1
	lsl	r5, r6, #1
	lsl	ip, r0, #1
	add	lr, r5, r6
	add	r2, ip, r0
	lsl	r8, lr, #4
	movt	r3, #:upper16:R
	lsl	r2, r2, #4
	add	r9, r3, r8
	add	r7, r3, r2
	add	r3, r1, #1
	ldrb	r10, [r9, r3]	@ zero_extendqisi2
	ldrb	fp, [r9, r1]	@ zero_extendqisi2
	sub	sp, sp, #148
	str	fp, [sp, #40]
	str	r10, [sp, #44]
	ldrb	r10, [r7, r1]	@ zero_extendqisi2
	ldrb	r7, [r7, r3]	@ zero_extendqisi2
	movt	r4, #:upper16:G
	str	r10, [sp, #32]
	str	r7, [sp, #36]
	add	r9, r4, r2
	ldrb	r7, [r9, r3]	@ zero_extendqisi2
	add	r4, r4, r8
	ldrb	r9, [r9, r1]	@ zero_extendqisi2
	str	r7, [sp, #20]
	ldrb	r7, [r4, r1]	@ zero_extendqisi2
	ldrb	r4, [r4, r3]	@ zero_extendqisi2
	vldr	d18, [sp, #32]
	vldr	d19, [sp, #40]
	str	r9, [sp, #16]
	str	r7, [sp, #24]
	str	r4, [sp, #28]
	vldr	d16, [sp, #16]
	vldr	d17, [sp, #24]
	movw	lr, #:lower16:B
	vstr	d18, [sp, #48]
	vstr	d19, [sp, #56]
	vstr	d16, [sp, #64]
	vstr	d17, [sp, #72]
	movt	lr, #:upper16:B
	add	r2, lr, r2
	ldrb	r7, [r2, r1]	@ zero_extendqisi2
	add	lr, lr, r8
	ldrb	r8, [r2, r3]	@ zero_extendqisi2
	ldrb	r4, [lr, r1]	@ zero_extendqisi2
	ldrb	r2, [lr, r3]	@ zero_extendqisi2
	stm	sp, {r7, r8}
	str	r2, [sp, #12]
	str	r4, [sp, #8]
	add	r2, sp, #48
	vld1.32	{d20-d21}, [r2:64]
	add	r2, sp, #64
	vld1.32	{d18-d19}, [r2:64]
	vld1.64	{d22-d23}, [sp:64]
	vmov.i32	q8, #66  @ v4si
	vmov.i32	q13, #129  @ v4si
	add	r2, sp, #80
	vstr	d22, [sp, #80]
	vstr	d23, [sp, #88]
	vmul.i32	q13, q13, q9
	vld1.32	{d22-d23}, [r2:64]
	vmul.i32	q8, q8, q10
	vmov.i32	q12, #25  @ v4si
	vqadd.u32	q8, q8, q13
	vmul.i32	q12, q12, q11
	vmov.i32	q14, #4096  @ v4si
	vqadd.u32	q8, q8, q12
	vmov.i32	q13, #128  @ v4si
	vqadd.u32	q8, q8, q14
	vqadd.u32	q8, q8, q13
	vshr.u32	q8, q8, #8
	add	r2, sp, #96
	vst1.32	{d16-d17}, [r2:64]
	ldr	r2, [sp, #108]
	cmp	r2, #15
	movls	r2, #16
	strls	r2, [sp, #108]
	bls	.L12
	cmp	r2, #235
	movhi	r2, #235
	strhi	r2, [sp, #108]
.L12:
	ldr	r2, [sp, #104]
	cmp	r2, #15
	movls	r2, #16
	strls	r2, [sp, #104]
	bls	.L14
	cmp	r2, #235
	movhi	r2, #235
	strhi	r2, [sp, #104]
.L14:
	ldr	r2, [sp, #100]
	cmp	r2, #15
	movls	r2, #16
	strls	r2, [sp, #100]
	bls	.L16
	cmp	r2, #235
	movhi	r2, #235
	strhi	r2, [sp, #100]
.L16:
	ldr	r2, [sp, #96]
	cmp	r2, #15
	movls	r2, #16
	strls	r2, [sp, #96]
	bls	.L18
	cmp	r2, #235
	movhi	r2, #235
	strhi	r2, [sp, #96]
.L18:
	vmov.i32	q8, #112  @ v4si
	vmov.i32	q12, #32768  @ v4si
	vmul.i32	q8, q8, q11
	vmov.i32	q15, #38  @ v4si
	vqadd.u32	q8, q12, q8
	vmul.i32	q15, q15, q10
	vmov.i32	q14, #74  @ v4si
	vqsub.u32	q8, q8, q15
	vmul.i32	q14, q14, q9
	vqsub.u32	q8, q8, q14
	vqadd.u32	q8, q8, q13
	movw	r2, #:lower16:Y
	vshr.u32	q8, q8, #8
	add	lr, sp, #112
	vst1.32	{d16-d17}, [lr:64]
	movt	r2, #:upper16:Y
	add	lr, r5, r6
	add	ip, ip, r0
	ldr	r6, [sp, #96]
	ldr	r5, [sp, #100]
	add	ip, r2, ip, lsl #4
	strb	r6, [ip, r1]
	add	r2, r2, lr, lsl #4
	strb	r5, [ip, r3]
	ldr	lr, [sp, #104]
	ldr	ip, [sp, #108]
	strb	lr, [r2, r1]
	strb	ip, [r2, r3]
	ldr	r3, [sp, #112]
	cmp	r3, #15
	movls	r3, #16
	strls	r3, [sp, #112]
	bls	.L26
	cmp	r3, #240
	movhi	r3, #240
	strhi	r3, [sp, #112]
.L26:
	vmov.i32	q8, #112  @ v4si
	vmul.i32	q8, q8, q10
	vmov.i32	q10, #94  @ v4si
	vqadd.u32	q12, q12, q8
	vmul.i32	q10, q10, q9
	vmov.i32	q8, #18  @ v4si
	vqadd.u32	q9, q12, q13
	vmul.i32	q11, q8, q11
	vqsub.u32	q9, q9, q10
	vqsub.u32	q11, q9, q11
	vshr.u32	q11, q11, #8
	add	r3, sp, #128
	vst1.32	{d22-d23}, [r3:64]
	ldr	r3, [sp, #128]
	cmp	r3, #15
	movls	r3, #16
	strls	r3, [sp, #128]
	bls	.L34
	cmp	r3, #240
	movhi	r3, #240
	strhi	r3, [sp, #128]
.L34:
	movw	r2, #:lower16:Cr
	movw	r3, #:lower16:Cb
	asr	r0, r0, #1
	add	r0, r0, r0, lsl #1
	lsl	r0, r0, #3
	ldr	lr, [sp, #128]
	movt	r3, #:upper16:Cb
	ldr	ip, [sp, #112]
	movt	r2, #:upper16:Cr
	add	r2, r2, r0
	add	r0, r3, r0
	strb	lr, [r2, r1, asr #1]
	strb	ip, [r0, r1, asr #1]
	add	sp, sp, #148
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	CSC_RGB_to_YCC_neon, .-CSC_RGB_to_YCC_neon
	.align	2
	.global	CSC_YCC_to_RGB_neon
	.syntax unified
	.arm
	.fpu neon
	.type	CSC_YCC_to_RGB_neon, %function
CSC_YCC_to_RGB_neon:
	@ args = 0, pretend = 0, frame = 144
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:Y
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r7, #:lower16:Cb_temp
	movw	r8, #:lower16:Cr_temp
	add	r6, r0, #1
	lsl	r4, r6, #1
	lsl	r2, r0, #1
	add	ip, r4, r6
	add	r5, r2, r0
	lsl	ip, ip, #4
	movt	r3, #:upper16:Y
	lsl	r5, r5, #4
	add	r9, r3, ip
	add	lr, r3, r5
	add	r3, r1, #1
	ldrb	r10, [r9, r3]	@ zero_extendqisi2
	ldrb	fp, [r9, r1]	@ zero_extendqisi2
	sub	sp, sp, #148
	str	fp, [sp, #40]
	str	r10, [sp, #44]
	ldrb	r10, [lr, r1]	@ zero_extendqisi2
	movt	r8, #:upper16:Cr_temp
	movt	r7, #:upper16:Cb_temp
	add	r9, r7, ip
	add	r7, r7, r5
	add	ip, r8, ip
	add	r5, r8, r5
	ldrb	r8, [lr, r3]	@ zero_extendqisi2
	str	r10, [sp, #32]
	ldrb	r10, [r9, r1]	@ zero_extendqisi2
	ldrb	lr, [r9, r3]	@ zero_extendqisi2
	str	r8, [sp, #36]
	ldrb	r8, [r7, r1]	@ zero_extendqisi2
	ldrb	r9, [r7, r3]	@ zero_extendqisi2
	str	r10, [sp, #24]
	ldrb	r7, [r5, r3]	@ zero_extendqisi2
	ldrb	r5, [r5, r1]	@ zero_extendqisi2
	str	lr, [sp, #28]
	ldrb	lr, [ip, r1]	@ zero_extendqisi2
	ldrb	ip, [ip, r3]	@ zero_extendqisi2
	stm	sp, {r5, r7, lr}
	strd	r8, [sp, #16]
	vldr	d20, [sp, #32]
	vldr	d21, [sp, #40]
	str	ip, [sp, #12]
	vldr	d18, [sp, #16]
	vldr	d19, [sp, #24]
	vld1.64	{d16-d17}, [sp:64]
	vstr	d20, [sp, #48]
	vstr	d21, [sp, #56]
	vstr	d18, [sp, #64]
	vstr	d19, [sp, #72]
	vstr	d16, [sp, #80]
	vstr	d17, [sp, #88]
	add	ip, sp, #48
	vld1.32	{d16-d17}, [ip:64]
	add	ip, sp, #64
	vld1.32	{d22-d23}, [ip:64]
	add	ip, sp, #80
	vld1.32	{d24-d25}, [ip:64]
	vmov.i32	q14, #128  @ v4si
	vmov.i32	q13, #16  @ v4si
	vqsub.s32	q12, q12, q14
	vqsub.s32	q13, q8, q13
	vmov.i32	q10, #102  @ v4si
	vmov.i32	q8, #74  @ v4si
	vmul.i32	q10, q10, q12
	vmul.i32	q8, q8, q13
	vmov.i32	q13, #256  @ v4si
	vqadd.s32	q10, q8, q10
	vqadd.s32	q10, q10, q13
	vshr.s32	q10, q10, #6
	add	ip, sp, #96
	vst1.32	{d20-d21}, [ip:64]
	ldr	ip, [sp, #108]
	vqsub.s32	q10, q11, q14
	cmp	ip, #0
	movlt	ip, #0
	strlt	ip, [sp, #108]
	blt	.L38
	cmp	ip, #255
	movgt	ip, #255
	strgt	ip, [sp, #108]
.L38:
	ldr	ip, [sp, #104]
	cmp	ip, #0
	movlt	ip, #0
	strlt	ip, [sp, #104]
	blt	.L40
	cmp	ip, #255
	movgt	ip, #255
	strgt	ip, [sp, #104]
.L40:
	ldr	ip, [sp, #100]
	cmp	ip, #0
	movlt	ip, #0
	strlt	ip, [sp, #100]
	blt	.L42
	cmp	ip, #255
	movgt	ip, #255
	strgt	ip, [sp, #100]
.L42:
	ldr	ip, [sp, #96]
	cmp	ip, #0
	movlt	ip, #0
	strlt	ip, [sp, #96]
	blt	.L44
	cmp	ip, #255
	movgt	ip, #255
	strgt	ip, [sp, #96]
.L44:
	vmov.i32	q9, #52  @ v4si
	vmov.i32	q11, #25  @ v4si
	vmul.i32	q9, q9, q12
	vmul.i32	q11, q11, q10
	vqsub.s32	q9, q8, q9
	vqsub.s32	q9, q9, q11
	vqadd.s32	q9, q9, q13
	movw	lr, #:lower16:R
	vshr.s32	q9, q9, #6
	add	ip, sp, #112
	vst1.32	{d18-d19}, [ip:64]
	movt	lr, #:upper16:R
	ldr	r7, [sp, #96]
	add	ip, r2, r0
	add	ip, lr, ip, lsl #4
	ldr	r8, [sp, #100]
	strb	r7, [ip, r1]
	ldr	r5, [sp, #124]
	add	r7, r4, r6
	add	lr, lr, r7, lsl #4
	strb	r8, [ip, r3]
	ldr	r7, [sp, #104]
	ldr	ip, [sp, #108]
	cmp	r5, #0
	strb	r7, [lr, r1]
	strb	ip, [lr, r3]
	movlt	ip, #0
	strlt	ip, [sp, #124]
	blt	.L46
	cmp	r5, #255
	movgt	ip, #255
	strgt	ip, [sp, #124]
.L46:
	ldr	ip, [sp, #120]
	cmp	ip, #0
	movlt	ip, #0
	strlt	ip, [sp, #120]
	blt	.L48
	cmp	ip, #255
	movgt	ip, #255
	strgt	ip, [sp, #120]
.L48:
	ldr	ip, [sp, #116]
	cmp	ip, #0
	movlt	ip, #0
	strlt	ip, [sp, #116]
	blt	.L50
	cmp	ip, #255
	movgt	ip, #255
	strgt	ip, [sp, #116]
.L50:
	ldr	ip, [sp, #112]
	cmp	ip, #0
	movlt	ip, #0
	strlt	ip, [sp, #112]
	blt	.L52
	cmp	ip, #255
	movgt	ip, #255
	strgt	ip, [sp, #112]
.L52:
	vmov.i32	q9, #129  @ v4si
	vmul.i32	q10, q9, q10
	vqadd.s32	q8, q8, q10
	vqadd.s32	q8, q8, q13
	vshr.s32	q8, q8, #6
	add	ip, sp, #128
	movw	lr, #:lower16:G
	vst1.32	{d16-d17}, [ip:64]
	ldr	ip, [sp, #140]
	movt	lr, #:upper16:G
	cmp	ip, #0
	movlt	ip, #0
	ldr	r7, [sp, #112]
	add	r5, r2, r0
	add	r5, lr, r5, lsl #4
	ldr	r8, [sp, #116]
	strb	r7, [r5, r1]
	add	r7, r4, r6
	add	lr, lr, r7, lsl #4
	strb	r8, [r5, r3]
	ldr	r7, [sp, #120]
	ldr	r5, [sp, #124]
	strb	r7, [lr, r1]
	strlt	ip, [sp, #140]
	strb	r5, [lr, r3]
	blt	.L54
	cmp	ip, #255
	movgt	ip, #255
	strgt	ip, [sp, #140]
.L54:
	ldr	ip, [sp, #136]
	cmp	ip, #0
	movlt	ip, #0
	strlt	ip, [sp, #136]
	blt	.L56
	cmp	ip, #255
	movgt	ip, #255
	strgt	ip, [sp, #136]
.L56:
	ldr	ip, [sp, #132]
	cmp	ip, #0
	movlt	ip, #0
	strlt	ip, [sp, #132]
	blt	.L58
	cmp	ip, #255
	movgt	ip, #255
	strgt	ip, [sp, #132]
.L58:
	ldr	ip, [sp, #128]
	cmp	ip, #0
	movlt	ip, #0
	strlt	ip, [sp, #128]
	blt	.L60
	cmp	ip, #255
	movgt	ip, #255
	strgt	ip, [sp, #128]
.L60:
	movw	ip, #:lower16:B
	add	r0, r2, r0
	movt	ip, #:upper16:B
	ldr	r2, [sp, #128]
	add	r0, ip, r0, lsl #4
	strb	r2, [r0, r1]
	add	r4, r4, r6
	ldr	r5, [sp, #132]
	ldr	lr, [sp, #136]
	ldr	r2, [sp, #140]
	add	ip, ip, r4, lsl #4
	strb	r5, [r0, r3]
	strb	lr, [ip, r1]
	strb	r2, [ip, r3]
	add	sp, sp, #148
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	CSC_YCC_to_RGB_neon, .-CSC_YCC_to_RGB_neon
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
