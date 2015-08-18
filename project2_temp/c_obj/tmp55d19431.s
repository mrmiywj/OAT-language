	.align 4
	.text
.globl _program
_program:
	movl 4(%esp), %edx
	movl %edx, %eax
	pushl %eax
	movl %edx, %eax
	addl 0(%esp), %eax
	addl $4, %esp
	pushl %eax
	movl %edx, %eax
	addl 0(%esp), %eax
	addl $4, %esp
	ret
