	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-60, %esp
	jmp __155
.globl __155
__155:
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __154
.globl __154
__154:
	movl 4(%esp), %ecx
	movl %ecx, 8(%esp)
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 12(%esp)
	movl 8(%esp), %ebx
	movl 12(%esp), %ecx
	movl $0, 16(%esp)
	cmpl %ecx, %ebx
	setLE 16(%esp)
	cmpl $0, 16(%esp)
	jE __153
	jNE __152
.globl __152
__152:
	jmp __151
.globl __151
__151:
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
	jmp __150
.globl __150
__150:
	movl 4(%esp), %ecx
	movl %ecx, 32(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 36(%esp)
	movl 32(%esp), %ebx
	movl 36(%esp), %ecx
	movl $0, 40(%esp)
	cmpl %ecx, %ebx
	setG 40(%esp)
	cmpl $0, 40(%esp)
	jE __149
	jNE __148
.globl __148
__148:
	movl 4(%esp), %ecx
	movl %ecx, 44(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 48(%esp)
	movl 48(%esp), %ecx
	movl 44(%esp), %eax
	addl %ecx, %eax
	movl %eax, 52(%esp)
	movl 52(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __147
.globl __149
__149:
	jmp __147
.globl __153
__153:
	jmp __147
.globl __147
__147:
	movl 4(%esp), %ecx
	movl %ecx, 56(%esp)
	movl 56(%esp), %eax
	addl $60, %esp
	popl %ebp
	ret
