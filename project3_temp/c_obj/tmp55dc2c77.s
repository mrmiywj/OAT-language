	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-36, %esp
	jmp __34
.globl __34
__34:
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __33
.globl __33
__33:
	movl 4(%esp), %ecx
	movl %ecx, 8(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 12(%esp)
	movl 8(%esp), %ebx
	movl 12(%esp), %ecx
	movl $0, 16(%esp)
	cmpl %ecx, %ebx
	setE 16(%esp)
	cmpl $0, 16(%esp)
	jE __32
	jNE __31
.globl __31
__31:
	jmp __30
.globl __30
__30:
	movl 4(%esp), %ecx
	movl %ecx, 20(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 24(%esp)
	movl 24(%esp), %ecx
	movl 20(%esp), %eax
	addl %ecx, %eax
	movl %eax, 28(%esp)
	movl 28(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __29
.globl __32
__32:
	jmp __29
.globl __29
__29:
	movl 4(%esp), %ecx
	movl %ecx, 32(%esp)
	movl 32(%esp), %eax
	addl $36, %esp
	popl %ebp
	ret
