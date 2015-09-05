	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-128, %esp
	jmp __497
.globl __497
__497:
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
	jmp __489
.globl __489
__489:
	jmp __490
.globl __490
__490:
	movl 12(%esp), %ecx
	movl %ecx, 16(%esp)
	movl $10, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 20(%esp)
	movl 16(%esp), %ebx
	movl 20(%esp), %ecx
	movl $0, 24(%esp)
	cmpl %ecx, %ebx
	setL 24(%esp)
	cmpl $0, 24(%esp)
	jE __488
	jNE __496
.globl __496
__496:
	jmp __495
.globl __495
__495:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 28(%esp)
	movl $-1, %ecx
	movl 28(%esp), %eax
	imull %ecx, %eax
	movl %eax, 32(%esp)
	movl 32(%esp), %ecx
	movl %ecx, 36(%esp)
	movl 12(%esp), %ecx
	movl %ecx, 40(%esp)
	movl 40(%esp), %ecx
	movl %ecx, 44(%esp)
	jmp __494
.globl __494
__494:
	movl $2, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 48(%esp)
	movl 48(%esp), %ecx
	movl %ecx, 52(%esp)
	movl 44(%esp), %ecx
	movl %ecx, 56(%esp)
	movl 56(%esp), %ecx
	movl %ecx, 60(%esp)
	jmp __493
.globl __493
__493:
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 64(%esp)
	movl 64(%esp), %ecx
	movl %ecx, 68(%esp)
	movl 60(%esp), %ecx
	movl %ecx, 72(%esp)
	movl 72(%esp), %ecx
	movl %ecx, 76(%esp)
	jmp __492
.globl __492
__492:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 80(%esp)
	movl 80(%esp), %ecx
	movl %ecx, 84(%esp)
	jmp __491
.globl __491
__491:
	movl 4(%esp), %ecx
	movl %ecx, 88(%esp)
	movl 84(%esp), %ecx
	movl %ecx, 92(%esp)
	movl 92(%esp), %ecx
	movl 88(%esp), %eax
	imull %ecx, %eax
	movl %eax, 96(%esp)
	movl 52(%esp), %ecx
	movl %ecx, 100(%esp)
	movl 100(%esp), %ecx
	movl 96(%esp), %eax
	imull %ecx, %eax
	movl %eax, 104(%esp)
	movl 68(%esp), %ecx
	movl %ecx, 108(%esp)
	movl 108(%esp), %ecx
	movl 104(%esp), %eax
	addl %ecx, %eax
	movl %eax, 112(%esp)
	movl 76(%esp), %ecx
	movl %ecx, 116(%esp)
	movl 116(%esp), %ecx
	movl 112(%esp), %eax
	shll %cl, %eax
	movl %eax, 120(%esp)
	movl 120(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __490
.globl __488
__488:
	movl 12(%esp), %ecx
	movl %ecx, 124(%esp)
	movl 124(%esp), %eax
	addl $128, %esp
	popl %ebp
	ret
