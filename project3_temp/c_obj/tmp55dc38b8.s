	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-68, %esp
	jmp __274
.globl __274
__274:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 4(%esp)
	movl 0(%esp), %ebx
	movl 4(%esp), %ecx
	movl $0, 8(%esp)
	cmpl %ecx, %ebx
	setG 8(%esp)
	movl 8(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __268
.globl __268
__268:
	movl 12(%esp), %ecx
	movl %ecx, 16(%esp)
	movl 16(%esp), %ecx
	movl %ecx, 20(%esp)
	jmp __269
.globl __269
__269:
	movl 12(%esp), %ecx
	movl %ecx, 24(%esp)
	movl 20(%esp), %ecx
	movl %ecx, 28(%esp)
	movl 24(%esp), %ebx
	movl 28(%esp), %ecx
	movl $0, 32(%esp)
	cmpl %ecx, %ebx
	setE 32(%esp)
	cmpl $0, 32(%esp)
	jE __267
	jNE __273
.globl __273
__273:
	movl 12(%esp), %ecx
	movl %ecx, 36(%esp)
	movl 20(%esp), %ecx
	movl %ecx, 40(%esp)
	movl 36(%esp), %ebx
	movl 40(%esp), %ecx
	movl $0, 44(%esp)
	cmpl %ecx, %ebx
	setE 44(%esp)
	cmpl $0, 44(%esp)
	jE __272
	jNE __271
.globl __271
__271:
	movl $42, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 48(%esp)
	movl 48(%esp), %ecx
	movl %ecx, 20(%esp)
	jmp __270
.globl __272
__272:
	jmp __270
.globl __270
__270:
	movl 20(%esp), %ecx
	movl %ecx, 52(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 56(%esp)
	movl 56(%esp), %ecx
	movl 52(%esp), %eax
	subl %ecx, %eax
	movl %eax, 60(%esp)
	movl 60(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __269
.globl __267
__267:
	movl 12(%esp), %ecx
	movl %ecx, 64(%esp)
	movl 64(%esp), %eax
	addl $68, %esp
	popl %ebp
	ret
