	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-60, %esp
	jmp __223
.globl __223
__223:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 8(%esp)
	movl 8(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __218
.globl __218
__218:
	movl 4(%esp), %ecx
	movl %ecx, 16(%esp)
	movl $1024, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 20(%esp)
	movl 12(%esp), %ecx
	movl %ecx, 24(%esp)
	movl 24(%esp), %ecx
	movl 20(%esp), %eax
	imull %ecx, %eax
	movl %eax, 28(%esp)
	movl 16(%esp), %ebx
	movl 28(%esp), %ecx
	movl $0, 32(%esp)
	cmpl %ecx, %ebx
	setGE 32(%esp)
	cmpl $0, 32(%esp)
	jE __217
	jNE __222
.globl __222
__222:
	jmp __221
.globl __221
__221:
	movl 12(%esp), %ecx
	movl %ecx, 36(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 40(%esp)
	movl 36(%esp), %ebx
	movl 40(%esp), %ecx
	movl $0, 44(%esp)
	cmpl %ecx, %ebx
	setE 44(%esp)
	cmpl $0, 44(%esp)
	jE __220
	jNE __219
.globl __219
__219:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 48(%esp)
	movl $-1, %ecx
	movl 48(%esp), %eax
	imull %ecx, %eax
	movl %eax, 52(%esp)
	movl 52(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __218
.globl __220
__220:
	jmp __218
.globl __217
__217:
	movl 4(%esp), %ecx
	movl %ecx, 56(%esp)
	movl 56(%esp), %eax
	addl $60, %esp
	popl %ebp
	ret
