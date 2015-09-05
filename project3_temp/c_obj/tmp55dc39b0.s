	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-52, %esp
	jmp __96
.globl __96
__96:
	movl $0, %ecx
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
	jmp __95
.globl __95
__95:
	movl 4(%esp), %ecx
	movl %ecx, 16(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 20(%esp)
	movl 16(%esp), %ebx
	movl 20(%esp), %ecx
	movl $0, 24(%esp)
	cmpl %ecx, %ebx
	setE 24(%esp)
	cmpl $0, 24(%esp)
	jE __94
	jNE __91
.globl __91
__91:
	movl $2, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 28(%esp)
	movl 28(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __90
.globl __94
__94:
	movl 12(%esp), %ecx
	movl %ecx, 32(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 36(%esp)
	movl 32(%esp), %ebx
	movl 36(%esp), %ecx
	movl $0, 40(%esp)
	cmpl %ecx, %ebx
	setE 40(%esp)
	cmpl $0, 40(%esp)
	jE __93
	jNE __92
.globl __92
__92:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 44(%esp)
	movl 44(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __90
.globl __93
__93:
	jmp __90
.globl __90
__90:
	movl 4(%esp), %ecx
	movl %ecx, 48(%esp)
	movl 48(%esp), %eax
	addl $52, %esp
	popl %ebp
	ret
