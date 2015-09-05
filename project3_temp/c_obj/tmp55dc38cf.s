	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-196, %esp
	jmp __512
.globl __512
__512:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 8(%esp)
	movl 8(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __511
.globl __511
__511:
	movl 4(%esp), %ecx
	movl %ecx, 16(%esp)
	movl 16(%esp), %ecx
	movl %ecx, 20(%esp)
	jmp __510
.globl __510
__510:
	movl $9, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 24(%esp)
	movl 24(%esp), %ecx
	movl %ecx, 28(%esp)
	jmp __509
.globl __509
__509:
	movl 12(%esp), %ecx
	movl %ecx, 32(%esp)
	movl 28(%esp), %ecx
	movl %ecx, 36(%esp)
	movl 36(%esp), %ecx
	movl 32(%esp), %eax
	addl %ecx, %eax
	movl %eax, 40(%esp)
	movl 40(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __508
.globl __508
__508:
	movl 12(%esp), %ecx
	movl %ecx, 44(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 48(%esp)
	movl 48(%esp), %ecx
	movl 44(%esp), %eax
	addl %ecx, %eax
	movl %eax, 52(%esp)
	movl 52(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __507
.globl __507
__507:
	movl 12(%esp), %ecx
	movl %ecx, 56(%esp)
	movl 56(%esp), %ecx
	movl %ecx, 60(%esp)
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 64(%esp)
	movl 64(%esp), %ecx
	movl %ecx, 68(%esp)
	jmp __506
.globl __506
__506:
	movl 12(%esp), %ecx
	movl %ecx, 72(%esp)
	movl 68(%esp), %ecx
	movl %ecx, 76(%esp)
	movl 76(%esp), %ecx
	movl 72(%esp), %eax
	addl %ecx, %eax
	movl %eax, 80(%esp)
	movl 80(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __505
.globl __505
__505:
	movl 60(%esp), %ecx
	movl %ecx, 84(%esp)
	movl 84(%esp), %ecx
	movl %ecx, 88(%esp)
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 92(%esp)
	movl 92(%esp), %ecx
	movl %ecx, 96(%esp)
	jmp __504
.globl __504
__504:
	movl 96(%esp), %ecx
	movl %ecx, 100(%esp)
	movl 60(%esp), %ecx
	movl %ecx, 104(%esp)
	movl 104(%esp), %ecx
	movl 100(%esp), %eax
	addl %ecx, %eax
	movl %eax, 108(%esp)
	movl 108(%esp), %ecx
	movl %ecx, 88(%esp)
	jmp __503
.globl __503
__503:
	movl 12(%esp), %ecx
	movl %ecx, 112(%esp)
	movl 60(%esp), %ecx
	movl %ecx, 116(%esp)
	movl 116(%esp), %ecx
	movl 112(%esp), %eax
	addl %ecx, %eax
	movl %eax, 120(%esp)
	movl 120(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __502
.globl __502
__502:
	movl 12(%esp), %ecx
	movl %ecx, 124(%esp)
	movl 20(%esp), %ecx
	movl %ecx, 128(%esp)
	movl 128(%esp), %ecx
	movl 124(%esp), %eax
	addl %ecx, %eax
	movl %eax, 132(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 136(%esp)
	movl 136(%esp), %ecx
	movl 132(%esp), %eax
	addl %ecx, %eax
	movl %eax, 140(%esp)
	movl 140(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __501
.globl __501
__501:
	movl 12(%esp), %ecx
	movl %ecx, 144(%esp)
	movl $94, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 148(%esp)
	movl 148(%esp), %ecx
	movl 144(%esp), %eax
	addl %ecx, %eax
	movl %eax, 152(%esp)
	movl 152(%esp), %ecx
	movl %ecx, 156(%esp)
	jmp __500
.globl __500
__500:
	movl 156(%esp), %ecx
	movl %ecx, 160(%esp)
	movl $94, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 164(%esp)
	movl 164(%esp), %ecx
	movl 160(%esp), %eax
	addl %ecx, %eax
	movl %eax, 168(%esp)
	movl 168(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __499
.globl __499
__499:
	movl 4(%esp), %ecx
	movl %ecx, 172(%esp)
	movl 12(%esp), %ecx
	movl %ecx, 176(%esp)
	movl 176(%esp), %ecx
	movl 172(%esp), %eax
	addl %ecx, %eax
	movl %eax, 180(%esp)
	movl 20(%esp), %ecx
	movl %ecx, 184(%esp)
	movl 184(%esp), %ecx
	movl 180(%esp), %eax
	addl %ecx, %eax
	movl %eax, 188(%esp)
	movl 188(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __498
.globl __498
__498:
	movl 12(%esp), %ecx
	movl %ecx, 192(%esp)
	movl 192(%esp), %eax
	addl $196, %esp
	popl %ebp
	ret
