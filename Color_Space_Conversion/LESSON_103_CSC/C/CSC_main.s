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
