	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-36, %esp
	jmp __216
.globl __216
__216:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __214
.globl __214
__214:
	movl 4(%esp), %ecx
	movl %ecx, 8(%esp)
	movl $10, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 12(%esp)
	movl 8(%esp), %ebx
	movl 12(%esp), %ecx
	movl $0, 16(%esp)
	cmpl %ecx, %ebx
	setL 16(%esp)
	cmpl $0, 16(%esp)
	jE __213
	jNE __215
.globl __215
__215:
	movl 4(%esp), %ecx
	movl %ecx, 20(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 24(%esp)
	movl 24(%esp), %ecx
	movl 20(%esp), %eax
	addl %ecx, %eax
	movl %eax, 28(%esp)
	movl 28(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __214
.globl __213
__213:
	movl 4(%esp), %ecx
	movl %ecx, 32(%esp)
	movl 32(%esp), %eax
	addl $36, %esp
	popl %ebp
	ret
