	.align 4
	.text
.globl program
program:
	movl 4(%esp), %edx
	movl %edx, %eax
	pushl %eax
	movl %edx, %eax
	orl 0(%esp), %eax
	addl $4, %esp
	ret
