	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-20, %esp
	jmp __37
.globl __37
__37:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __36
.globl __36
__36:
	movl $2, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 8(%esp)
	movl 8(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __35
.globl __35
__35:
	movl 4(%esp), %ecx
	movl %ecx, 16(%esp)
	movl 16(%esp), %eax
	addl $20, %esp
	popl %ebp
	ret
