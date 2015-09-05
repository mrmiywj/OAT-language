	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-68, %esp
	jmp __229
.globl __229
__229:
	movl $19, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl $18, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 4(%esp)
	movl 4(%esp), %ecx
	movl 0(%esp), %eax
	subl %ecx, %eax
	movl %eax, 8(%esp)
	movl 8(%esp), %ecx
	movl %ecx, 12(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 16(%esp)
	movl 16(%esp), %ecx
	movl %ecx, 20(%esp)
	jmp __225
.globl __225
__225:
	movl 12(%esp), %ecx
	movl %ecx, 24(%esp)
	movl $19, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 28(%esp)
	movl 24(%esp), %ebx
	movl 28(%esp), %ecx
	movl $0, 32(%esp)
	cmpl %ecx, %ebx
	setLE 32(%esp)
	cmpl $0, 32(%esp)
	jE __224
	jNE __228
.globl __228
__228:
	movl 20(%esp), %ecx
	movl %ecx, 36(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 40(%esp)
	movl 36(%esp), %ebx
	movl 40(%esp), %ecx
	movl $0, 44(%esp)
	cmpl %ecx, %ebx
	setLE 44(%esp)
	cmpl $0, 44(%esp)
	jE __227
	jNE __226
.globl __226
__226:
	movl 12(%esp), %ecx
	movl %ecx, 48(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 52(%esp)
	movl 52(%esp), %ecx
	movl 48(%esp), %eax
	addl %ecx, %eax
	movl %eax, 56(%esp)
	movl 56(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __225
.globl __227
__227:
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 60(%esp)
	movl 60(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __225
.globl __224
__224:
	movl 12(%esp), %ecx
	movl %ecx, 64(%esp)
	movl 64(%esp), %eax
	addl $68, %esp
	popl %ebp
	ret
