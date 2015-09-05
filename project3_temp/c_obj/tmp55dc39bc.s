	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-100, %esp
	jmp __206
.globl __206
__206:
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __205
.globl __205
__205:
	movl 4(%esp), %ecx
	movl %ecx, 8(%esp)
	movl $2, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 12(%esp)
	movl 8(%esp), %ebx
	movl 12(%esp), %ecx
	movl $0, 16(%esp)
	cmpl %ecx, %ebx
	setL 16(%esp)
	cmpl $0, 16(%esp)
	jE __204
	jNE __200
.globl __200
__200:
	jmp __199
.globl __199
__199:
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
	jmp __198
.globl __198
__198:
	movl 4(%esp), %ecx
	movl %ecx, 32(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 36(%esp)
	movl 32(%esp), %ebx
	movl 36(%esp), %ecx
	movl $0, 40(%esp)
	cmpl %ecx, %ebx
	setG 40(%esp)
	cmpl $0, 40(%esp)
	jE __197
	jNE __196
.globl __196
__196:
	movl 4(%esp), %ecx
	movl %ecx, 44(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 48(%esp)
	movl 48(%esp), %ecx
	movl 44(%esp), %eax
	addl %ecx, %eax
	movl %eax, 52(%esp)
	movl 52(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __195
.globl __197
__197:
	jmp __195
.globl __204
__204:
	movl 4(%esp), %ecx
	movl %ecx, 56(%esp)
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 60(%esp)
	movl 60(%esp), %ecx
	movl 56(%esp), %eax
	addl %ecx, %eax
	movl %eax, 64(%esp)
	movl 64(%esp), %ecx
	movl %ecx, 68(%esp)
	jmp __203
.globl __203
__203:
	movl 68(%esp), %ecx
	movl %ecx, 72(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 76(%esp)
	movl 72(%esp), %ebx
	movl 76(%esp), %ecx
	movl $0, 80(%esp)
	cmpl %ecx, %ebx
	setG 80(%esp)
	cmpl $0, 80(%esp)
	jE __202
	jNE __201
.globl __201
__201:
	movl 68(%esp), %ecx
	movl %ecx, 84(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 88(%esp)
	movl 88(%esp), %ecx
	movl 84(%esp), %eax
	orl %ecx, %eax
	movl %eax, 92(%esp)
	movl 92(%esp), %ecx
	movl %ecx, 68(%esp)
	jmp __195
.globl __202
__202:
	jmp __195
.globl __195
__195:
	movl 4(%esp), %ecx
	movl %ecx, 96(%esp)
	movl 96(%esp), %eax
	addl $100, %esp
	popl %ebp
	ret
