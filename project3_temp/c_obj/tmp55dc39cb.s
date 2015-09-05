	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-132, %esp
	jmp __310
.globl __310
__310:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 4(%esp)
	movl 4(%esp), %ecx
	movl 0(%esp), %eax
	addl %ecx, %eax
	movl %eax, 8(%esp)
	movl 8(%esp), %ecx
	movl %ecx, 12(%esp)
	movl 12(%esp), %ecx
	movl %ecx, 16(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 20(%esp)
	movl 20(%esp), %ecx
	movl 16(%esp), %eax
	addl %ecx, %eax
	movl %eax, 24(%esp)
	movl 24(%esp), %ecx
	movl %ecx, 28(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 32(%esp)
	movl 32(%esp), %ecx
	movl %ecx, 36(%esp)
	jmp __309
.globl __309
__309:
	movl 12(%esp), %ecx
	movl %ecx, 40(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 44(%esp)
	movl 40(%esp), %ebx
	movl 44(%esp), %ecx
	movl $0, 48(%esp)
	cmpl %ecx, %ebx
	setG 48(%esp)
	cmpl $0, 48(%esp)
	jE __308
	jNE __302
.globl __302
__302:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 52(%esp)
	movl 52(%esp), %ecx
	movl %ecx, 56(%esp)
	jmp __303
.globl __303
__303:
	movl 56(%esp), %ecx
	movl %ecx, 60(%esp)
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 64(%esp)
	movl 60(%esp), %ebx
	movl 64(%esp), %ecx
	movl $0, 68(%esp)
	cmpl %ecx, %ebx
	setL 68(%esp)
	cmpl $0, 68(%esp)
	jE __301
	jNE __307
.globl __307
__307:
	movl 28(%esp), %ecx
	movl %ecx, 72(%esp)
	movl 12(%esp), %ecx
	movl %ecx, 76(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 80(%esp)
	movl 80(%esp), %ecx
	movl 76(%esp), %eax
	addl %ecx, %eax
	movl %eax, 84(%esp)
	movl 72(%esp), %ebx
	movl 84(%esp), %ecx
	movl $0, 88(%esp)
	cmpl %ecx, %ebx
	setE 88(%esp)
	cmpl $0, 88(%esp)
	jE __306
	jNE __305
.globl __305
__305:
	movl 36(%esp), %ecx
	movl %ecx, 92(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 96(%esp)
	movl 96(%esp), %ecx
	movl 92(%esp), %eax
	subl %ecx, %eax
	movl %eax, 100(%esp)
	movl 100(%esp), %ecx
	movl %ecx, 36(%esp)
	jmp __304
.globl __306
__306:
	movl 36(%esp), %ecx
	movl %ecx, 104(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 108(%esp)
	movl 108(%esp), %ecx
	movl 104(%esp), %eax
	addl %ecx, %eax
	movl %eax, 112(%esp)
	movl 112(%esp), %ecx
	movl %ecx, 36(%esp)
	jmp __304
.globl __304
__304:
	movl 56(%esp), %ecx
	movl %ecx, 116(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 120(%esp)
	movl 120(%esp), %ecx
	movl 116(%esp), %eax
	addl %ecx, %eax
	movl %eax, 124(%esp)
	movl 124(%esp), %ecx
	movl %ecx, 56(%esp)
	jmp __303
.globl __308
__308:
	jmp __301
.globl __301
__301:
	movl 36(%esp), %ecx
	movl %ecx, 128(%esp)
	movl 128(%esp), %eax
	addl $132, %esp
	popl %ebp
	ret
