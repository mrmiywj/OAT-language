	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-64, %esp
	jmp __61
.globl __61
__61:
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 4(%esp)
	movl 4(%esp), %ecx
	movl 0(%esp), %eax
	addl %ecx, %eax
	movl %eax, 8(%esp)
	movl 8(%esp), %ecx
	movl %ecx, 12(%esp)
	movl $17, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 16(%esp)
	movl $5, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 20(%esp)
	movl 20(%esp), %ecx
	movl 16(%esp), %eax
	imull %ecx, %eax
	movl %eax, 24(%esp)
	movl 24(%esp), %ecx
	movl %ecx, 28(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 32(%esp)
	movl 32(%esp), %ecx
	movl %ecx, 36(%esp)
	jmp __60
.globl __60
__60:
	movl 12(%esp), %ecx
	movl %ecx, 40(%esp)
	movl 28(%esp), %ecx
	movl %ecx, 44(%esp)
	movl 40(%esp), %ebx
	movl 44(%esp), %ecx
	movl $0, 48(%esp)
	cmpl %ecx, %ebx
	setE 48(%esp)
	cmpl $0, 48(%esp)
	jE __59
	jNE __58
.globl __58
__58:
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 52(%esp)
	movl 52(%esp), %ecx
	movl %ecx, 36(%esp)
	jmp __57
.globl __59
__59:
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 56(%esp)
	movl 56(%esp), %ecx
	movl %ecx, 36(%esp)
	jmp __57
.globl __57
__57:
	movl 36(%esp), %ecx
	movl %ecx, 60(%esp)
	movl 60(%esp), %eax
	addl $64, %esp
	popl %ebp
	ret
