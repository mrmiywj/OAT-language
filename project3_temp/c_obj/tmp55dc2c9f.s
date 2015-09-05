	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-104, %esp
	jmp __340
.globl __340
__340:
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
	jmp __331
.globl __331
__331:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 16(%esp)
	movl 16(%esp), %ecx
	movl %ecx, 20(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 24(%esp)
	movl 24(%esp), %ecx
	movl %ecx, 28(%esp)
	jmp __332
.globl __332
__332:
	movl 4(%esp), %ecx
	movl %ecx, 32(%esp)
	movl 12(%esp), %ecx
	movl %ecx, 36(%esp)
	movl 32(%esp), %ebx
	movl 36(%esp), %ecx
	movl $0, 40(%esp)
	cmpl %ecx, %ebx
	setE 40(%esp)
	cmpl $0, 40(%esp)
	jE __330
	jNE __339
.globl __339
__339:
	movl 4(%esp), %ecx
	movl %ecx, 44(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 48(%esp)
	movl 44(%esp), %ebx
	movl 48(%esp), %ecx
	movl $0, 52(%esp)
	cmpl %ecx, %ebx
	setE 52(%esp)
	cmpl $0, 52(%esp)
	jE __338
	jNE __333
.globl __333
__333:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 56(%esp)
	movl 56(%esp), %ecx
	movl %ecx, 60(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 64(%esp)
	movl 64(%esp), %ecx
	movl %ecx, 68(%esp)
	jmp __334
.globl __334
__334:
	movl 12(%esp), %ecx
	movl %ecx, 72(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 76(%esp)
	movl 72(%esp), %ebx
	movl 76(%esp), %ecx
	movl $0, 80(%esp)
	cmpl %ecx, %ebx
	setLE 80(%esp)
	cmpl $0, 80(%esp)
	jE __332
	jNE __337
.globl __337
__337:
	movl 12(%esp), %ecx
	movl %ecx, 84(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 88(%esp)
	movl 84(%esp), %ebx
	movl 88(%esp), %ecx
	movl $0, 92(%esp)
	cmpl %ecx, %ebx
	setE 92(%esp)
	cmpl $0, 92(%esp)
	jE __336
	jNE __335
.globl __335
__335:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 96(%esp)
	movl 96(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __334
.globl __336
__336:
	jmp __334
.globl __338
__338:
	jmp __332
.globl __330
__330:
	movl 12(%esp), %ecx
	movl %ecx, 100(%esp)
	movl 100(%esp), %eax
	addl $104, %esp
	popl %ebp
	ret
