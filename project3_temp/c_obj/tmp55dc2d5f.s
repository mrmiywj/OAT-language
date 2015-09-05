	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-140, %esp
	jmp __394
.globl __394
__394:
	movl $1, %ecx
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
	jmp __381
.globl __381
__381:
	jmp __382
.globl __382
__382:
	movl 4(%esp), %ecx
	movl %ecx, 16(%esp)
	movl $40, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 20(%esp)
	movl 16(%esp), %ebx
	movl 20(%esp), %ecx
	movl $0, 24(%esp)
	cmpl %ecx, %ebx
	setLE 24(%esp)
	cmpl $0, 24(%esp)
	jE __380
	jNE __393
.globl __393
__393:
	movl 4(%esp), %ecx
	movl %ecx, 28(%esp)
	movl $20, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 32(%esp)
	movl 28(%esp), %ebx
	movl 32(%esp), %ecx
	movl $0, 36(%esp)
	cmpl %ecx, %ebx
	setLE 36(%esp)
	cmpl $0, 36(%esp)
	jE __388
	jNE __383
.globl __383
__383:
	jmp __384
.globl __384
__384:
	movl 4(%esp), %ecx
	movl %ecx, 40(%esp)
	movl $20, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 44(%esp)
	movl 40(%esp), %ebx
	movl 44(%esp), %ecx
	movl $0, 48(%esp)
	cmpl %ecx, %ebx
	setLE 48(%esp)
	cmpl $0, 48(%esp)
	jE __382
	jNE __387
.globl __387
__387:
	movl 4(%esp), %ecx
	movl %ecx, 52(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 56(%esp)
	movl 52(%esp), %ebx
	movl 56(%esp), %ecx
	movl $0, 60(%esp)
	cmpl %ecx, %ebx
	setG 60(%esp)
	cmpl $0, 60(%esp)
	jE __386
	jNE __385
.globl __385
__385:
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
	jmp __384
.globl __386
__386:
	movl 4(%esp), %ecx
	movl %ecx, 76(%esp)
	movl $2, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 80(%esp)
	movl 80(%esp), %ecx
	movl 76(%esp), %eax
	addl %ecx, %eax
	movl %eax, 84(%esp)
	movl 84(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __384
.globl __388
__388:
	jmp __389
.globl __389
__389:
	movl 4(%esp), %ecx
	movl %ecx, 88(%esp)
	movl $40, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 92(%esp)
	movl 88(%esp), %ebx
	movl 92(%esp), %ecx
	movl $0, 96(%esp)
	cmpl %ecx, %ebx
	setLE 96(%esp)
	cmpl $0, 96(%esp)
	jE __382
	jNE __392
.globl __392
__392:
	movl 4(%esp), %ecx
	movl %ecx, 100(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 104(%esp)
	movl 100(%esp), %ebx
	movl 104(%esp), %ecx
	movl $0, 108(%esp)
	cmpl %ecx, %ebx
	setG 108(%esp)
	cmpl $0, 108(%esp)
	jE __391
	jNE __390
.globl __390
__390:
	movl 4(%esp), %ecx
	movl %ecx, 112(%esp)
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 116(%esp)
	movl 116(%esp), %ecx
	movl 112(%esp), %eax
	addl %ecx, %eax
	movl %eax, 120(%esp)
	movl 120(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __389
.globl __391
__391:
	movl 4(%esp), %ecx
	movl %ecx, 124(%esp)
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 128(%esp)
	movl 128(%esp), %ecx
	movl 124(%esp), %eax
	addl %ecx, %eax
	movl %eax, 132(%esp)
	movl 132(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __389
.globl __380
__380:
	movl 4(%esp), %ecx
	movl %ecx, 136(%esp)
	movl 136(%esp), %eax
	addl $140, %esp
	popl %ebp
	ret
