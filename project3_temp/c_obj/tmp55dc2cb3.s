	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-224, %esp
	jmp __591
.globl __591
__591:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __568
.globl __568
__568:
	jmp __569
.globl __569
__569:
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
	jE __567
	jNE __590
.globl __590
__590:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 20(%esp)
	movl 20(%esp), %ecx
	movl %ecx, 24(%esp)
	jmp __589
.globl __589
__589:
	movl 4(%esp), %ecx
	movl %ecx, 28(%esp)
	movl $10, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 32(%esp)
	movl 32(%esp), %ecx
	movl 28(%esp), %eax
	addl %ecx, %eax
	movl %eax, 36(%esp)
	movl 36(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __570
.globl __570
__570:
	movl 24(%esp), %ecx
	movl %ecx, 40(%esp)
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 44(%esp)
	movl 40(%esp), %ebx
	movl 44(%esp), %ecx
	movl $0, 48(%esp)
	cmpl %ecx, %ebx
	setL 48(%esp)
	cmpl $0, 48(%esp)
	jE __569
	jNE __588
.globl __588
__588:
	movl 24(%esp), %ecx
	movl %ecx, 52(%esp)
	movl 52(%esp), %ecx
	movl %ecx, 56(%esp)
	jmp __572
.globl __572
__572:
	jmp __573
.globl __573
__573:
	movl 56(%esp), %ecx
	movl %ecx, 60(%esp)
	movl $900, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 64(%esp)
	movl $-1, %ecx
	movl 64(%esp), %eax
	imull %ecx, %eax
	movl %eax, 68(%esp)
	movl 60(%esp), %ebx
	movl 68(%esp), %ecx
	movl $0, 72(%esp)
	cmpl %ecx, %ebx
	setG 72(%esp)
	cmpl $0, 72(%esp)
	jE __571
	jNE __587
.globl __587
__587:
	jmp __586
.globl __586
__586:
	movl 56(%esp), %ecx
	movl %ecx, 76(%esp)
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 80(%esp)
	movl 80(%esp), %ecx
	movl 76(%esp), %eax
	subl %ecx, %eax
	movl %eax, 84(%esp)
	movl 84(%esp), %ecx
	movl %ecx, 56(%esp)
	jmp __585
.globl __585
__585:
	movl 56(%esp), %ecx
	movl %ecx, 88(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 92(%esp)
	movl 92(%esp), %ecx
	movl 88(%esp), %eax
	andl %ecx, %eax
	movl %eax, 96(%esp)
	cmpl $0, 96(%esp)
	jE __584
	jNE __577
.globl __577
__577:
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 100(%esp)
	movl 100(%esp), %ecx
	movl %ecx, 104(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 108(%esp)
	movl 108(%esp), %ecx
	movl %ecx, 112(%esp)
	jmp __574
.globl __574
__574:
	movl 112(%esp), %ecx
	movl %ecx, 116(%esp)
	movl 104(%esp), %ecx
	movl %ecx, 120(%esp)
	movl 116(%esp), %ebx
	movl 120(%esp), %ecx
	movl $0, 124(%esp)
	cmpl %ecx, %ebx
	setL 124(%esp)
	cmpl $0, 124(%esp)
	jE __573
	jNE __576
.globl __576
__576:
	jmp __575
.globl __575
__575:
	movl 112(%esp), %ecx
	movl %ecx, 128(%esp)
	movl $5, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 132(%esp)
	movl 132(%esp), %ecx
	movl 128(%esp), %eax
	addl %ecx, %eax
	movl %eax, 136(%esp)
	movl 136(%esp), %ecx
	movl %ecx, 112(%esp)
	jmp __574
.globl __584
__584:
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 140(%esp)
	movl 140(%esp), %ecx
	movl %ecx, 144(%esp)
	jmp __578
.globl __578
__578:
	jmp __579
.globl __579
__579:
	movl 144(%esp), %ecx
	movl %ecx, 148(%esp)
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 152(%esp)
	movl $-1, %ecx
	movl 152(%esp), %eax
	imull %ecx, %eax
	movl %eax, 156(%esp)
	movl 148(%esp), %ebx
	movl 156(%esp), %ecx
	movl $0, 160(%esp)
	cmpl %ecx, %ebx
	setG 160(%esp)
	cmpl $0, 160(%esp)
	jE __573
	jNE __583
.globl __583
__583:
	jmp __582
.globl __582
__582:
	movl 144(%esp), %ecx
	movl %ecx, 164(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 168(%esp)
	movl 168(%esp), %ecx
	movl 164(%esp), %eax
	subl %ecx, %eax
	movl %eax, 172(%esp)
	movl 172(%esp), %ecx
	movl %ecx, 144(%esp)
	jmp __581
.globl __581
__581:
	movl 144(%esp), %ecx
	movl %ecx, 176(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 180(%esp)
	movl 180(%esp), %ecx
	movl 176(%esp), %eax
	subl %ecx, %eax
	movl %eax, 184(%esp)
	movl 184(%esp), %ecx
	movl %ecx, 144(%esp)
	jmp __580
.globl __580
__580:
	movl 144(%esp), %ecx
	movl %ecx, 188(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 192(%esp)
	movl 192(%esp), %ecx
	movl 188(%esp), %eax
	subl %ecx, %eax
	movl %eax, 196(%esp)
	movl 196(%esp), %ecx
	movl %ecx, 144(%esp)
	jmp __579
.globl __571
__571:
	movl 24(%esp), %ecx
	movl %ecx, 200(%esp)
	movl $18, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 204(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 208(%esp)
	movl 208(%esp), %ecx
	movl 204(%esp), %eax
	imull %ecx, %eax
	movl %eax, 212(%esp)
	movl 212(%esp), %ecx
	movl 200(%esp), %eax
	addl %ecx, %eax
	movl %eax, 216(%esp)
	movl 216(%esp), %ecx
	movl %ecx, 24(%esp)
	jmp __570
.globl __567
__567:
	movl 4(%esp), %ecx
	movl %ecx, 220(%esp)
	movl 220(%esp), %eax
	addl $224, %esp
	popl %ebp
	ret
