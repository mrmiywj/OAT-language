	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-84, %esp
	jmp __260
.globl __260
__260:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 8(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 12(%esp)
	movl 12(%esp), %ecx
	movl 8(%esp), %eax
	imull %ecx, %eax
	movl %eax, 16(%esp)
	movl $98, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 20(%esp)
	movl 20(%esp), %ecx
	movl 16(%esp), %eax
	addl %ecx, %eax
	movl %eax, 24(%esp)
	movl $40, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 28(%esp)
	movl 28(%esp), %ecx
	movl 24(%esp), %eax
	shll %cl, %eax
	movl %eax, 32(%esp)
	movl 32(%esp), %ecx
	movl %ecx, 36(%esp)
	jmp __255
.globl __255
__255:
	jmp __256
.globl __256
__256:
	movl 4(%esp), %ecx
	movl %ecx, 40(%esp)
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 44(%esp)
	movl 40(%esp), %ebx
	movl 44(%esp), %ecx
	movl $0, 48(%esp)
	cmpl %ecx, %ebx
	setL 48(%esp)
	cmpl $0, 48(%esp)
	jE __254
	jNE __259
.globl __259
__259:
	movl 36(%esp), %ecx
	movl %ecx, 52(%esp)
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 56(%esp)
	movl 52(%esp), %ebx
	movl 56(%esp), %ecx
	movl $0, 60(%esp)
	cmpl %ecx, %ebx
	setL 60(%esp)
	cmpl $0, 60(%esp)
	jE __258
	jNE __257
.globl __257
__257:
	movl 4(%esp), %ecx
	movl %ecx, 64(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 68(%esp)
	movl 68(%esp), %ecx
	movl 64(%esp), %eax
	addl %ecx, %eax
	movl %eax, 72(%esp)
	movl 72(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __256
.globl __258
__258:
	movl $1000, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 76(%esp)
	movl 76(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __256
.globl __254
__254:
	movl 4(%esp), %ecx
	movl %ecx, 80(%esp)
	movl 80(%esp), %eax
	addl $84, %esp
	popl %ebp
	ret
