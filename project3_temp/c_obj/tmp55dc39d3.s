	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-120, %esp
	jmp __400
.globl __400
__400:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 8(%esp)
	movl 8(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __399
.globl __399
__399:
	movl 4(%esp), %ecx
	movl %ecx, 16(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 20(%esp)
	movl 20(%esp), %ecx
	movl 16(%esp), %eax
	imull %ecx, %eax
	movl %eax, 24(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 28(%esp)
	movl 28(%esp), %ecx
	movl 24(%esp), %eax
	imull %ecx, %eax
	movl %eax, 32(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 36(%esp)
	movl 36(%esp), %ecx
	movl 32(%esp), %eax
	imull %ecx, %eax
	movl %eax, 40(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 44(%esp)
	movl 44(%esp), %ecx
	movl 40(%esp), %eax
	imull %ecx, %eax
	movl %eax, 48(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 52(%esp)
	movl 52(%esp), %ecx
	movl 48(%esp), %eax
	imull %ecx, %eax
	movl %eax, 56(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 60(%esp)
	movl 60(%esp), %ecx
	movl 56(%esp), %eax
	imull %ecx, %eax
	movl %eax, 64(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 68(%esp)
	movl 68(%esp), %ecx
	movl 64(%esp), %eax
	imull %ecx, %eax
	movl %eax, 72(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 76(%esp)
	movl 76(%esp), %ecx
	movl 72(%esp), %eax
	imull %ecx, %eax
	movl %eax, 80(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 84(%esp)
	movl 84(%esp), %ecx
	movl 80(%esp), %eax
	imull %ecx, %eax
	movl %eax, 88(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 92(%esp)
	movl 88(%esp), %ebx
	movl 92(%esp), %ecx
	movl $0, 96(%esp)
	cmpl %ecx, %ebx
	setNE 96(%esp)
	cmpl $0, 96(%esp)
	jE __398
	jNE __397
.globl __397
__397:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 100(%esp)
	movl 100(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __396
.globl __398
__398:
	jmp __396
.globl __396
__396:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 104(%esp)
	movl 104(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __395
.globl __395
__395:
	movl 4(%esp), %ecx
	movl %ecx, 108(%esp)
	movl 12(%esp), %ecx
	movl %ecx, 112(%esp)
	movl 112(%esp), %ecx
	movl 108(%esp), %eax
	addl %ecx, %eax
	movl %eax, 116(%esp)
	movl 116(%esp), %eax
	addl $120, %esp
	popl %ebp
	ret
