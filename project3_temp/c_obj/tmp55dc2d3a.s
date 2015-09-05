	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-48, %esp
	jmp __75
.globl __75
__75:
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
	jmp __74
.globl __74
__74:
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
	jE __73
	jNE __72
.globl __72
__72:
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
	jE __71
	jNE __70
.globl __70
__70:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 40(%esp)
	movl 40(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __69
.globl __71
__71:
	jmp __69
.globl __73
__73:
	jmp __69
.globl __69
__69:
	movl 4(%esp), %ecx
	movl %ecx, 44(%esp)
	movl 44(%esp), %eax
	addl $48, %esp
	popl %ebp
	ret
