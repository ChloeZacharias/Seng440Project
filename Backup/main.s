	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 19, 1
	.eabi_attribute 23, 1
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Y: %u\012\000"
	.align	2
.LC1:
	.ascii	"Cb: %u\012\000"
	.align	2
.LC2:
	.ascii	"Cr: %u\012\000"
	.text
	.align	2
	.global	main
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	mov	r3, #48
	str	r3, [fp, #-8]
	mov	r3, #29
	str	r3, [fp, #-12]
	mov	r3, #219
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	lsl	r2, r3, #6
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #7
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	asr	r3, r3, #8
	add	r3, r3, #16
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	lsl	r2, r3, #5
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r2, r2, r3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	add	r3, r2, r3
	rsb	r2, r3, #0
	ldr	r3, [fp, #-12]
	lsl	r1, r3, #6
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #3
	add	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #1
	add	r3, r1, r3
	sub	r2, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #7
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	sub	r3, r2, r3
	asr	r3, r3, #8
	add	r3, r3, #128
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	lsl	r2, r3, #7
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	sub	r2, r2, r3
	ldr	r3, [fp, #-12]
	lsl	r1, r3, #6
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #5
	add	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #1
	sub	r3, r1, r3
	sub	r2, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r1, r3, #4
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	add	r3, r1, r3
	sub	r3, r2, r3
	asr	r3, r3, #8
	add	r3, r3, #128
	str	r3, [fp, #-28]
	ldr	r1, [fp, #-20]
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	printf
	ldr	r1, [fp, #-24]
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	printf
	ldr	r1, [fp, #-28]
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
