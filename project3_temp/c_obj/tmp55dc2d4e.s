	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-68, %esp
	jmp __235
.globl __235
__235:
	movl $19, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl $18, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 4(%esp)
	movl 4(%esp), %ecx
	movl 0(%esp), %eax
	subl %ecx, %eax
	movl %eax, 8(%esp)
	movl 8(%esp), %ecx
	movl %ecx, 12(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 16(%esp)
	movl 16(%esp), %ecx
	movl %ecx, 20(%esp)
	jmp __231
.globl __231
__231:
	movl 12(%esp), %ecx
	movl %ecx, 24(%esp)
	movl $19, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 28(%esp)
	movl 24(%esp), %ebx
	movl 28(%esp), %ecx
	movl $0, 32(%esp)
	cmpl %ecx, %ebx
	setLE 32(%esp)
	cmpl $0, 32(%esp)
	jE __230
	jNE __234
.globl __234
__234:
	movl 20(%esp), %ecx
	movl %ecx, 36(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 40(%esp)
	movl 36(%esp), %ebx
	movl 40(%esp), %ecx
	movl $0, 44(%esp)
	cmpl %ecx, %ebx
	setLE 44(%esp)
	cmpl $0, 44(%esp)
	jE __233
	jNE __232
.globl __232
__232:
	movl 12(%esp), %ecx
	movl %ecx, 48(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 52(%esp)
	movl 52(%esp), %ecx
	movl 48(%esp), %eax
	addl %ecx, %eax
	movl %eax, 56(%esp)
	movl 56(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __231
.globl __233
__233:
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 60(%esp)
	movl 60(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __231
.globl __230
__230:
	movl 12(%esp), %ecx
	movl %ecx, 64(%esp)
	movl 64(%esp), %eax
	addl $68, %esp
	popl %ebp
	ret
