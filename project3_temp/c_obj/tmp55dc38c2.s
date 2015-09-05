	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-140, %esp
	jmp __379
.globl __379
__379:
	movl $31, %ecx
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
	jmp __366
.globl __366
__366:
	jmp __367
.globl __367
__367:
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
	jE __365
	jNE __378
.globl __378
__378:
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
	jE __373
	jNE __368
.globl __368
__368:
	jmp __369
.globl __369
__369:
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
	jE __367
	jNE __372
.globl __372
__372:
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
	jE __371
	jNE __370
.globl __370
__370:
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
	jmp __369
.globl __371
__371:
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
	jmp __369
.globl __373
__373:
	jmp __374
.globl __374
__374:
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
	jE __367
	jNE __377
.globl __377
__377:
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
	jE __376
	jNE __375
.globl __375
__375:
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
	jmp __374
.globl __376
__376:
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
	jmp __374
.globl __365
__365:
	movl 4(%esp), %ecx
	movl %ecx, 136(%esp)
	movl 136(%esp), %eax
	addl $140, %esp
	popl %ebp
	ret
