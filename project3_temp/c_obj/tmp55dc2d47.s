	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-76, %esp
	jmp __185
.globl __185
__185:
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __184
.globl __184
__184:
	movl 4(%esp), %ecx
	movl %ecx, 8(%esp)
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 12(%esp)
	movl 8(%esp), %ebx
	movl 12(%esp), %ecx
	movl $0, 16(%esp)
	cmpl %ecx, %ebx
	setL 16(%esp)
	cmpl $0, 16(%esp)
	jE __183
	jNE __178
.globl __178
__178:
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
	jmp __177
.globl __183
__183:
	jmp __182
.globl __182
__182:
	movl 4(%esp), %ecx
	movl %ecx, 32(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 36(%esp)
	movl 36(%esp), %ecx
	movl 32(%esp), %eax
	subl %ecx, %eax
	movl %eax, 40(%esp)
	movl 40(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __181
.globl __181
__181:
	movl 4(%esp), %ecx
	movl %ecx, 44(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 48(%esp)
	movl 44(%esp), %ebx
	movl 48(%esp), %ecx
	movl $0, 52(%esp)
	cmpl %ecx, %ebx
	setG 52(%esp)
	cmpl $0, 52(%esp)
	jE __180
	jNE __179
.globl __179
__179:
	movl 4(%esp), %ecx
	movl %ecx, 56(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 60(%esp)
	movl 60(%esp), %ecx
	movl 56(%esp), %eax
	addl %ecx, %eax
	movl %eax, 64(%esp)
	movl 64(%esp), %ecx
	movl %ecx, 68(%esp)
	jmp __177
.globl __180
__180:
	jmp __177
.globl __177
__177:
	movl 4(%esp), %ecx
	movl %ecx, 72(%esp)
	movl 72(%esp), %eax
	addl $76, %esp
	popl %ebp
	ret
