	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-52, %esp
	jmp __68
.globl __68
__68:
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
	jmp __67
.globl __67
__67:
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
	setE 24(%esp)
	cmpl $0, 24(%esp)
	jE __66
	jNE __65
.globl __65
__65:
	movl 12(%esp), %ecx
	movl %ecx, 28(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 32(%esp)
	movl 28(%esp), %ebx
	movl 32(%esp), %ecx
	movl $0, 36(%esp)
	cmpl %ecx, %ebx
	setE 36(%esp)
	cmpl $0, 36(%esp)
	jE __64
	jNE __63
.globl __63
__63:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 40(%esp)
	movl 40(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __62
.globl __64
__64:
	movl $2, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 44(%esp)
	movl 44(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __62
.globl __66
__66:
	jmp __62
.globl __62
__62:
	movl 4(%esp), %ecx
	movl %ecx, 48(%esp)
	movl 48(%esp), %eax
	addl $52, %esp
	popl %ebp
	ret
