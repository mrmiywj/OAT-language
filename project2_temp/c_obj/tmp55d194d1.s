	.align 4
	.text
.globl program
program:
	movl 4(%esp), %edx
	movl $17, %eax
	negl %eax
	ret
