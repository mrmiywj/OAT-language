	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-76, %esp
	jmp __163
.globl __163
__163:
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __162
.globl __162
__162:
	movl 4(%esp), %ecx
	movl %ecx, 8(%esp)
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 12(%esp)
	movl 8(%esp), %ebx
	movl 12(%esp), %ecx
	movl $0, 16(%esp)
	cmpl %ecx, %ebx
	setL 16(%esp)
	cmpl $0, 16(%esp)
	jE __161
	jNE __160
.globl __160
__160:
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
	movl %ecx, 32(%esp)
	jmp __159
.globl __159
__159:
	movl 32(%esp), %ecx
	movl %ecx, 36(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 40(%esp)
	movl 36(%esp), %ebx
	movl 40(%esp), %ecx
	movl $0, 44(%esp)
	cmpl %ecx, %ebx
	setG 44(%esp)
	cmpl $0, 44(%esp)
	jE __158
	jNE __157
.globl __157
__157:
	movl 32(%esp), %ecx
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
	movl %ecx, 32(%esp)
	jmp __156
.globl __158
__158:
	movl 32(%esp), %ecx
	movl %ecx, 60(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 64(%esp)
	movl 64(%esp), %ecx
	movl 60(%esp), %eax
	subl %ecx, %eax
	movl %eax, 68(%esp)
	movl 68(%esp), %ecx
	movl %ecx, 32(%esp)
	jmp __156
.globl __161
__161:
	jmp __156
.globl __156
__156:
	movl 4(%esp), %ecx
	movl %ecx, 72(%esp)
	movl 72(%esp), %eax
	addl $76, %esp
	popl %ebp
	ret
