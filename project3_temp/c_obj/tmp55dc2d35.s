	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-52, %esp
	jmp __42
.globl __42
__42:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 8(%esp)
	movl 8(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __41
.globl __41
__41:
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 16(%esp)
	movl 16(%esp), %ecx
	movl %ecx, 20(%esp)
	jmp __40
.globl __40
__40:
	movl 12(%esp), %ecx
	movl %ecx, 24(%esp)
	movl 20(%esp), %ecx
	movl %ecx, 28(%esp)
	movl 28(%esp), %ecx
	movl 24(%esp), %eax
	addl %ecx, %eax
	movl %eax, 32(%esp)
	movl 32(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __39
.globl __39
__39:
	movl 12(%esp), %ecx
	movl %ecx, 36(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 40(%esp)
	movl 40(%esp), %ecx
	movl 36(%esp), %eax
	addl %ecx, %eax
	movl %eax, 44(%esp)
	movl 44(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __38
.globl __38
__38:
	movl 12(%esp), %ecx
	movl %ecx, 48(%esp)
	movl 48(%esp), %eax
	addl $52, %esp
	popl %ebp
	ret
