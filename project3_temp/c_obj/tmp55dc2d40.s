	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-72, %esp
	jmp __119
.globl __119
__119:
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
	jmp __118
.globl __118
__118:
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
	jE __117
	jNE __114
.globl __114
__114:
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
	jE __113
	jNE __112
.globl __112
__112:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 40(%esp)
	movl 40(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __111
.globl __113
__113:
	movl $2, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 44(%esp)
	movl 44(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __111
.globl __117
__117:
	movl 12(%esp), %ecx
	movl %ecx, 48(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 52(%esp)
	movl 48(%esp), %ebx
	movl 52(%esp), %ecx
	movl $0, 56(%esp)
	cmpl %ecx, %ebx
	setE 56(%esp)
	cmpl $0, 56(%esp)
	jE __116
	jNE __115
.globl __115
__115:
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 60(%esp)
	movl 60(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __111
.globl __116
__116:
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 64(%esp)
	movl 64(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __111
.globl __111
__111:
	movl 4(%esp), %ecx
	movl %ecx, 68(%esp)
	movl 68(%esp), %eax
	addl $72, %esp
	popl %ebp
	ret
