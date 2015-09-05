	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-56, %esp
	jmp __241
.globl __241
__241:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __237
.globl __237
__237:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 8(%esp)
	movl 8(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __238
.globl __238
__238:
	movl 12(%esp), %ecx
	movl %ecx, 16(%esp)
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 20(%esp)
	movl 16(%esp), %ebx
	movl 20(%esp), %ecx
	movl $0, 24(%esp)
	cmpl %ecx, %ebx
	setL 24(%esp)
	cmpl $0, 24(%esp)
	jE __236
	jNE __240
.globl __240
__240:
	movl 4(%esp), %ecx
	movl %ecx, 28(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 32(%esp)
	movl 32(%esp), %ecx
	movl 28(%esp), %eax
	addl %ecx, %eax
	movl %eax, 36(%esp)
	movl 36(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __239
.globl __239
__239:
	movl 12(%esp), %ecx
	movl %ecx, 40(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 44(%esp)
	movl 44(%esp), %ecx
	movl 40(%esp), %eax
	addl %ecx, %eax
	movl %eax, 48(%esp)
	movl 48(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __238
.globl __236
__236:
	movl 4(%esp), %ecx
	movl %ecx, 52(%esp)
	movl 52(%esp), %eax
	addl $56, %esp
	popl %ebp
	ret
