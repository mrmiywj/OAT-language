	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-192, %esp
	jmp __460
.globl __460
__460:
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
	jmp __456
.globl __456
__456:
	movl 12(%esp), %ecx
	movl %ecx, 16(%esp)
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 20(%esp)
	movl 16(%esp), %ebx
	movl 20(%esp), %ecx
	movl $0, 24(%esp)
	cmpl %ecx, %ebx
	setL 24(%esp)
	cmpl $0, 24(%esp)
	jE __450
	jNE __459
.globl __459
__459:
	jmp __458
.globl __458
__458:
	movl 12(%esp), %ecx
	movl %ecx, 28(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 32(%esp)
	movl 32(%esp), %ecx
	movl 28(%esp), %eax
	addl %ecx, %eax
	movl %eax, 36(%esp)
	movl 36(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __457
.globl __457
__457:
	movl 12(%esp), %ecx
	movl %ecx, 40(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 44(%esp)
	movl 44(%esp), %ecx
	movl 40(%esp), %eax
	addl %ecx, %eax
	movl %eax, 48(%esp)
	movl 48(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __456
.globl __450
__450:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 52(%esp)
	movl 52(%esp), %ecx
	movl %ecx, 56(%esp)
	jmp __451
.globl __451
__451:
	movl 56(%esp), %ecx
	movl %ecx, 60(%esp)
	movl 12(%esp), %ecx
	movl %ecx, 64(%esp)
	movl 60(%esp), %ebx
	movl 64(%esp), %ecx
	movl $0, 68(%esp)
	cmpl %ecx, %ebx
	setL 68(%esp)
	cmpl $0, 68(%esp)
	jE __449
	jNE __455
.globl __455
__455:
	jmp __454
.globl __454
__454:
	movl 12(%esp), %ecx
	movl %ecx, 72(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 76(%esp)
	movl 76(%esp), %ecx
	movl 72(%esp), %eax
	addl %ecx, %eax
	movl %eax, 80(%esp)
	movl 80(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __453
.globl __453
__453:
	movl 4(%esp), %ecx
	movl %ecx, 84(%esp)
	movl $1000, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 88(%esp)
	movl 88(%esp), %ecx
	movl 84(%esp), %eax
	addl %ecx, %eax
	movl %eax, 92(%esp)
	movl 92(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __452
.globl __452
__452:
	movl 56(%esp), %ecx
	movl %ecx, 96(%esp)
	movl $50, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 100(%esp)
	movl 100(%esp), %ecx
	movl 96(%esp), %eax
	addl %ecx, %eax
	movl %eax, 104(%esp)
	movl 104(%esp), %ecx
	movl %ecx, 56(%esp)
	jmp __451
.globl __449
__449:
	movl 4(%esp), %ecx
	movl %ecx, 108(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 112(%esp)
	movl 108(%esp), %ebx
	movl 112(%esp), %ecx
	movl $0, 116(%esp)
	cmpl %ecx, %ebx
	setG 116(%esp)
	cmpl $0, 116(%esp)
	jE __448
	jNE __445
.globl __445
__445:
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 120(%esp)
	movl 120(%esp), %ecx
	movl %ecx, 124(%esp)
	jmp __444
.globl __444
__444:
	movl 124(%esp), %ecx
	movl %ecx, 128(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 132(%esp)
	movl 132(%esp), %ecx
	movl 128(%esp), %eax
	addl %ecx, %eax
	movl %eax, 136(%esp)
	movl 136(%esp), %ecx
	movl %ecx, 124(%esp)
	jmp __443
.globl __443
__443:
	movl 124(%esp), %ecx
	movl %ecx, 140(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 144(%esp)
	movl 144(%esp), %ecx
	movl 140(%esp), %eax
	addl %ecx, %eax
	movl %eax, 148(%esp)
	movl 148(%esp), %ecx
	movl %ecx, 124(%esp)
	jmp __442
.globl __448
__448:
	jmp __447
.globl __447
__447:
	movl 4(%esp), %ecx
	movl %ecx, 152(%esp)
	movl 12(%esp), %ecx
	movl %ecx, 156(%esp)
	movl 156(%esp), %ecx
	movl 152(%esp), %eax
	addl %ecx, %eax
	movl %eax, 160(%esp)
	movl 160(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __446
.globl __446
__446:
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 164(%esp)
	movl 164(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __442
.globl __442
__442:
	movl 12(%esp), %ecx
	movl %ecx, 168(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 172(%esp)
	movl 172(%esp), %ecx
	movl 168(%esp), %eax
	addl %ecx, %eax
	movl %eax, 176(%esp)
	movl 176(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __441
.globl __441
__441:
	movl 12(%esp), %ecx
	movl %ecx, 180(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 184(%esp)
	movl 184(%esp), %ecx
	movl 180(%esp), %eax
	addl %ecx, %eax
	movl %eax, 188(%esp)
	movl 188(%esp), %eax
	addl $192, %esp
	popl %ebp
	ret
