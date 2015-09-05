	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-116, %esp
	jmp __487
.globl __487
__487:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 8(%esp)
	movl 8(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __486
.globl __486
__486:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 16(%esp)
	movl $-1, %ecx
	movl 16(%esp), %eax
	imull %ecx, %eax
	movl %eax, 20(%esp)
	movl 20(%esp), %ecx
	movl %ecx, 24(%esp)
	movl 12(%esp), %ecx
	movl %ecx, 28(%esp)
	movl 28(%esp), %ecx
	movl %ecx, 32(%esp)
	jmp __485
.globl __485
__485:
	movl $2, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 36(%esp)
	movl 36(%esp), %ecx
	movl %ecx, 40(%esp)
	movl 32(%esp), %ecx
	movl %ecx, 44(%esp)
	movl 44(%esp), %ecx
	movl %ecx, 48(%esp)
	jmp __484
.globl __484
__484:
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 52(%esp)
	movl 52(%esp), %ecx
	movl %ecx, 56(%esp)
	movl 48(%esp), %ecx
	movl %ecx, 60(%esp)
	movl 60(%esp), %ecx
	movl %ecx, 64(%esp)
	jmp __483
.globl __483
__483:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 68(%esp)
	movl 68(%esp), %ecx
	movl %ecx, 72(%esp)
	jmp __482
.globl __482
__482:
	movl 4(%esp), %ecx
	movl %ecx, 76(%esp)
	movl 72(%esp), %ecx
	movl %ecx, 80(%esp)
	movl 80(%esp), %ecx
	movl 76(%esp), %eax
	addl %ecx, %eax
	movl %eax, 84(%esp)
	movl 40(%esp), %ecx
	movl %ecx, 88(%esp)
	movl 88(%esp), %ecx
	movl 84(%esp), %eax
	addl %ecx, %eax
	movl %eax, 92(%esp)
	movl 56(%esp), %ecx
	movl %ecx, 96(%esp)
	movl 96(%esp), %ecx
	movl 92(%esp), %eax
	addl %ecx, %eax
	movl %eax, 100(%esp)
	movl 64(%esp), %ecx
	movl %ecx, 104(%esp)
	movl 104(%esp), %ecx
	movl 100(%esp), %eax
	addl %ecx, %eax
	movl %eax, 108(%esp)
	movl 108(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __481
.globl __481
__481:
	movl 12(%esp), %ecx
	movl %ecx, 112(%esp)
	movl 112(%esp), %eax
	addl $116, %esp
	popl %ebp
	ret
