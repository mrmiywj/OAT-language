	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-48, %esp
	jmp __266
.globl __266
__266:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __262
.globl __262
__262:
	movl 4(%esp), %ecx
	movl %ecx, 8(%esp)
	movl $10, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 12(%esp)
	movl 8(%esp), %ebx
	movl 12(%esp), %ecx
	movl $0, 16(%esp)
	cmpl %ecx, %ebx
	setL 16(%esp)
	cmpl $0, 16(%esp)
	jE __261
	jNE __265
.globl __265
__265:
	movl 4(%esp), %ecx
	movl %ecx, 20(%esp)
	movl $2, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 24(%esp)
	movl 20(%esp), %ebx
	movl 24(%esp), %ecx
	movl $0, 28(%esp)
	cmpl %ecx, %ebx
	setL 28(%esp)
	cmpl $0, 28(%esp)
	jE __264
	jNE __263
.globl __263
__263:
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 32(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 36(%esp)
	movl 36(%esp), %ecx
	movl 32(%esp), %eax
	orl %ecx, %eax
	movl %eax, 40(%esp)
	movl 40(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __262
.globl __264
__264:
	jmp __262
.globl __261
__261:
	movl 4(%esp), %ecx
	movl %ecx, 44(%esp)
	movl 44(%esp), %eax
	addl $48, %esp
	popl %ebp
	ret
