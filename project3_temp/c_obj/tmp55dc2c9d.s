	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-132, %esp
	jmp __320
.globl __320
__320:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 4(%esp)
	movl 4(%esp), %ecx
	movl 0(%esp), %eax
	addl %ecx, %eax
	movl %eax, 8(%esp)
	movl 8(%esp), %ecx
	movl %ecx, 12(%esp)
	movl 12(%esp), %ecx
	movl %ecx, 16(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 20(%esp)
	movl 20(%esp), %ecx
	movl 16(%esp), %eax
	addl %ecx, %eax
	movl %eax, 24(%esp)
	movl 24(%esp), %ecx
	movl %ecx, 28(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 32(%esp)
	movl 32(%esp), %ecx
	movl %ecx, 36(%esp)
	jmp __319
.globl __319
__319:
	movl 12(%esp), %ecx
	movl %ecx, 40(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 44(%esp)
	movl 40(%esp), %ebx
	movl 44(%esp), %ecx
	movl $0, 48(%esp)
	cmpl %ecx, %ebx
	setG 48(%esp)
	cmpl $0, 48(%esp)
	jE __318
	jNE __312
.globl __312
__312:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 52(%esp)
	movl 52(%esp), %ecx
	movl %ecx, 56(%esp)
	jmp __313
.globl __313
__313:
	movl 56(%esp), %ecx
	movl %ecx, 60(%esp)
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 64(%esp)
	movl 60(%esp), %ebx
	movl 64(%esp), %ecx
	movl $0, 68(%esp)
	cmpl %ecx, %ebx
	setL 68(%esp)
	cmpl $0, 68(%esp)
	jE __311
	jNE __317
.globl __317
__317:
	movl 28(%esp), %ecx
	movl %ecx, 72(%esp)
	movl 12(%esp), %ecx
	movl %ecx, 76(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 80(%esp)
	movl 80(%esp), %ecx
	movl 76(%esp), %eax
	subl %ecx, %eax
	movl %eax, 84(%esp)
	movl 72(%esp), %ebx
	movl 84(%esp), %ecx
	movl $0, 88(%esp)
	cmpl %ecx, %ebx
	setE 88(%esp)
	cmpl $0, 88(%esp)
	jE __316
	jNE __315
.globl __315
__315:
	movl 36(%esp), %ecx
	movl %ecx, 92(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 96(%esp)
	movl 96(%esp), %ecx
	movl 92(%esp), %eax
	subl %ecx, %eax
	movl %eax, 100(%esp)
	movl 100(%esp), %ecx
	movl %ecx, 36(%esp)
	jmp __314
.globl __316
__316:
	movl 36(%esp), %ecx
	movl %ecx, 104(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 108(%esp)
	movl 108(%esp), %ecx
	movl 104(%esp), %eax
	addl %ecx, %eax
	movl %eax, 112(%esp)
	movl 112(%esp), %ecx
	movl %ecx, 36(%esp)
	jmp __314
.globl __314
__314:
	movl 56(%esp), %ecx
	movl %ecx, 116(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 120(%esp)
	movl 120(%esp), %ecx
	movl 116(%esp), %eax
	addl %ecx, %eax
	movl %eax, 124(%esp)
	movl 124(%esp), %ecx
	movl %ecx, 56(%esp)
	jmp __313
.globl __318
__318:
	jmp __311
.globl __311
__311:
	movl 36(%esp), %ecx
	movl %ecx, 128(%esp)
	movl 128(%esp), %eax
	addl $132, %esp
	popl %ebp
	ret
