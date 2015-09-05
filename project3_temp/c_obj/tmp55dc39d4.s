	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-160, %esp
	jmp __406
.globl __406
__406:
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
	jmp __405
.globl __405
__405:
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
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 96(%esp)
	movl 96(%esp), %ecx
	movl 92(%esp), %eax
	imull %ecx, %eax
	movl %eax, 100(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 104(%esp)
	movl 104(%esp), %ecx
	movl 100(%esp), %eax
	imull %ecx, %eax
	movl %eax, 108(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 112(%esp)
	movl 112(%esp), %ecx
	movl 108(%esp), %eax
	imull %ecx, %eax
	movl %eax, 116(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 120(%esp)
	movl 120(%esp), %ecx
	movl 116(%esp), %eax
	imull %ecx, %eax
	movl %eax, 124(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 128(%esp)
	movl 128(%esp), %ecx
	movl 124(%esp), %eax
	imull %ecx, %eax
	movl %eax, 132(%esp)
	movl 88(%esp), %ebx
	movl 132(%esp), %ecx
	movl $0, 136(%esp)
	cmpl %ecx, %ebx
	setE 136(%esp)
	cmpl $0, 136(%esp)
	jE __404
	jNE __403
.globl __403
__403:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 140(%esp)
	movl 140(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __402
.globl __404
__404:
	jmp __402
.globl __402
__402:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 144(%esp)
	movl 144(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __401
.globl __401
__401:
	movl 4(%esp), %ecx
	movl %ecx, 148(%esp)
	movl 12(%esp), %ecx
	movl %ecx, 152(%esp)
	movl 152(%esp), %ecx
	movl 148(%esp), %eax
	addl %ecx, %eax
	movl %eax, 156(%esp)
	movl 156(%esp), %eax
	addl $160, %esp
	popl %ebp
	ret
