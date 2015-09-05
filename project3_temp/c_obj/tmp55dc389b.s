	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-52, %esp
	jmp __56
.globl __56
__56:
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
	jmp __55
.globl __55
__55:
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
	jE __54
	jNE __53
.globl __53
__53:
	movl 12(%esp), %ecx
	movl %ecx, 28(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 32(%esp)
	movl 28(%esp), %ebx
	movl 32(%esp), %ecx
	movl $0, 36(%esp)
	cmpl %ecx, %ebx
	setE 36(%esp)
	cmpl $0, 36(%esp)
	jE __52
	jNE __51
.globl __51
__51:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 40(%esp)
	movl 40(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __50
.globl __52
__52:
	movl $2, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 44(%esp)
	movl 44(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __50
.globl __54
__54:
	jmp __50
.globl __50
__50:
	movl 4(%esp), %ecx
	movl %ecx, 48(%esp)
	movl 48(%esp), %eax
	addl $52, %esp
	popl %ebp
	ret
