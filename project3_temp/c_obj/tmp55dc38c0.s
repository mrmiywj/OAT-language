	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-140, %esp
	jmp __352
.globl __352
__352:
	movl $10, %ecx
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
	jmp __342
.globl __342
__342:
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
	jE __341
	jNE __351
.globl __351
__351:
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
	jE __347
	jNE __343
.globl __343
__343:
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
	jE __342
	jNE __346
.globl __346
__346:
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
	jE __345
	jNE __344
.globl __344
__344:
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
	jmp __343
.globl __345
__345:
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
	jmp __343
.globl __347
__347:
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
	jE __342
	jNE __350
.globl __350
__350:
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
	jE __349
	jNE __348
.globl __348
__348:
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
	jmp __347
.globl __349
__349:
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
	jmp __347
.globl __341
__341:
	movl 4(%esp), %ecx
	movl %ecx, 136(%esp)
	movl 136(%esp), %eax
	addl $140, %esp
	popl %ebp
	ret
