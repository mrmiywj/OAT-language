	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-80, %esp
	jmp __292
.globl __292
__292:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	movl $5, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 8(%esp)
	movl 8(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __291
.globl __291
__291:
	movl 4(%esp), %ecx
	movl %ecx, 16(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 20(%esp)
	movl 16(%esp), %ebx
	movl 20(%esp), %ecx
	movl $0, 24(%esp)
	cmpl %ecx, %ebx
	setE 24(%esp)
	cmpl $0, 24(%esp)
	jE __290
	jNE __286
.globl __286
__286:
	movl 4(%esp), %ecx
	movl %ecx, 28(%esp)
	movl $10, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 32(%esp)
	movl 28(%esp), %ebx
	movl 32(%esp), %ecx
	movl $0, 36(%esp)
	cmpl %ecx, %ebx
	setL 36(%esp)
	cmpl $0, 36(%esp)
	jE __285
	jNE __289
.globl __289
__289:
	movl 12(%esp), %ecx
	movl %ecx, 40(%esp)
	movl $5, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 44(%esp)
	movl 40(%esp), %ebx
	movl 44(%esp), %ecx
	movl $0, 48(%esp)
	cmpl %ecx, %ebx
	setE 48(%esp)
	cmpl $0, 48(%esp)
	jE __288
	jNE __287
.globl __287
__287:
	movl 4(%esp), %ecx
	movl %ecx, 52(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 56(%esp)
	movl 56(%esp), %ecx
	movl 52(%esp), %eax
	addl %ecx, %eax
	movl %eax, 60(%esp)
	movl 60(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __286
.globl __288
__288:
	movl 4(%esp), %ecx
	movl %ecx, 64(%esp)
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 68(%esp)
	movl 68(%esp), %ecx
	movl 64(%esp), %eax
	addl %ecx, %eax
	movl %eax, 72(%esp)
	movl 72(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __286
.globl __290
__290:
	jmp __285
.globl __285
__285:
	movl 4(%esp), %ecx
	movl %ecx, 76(%esp)
	movl 76(%esp), %eax
	addl $80, %esp
	popl %ebp
	ret
