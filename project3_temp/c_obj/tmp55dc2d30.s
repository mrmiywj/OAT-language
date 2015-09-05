	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-28, %esp
	jmp __18
.globl __18
__18:
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 8(%esp)
	movl 8(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __17
.globl __17
__17:
	movl 4(%esp), %ecx
	movl %ecx, 16(%esp)
	movl 12(%esp), %ecx
	movl %ecx, 20(%esp)
	movl 20(%esp), %ecx
	movl 16(%esp), %eax
	addl %ecx, %eax
	movl %eax, 24(%esp)
	movl 24(%esp), %eax
	addl $28, %esp
	popl %ebp
	ret
