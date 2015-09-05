	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-88, %esp
	jmp __300
.globl __300
__300:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	movl $5, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 8(%esp)
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 12(%esp)
	movl 12(%esp), %ecx
	movl 8(%esp), %eax
	sarl %cl, %eax
	movl %eax, 16(%esp)
	movl 16(%esp), %ecx
	movl %ecx, 20(%esp)
	jmp __299
.globl __299
__299:
	movl 4(%esp), %ecx
	movl %ecx, 24(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 28(%esp)
	movl 24(%esp), %ebx
	movl 28(%esp), %ecx
	movl $0, 32(%esp)
	cmpl %ecx, %ebx
	setE 32(%esp)
	cmpl $0, 32(%esp)
	jE __298
	jNE __294
.globl __294
__294:
	movl 4(%esp), %ecx
	movl %ecx, 36(%esp)
	movl $10, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 40(%esp)
	movl 36(%esp), %ebx
	movl 40(%esp), %ecx
	movl $0, 44(%esp)
	cmpl %ecx, %ebx
	setL 44(%esp)
	cmpl $0, 44(%esp)
	jE __293
	jNE __297
.globl __297
__297:
	movl 20(%esp), %ecx
	movl %ecx, 48(%esp)
	movl $5, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 52(%esp)
	movl 48(%esp), %ebx
	movl 52(%esp), %ecx
	movl $0, 56(%esp)
	cmpl %ecx, %ebx
	setE 56(%esp)
	cmpl $0, 56(%esp)
	jE __296
	jNE __295
.globl __295
__295:
	movl 4(%esp), %ecx
	movl %ecx, 60(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 64(%esp)
	movl 64(%esp), %ecx
	movl 60(%esp), %eax
	addl %ecx, %eax
	movl %eax, 68(%esp)
	movl 68(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __294
.globl __296
__296:
	movl 4(%esp), %ecx
	movl %ecx, 72(%esp)
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 76(%esp)
	movl 76(%esp), %ecx
	movl 72(%esp), %eax
	addl %ecx, %eax
	movl %eax, 80(%esp)
	movl 80(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __294
.globl __298
__298:
	jmp __293
.globl __293
__293:
	movl 4(%esp), %ecx
	movl %ecx, 84(%esp)
	movl 84(%esp), %eax
	addl $88, %esp
	popl %ebp
	ret
