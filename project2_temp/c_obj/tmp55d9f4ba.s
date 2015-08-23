	.align 4
	.text
.globl program
program:
	movl 4(%esp), %edx
	movl $341, %eax
	pushl %eax
	movl %edx, %eax
	movl %eax, %ecx
	shrl %cl, 0(%esp)
	movl 0(%esp), %eax
	addl $4, %esp
	ret
