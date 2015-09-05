	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-56, %esp
	jmp __212
.globl __212
__212:
	movl $6, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 8(%esp)
	movl 8(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __208
.globl __208
__208:
	movl 4(%esp), %ecx
	movl %ecx, 16(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 20(%esp)
	movl 16(%esp), %ebx
	movl 20(%esp), %ecx
	movl $0, 24(%esp)
	cmpl %ecx, %ebx
	setG 24(%esp)
	cmpl $0, 24(%esp)
	jE __207
	jNE __211
.globl __211
__211:
	jmp __210
.globl __210
__210:
	movl 12(%esp), %ecx
	movl %ecx, 28(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 32(%esp)
	movl 32(%esp), %ecx
	movl 28(%esp), %eax
	imull %ecx, %eax
	movl %eax, 36(%esp)
	movl 36(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __209
.globl __209
__209:
	movl 4(%esp), %ecx
	movl %ecx, 40(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 44(%esp)
	movl 44(%esp), %ecx
	movl 40(%esp), %eax
	subl %ecx, %eax
	movl %eax, 48(%esp)
	movl 48(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __208
.globl __207
__207:
	movl 12(%esp), %ecx
	movl %ecx, 52(%esp)
	movl 52(%esp), %eax
	addl $56, %esp
	popl %ebp
	ret
