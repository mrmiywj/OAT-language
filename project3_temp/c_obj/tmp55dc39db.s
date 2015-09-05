	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-216, %esp
	jmp __480
.globl __480
__480:
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
	jmp __479
.globl __479
__479:
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
	movl %ecx, 12(%esp)
	jmp __478
.globl __478
__478:
	movl 4(%esp), %ecx
	movl %ecx, 28(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 32(%esp)
	movl 28(%esp), %ebx
	movl 32(%esp), %ecx
	movl $0, 36(%esp)
	cmpl %ecx, %ebx
	setG 36(%esp)
	cmpl $0, 36(%esp)
	jE __477
	jNE __474
.globl __474
__474:
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 40(%esp)
	movl 40(%esp), %ecx
	movl %ecx, 44(%esp)
	jmp __473
.globl __473
__473:
	movl 44(%esp), %ecx
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
	movl %ecx, 44(%esp)
	jmp __472
.globl __472
__472:
	movl 44(%esp), %ecx
	movl %ecx, 60(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 64(%esp)
	movl 64(%esp), %ecx
	movl 60(%esp), %eax
	addl %ecx, %eax
	movl %eax, 68(%esp)
	movl 68(%esp), %ecx
	movl %ecx, 44(%esp)
	jmp __468
.globl __477
__477:
	jmp __476
.globl __476
__476:
	movl 4(%esp), %ecx
	movl %ecx, 72(%esp)
	movl 12(%esp), %ecx
	movl %ecx, 76(%esp)
	movl 76(%esp), %ecx
	movl 72(%esp), %eax
	addl %ecx, %eax
	movl %eax, 80(%esp)
	movl 80(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __475
.globl __475
__475:
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 84(%esp)
	movl 84(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __468
.globl __468
__468:
	movl 12(%esp), %ecx
	movl %ecx, 88(%esp)
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 92(%esp)
	movl 88(%esp), %ebx
	movl 92(%esp), %ecx
	movl $0, 96(%esp)
	cmpl %ecx, %ebx
	setL 96(%esp)
	cmpl $0, 96(%esp)
	jE __462
	jNE __471
.globl __471
__471:
	jmp __470
.globl __470
__470:
	movl 12(%esp), %ecx
	movl %ecx, 100(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 104(%esp)
	movl 104(%esp), %ecx
	movl 100(%esp), %eax
	addl %ecx, %eax
	movl %eax, 108(%esp)
	movl 108(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __469
.globl __469
__469:
	movl 12(%esp), %ecx
	movl %ecx, 112(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 116(%esp)
	movl 116(%esp), %ecx
	movl 112(%esp), %eax
	addl %ecx, %eax
	movl %eax, 120(%esp)
	movl 120(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __468
.globl __462
__462:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 124(%esp)
	movl 124(%esp), %ecx
	movl %ecx, 128(%esp)
	jmp __463
.globl __463
__463:
	movl 128(%esp), %ecx
	movl %ecx, 132(%esp)
	movl 12(%esp), %ecx
	movl %ecx, 136(%esp)
	movl 132(%esp), %ebx
	movl 136(%esp), %ecx
	movl $0, 140(%esp)
	cmpl %ecx, %ebx
	setL 140(%esp)
	cmpl $0, 140(%esp)
	jE __461
	jNE __467
.globl __467
__467:
	jmp __466
.globl __466
__466:
	movl 12(%esp), %ecx
	movl %ecx, 144(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 148(%esp)
	movl 148(%esp), %ecx
	movl 144(%esp), %eax
	addl %ecx, %eax
	movl %eax, 152(%esp)
	movl 152(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __465
.globl __465
__465:
	movl 4(%esp), %ecx
	movl %ecx, 156(%esp)
	movl $1000, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 160(%esp)
	movl 160(%esp), %ecx
	movl 156(%esp), %eax
	addl %ecx, %eax
	movl %eax, 164(%esp)
	movl 164(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __464
.globl __464
__464:
	movl 128(%esp), %ecx
	movl %ecx, 168(%esp)
	movl $50, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 172(%esp)
	movl 172(%esp), %ecx
	movl 168(%esp), %eax
	addl %ecx, %eax
	movl %eax, 176(%esp)
	movl 176(%esp), %ecx
	movl %ecx, 128(%esp)
	jmp __463
.globl __461
__461:
	movl 12(%esp), %ecx
	movl %ecx, 180(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 184(%esp)
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 188(%esp)
	movl 188(%esp), %ecx
	movl 184(%esp), %eax
	imull %ecx, %eax
	movl %eax, 192(%esp)
	movl 192(%esp), %ecx
	movl 180(%esp), %eax
	addl %ecx, %eax
	movl %eax, 196(%esp)
	movl $2, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 200(%esp)
	movl 200(%esp), %ecx
	movl 196(%esp), %eax
	sarl %cl, %eax
	movl %eax, 204(%esp)
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 208(%esp)
	movl 208(%esp), %ecx
	movl 204(%esp), %eax
	shll %cl, %eax
	movl %eax, 212(%esp)
	movl 212(%esp), %eax
	addl $216, %esp
	popl %ebp
	ret
