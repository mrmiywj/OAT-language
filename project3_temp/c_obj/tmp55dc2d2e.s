	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-4, %esp
	jmp __14
.globl __14
__14:
	jmp __13
.globl __13
__13:
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %eax
	addl $4, %esp
	popl %ebp
	ret
