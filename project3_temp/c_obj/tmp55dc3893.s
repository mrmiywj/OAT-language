	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-12, %esp
	jmp __16
.globl __16
__16:
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __15
.globl __15
__15:
	movl 4(%esp), %ecx
	movl %ecx, 8(%esp)
	movl 8(%esp), %eax
	addl $12, %esp
	popl %ebp
	ret
