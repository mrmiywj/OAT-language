	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-192, %esp
	jmp __649
.globl __649
__649:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __648
.globl __648
__648:
	movl 4(%esp), %ecx
	movl %ecx, 8(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 12(%esp)
	movl 8(%esp), %ebx
	movl 12(%esp), %ecx
	movl $0, 16(%esp)
	cmpl %ecx, %ebx
	setE 16(%esp)
	cmpl $0, 16(%esp)
	jE __647
	jNE __646
.globl __646
__646:
	movl 4(%esp), %ecx
	movl %ecx, 20(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 24(%esp)
	movl 20(%esp), %ebx
	movl 24(%esp), %ecx
	movl $0, 28(%esp)
	cmpl %ecx, %ebx
	setE 28(%esp)
	cmpl $0, 28(%esp)
	jE __645
	jNE __644
.globl __644
__644:
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
	setE 40(%esp)
	cmpl $0, 40(%esp)
	jE __643
	jNE __642
.globl __642
__642:
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
	setE 52(%esp)
	cmpl $0, 52(%esp)
	jE __641
	jNE __640
.globl __640
__640:
	movl 4(%esp), %ecx
	movl %ecx, 56(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 60(%esp)
	movl 56(%esp), %ebx
	movl 60(%esp), %ecx
	movl $0, 64(%esp)
	cmpl %ecx, %ebx
	setE 64(%esp)
	cmpl $0, 64(%esp)
	jE __639
	jNE __638
.globl __638
__638:
	movl 4(%esp), %ecx
	movl %ecx, 68(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 72(%esp)
	movl 68(%esp), %ebx
	movl 72(%esp), %ecx
	movl $0, 76(%esp)
	cmpl %ecx, %ebx
	setE 76(%esp)
	cmpl $0, 76(%esp)
	jE __637
	jNE __636
.globl __636
__636:
	movl 4(%esp), %ecx
	movl %ecx, 80(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 84(%esp)
	movl 80(%esp), %ebx
	movl 84(%esp), %ecx
	movl $0, 88(%esp)
	cmpl %ecx, %ebx
	setE 88(%esp)
	cmpl $0, 88(%esp)
	jE __635
	jNE __634
.globl __634
__634:
	movl 4(%esp), %ecx
	movl %ecx, 92(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 96(%esp)
	movl 92(%esp), %ebx
	movl 96(%esp), %ecx
	movl $0, 100(%esp)
	cmpl %ecx, %ebx
	setE 100(%esp)
	cmpl $0, 100(%esp)
	jE __633
	jNE __632
.globl __632
__632:
	movl 4(%esp), %ecx
	movl %ecx, 104(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 108(%esp)
	movl 104(%esp), %ebx
	movl 108(%esp), %ecx
	movl $0, 112(%esp)
	cmpl %ecx, %ebx
	setE 112(%esp)
	cmpl $0, 112(%esp)
	jE __631
	jNE __630
.globl __630
__630:
	movl 4(%esp), %ecx
	movl %ecx, 116(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 120(%esp)
	movl 116(%esp), %ebx
	movl 120(%esp), %ecx
	movl $0, 124(%esp)
	cmpl %ecx, %ebx
	setE 124(%esp)
	cmpl $0, 124(%esp)
	jE __629
	jNE __628
.globl __628
__628:
	movl 4(%esp), %ecx
	movl %ecx, 128(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 132(%esp)
	movl 128(%esp), %ebx
	movl 132(%esp), %ecx
	movl $0, 136(%esp)
	cmpl %ecx, %ebx
	setE 136(%esp)
	cmpl $0, 136(%esp)
	jE __627
	jNE __626
.globl __626
__626:
	movl 4(%esp), %ecx
	movl %ecx, 140(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 144(%esp)
	movl 140(%esp), %ebx
	movl 144(%esp), %ecx
	movl $0, 148(%esp)
	cmpl %ecx, %ebx
	setE 148(%esp)
	cmpl $0, 148(%esp)
	jE __625
	jNE __624
.globl __624
__624:
	movl 4(%esp), %ecx
	movl %ecx, 152(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 156(%esp)
	movl 152(%esp), %ebx
	movl 156(%esp), %ecx
	movl $0, 160(%esp)
	cmpl %ecx, %ebx
	setE 160(%esp)
	cmpl $0, 160(%esp)
	jE __623
	jNE __622
.globl __622
__622:
	movl 4(%esp), %ecx
	movl %ecx, 164(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 168(%esp)
	movl 164(%esp), %ebx
	movl 168(%esp), %ecx
	movl $0, 172(%esp)
	cmpl %ecx, %ebx
	setE 172(%esp)
	cmpl $0, 172(%esp)
	jE __621
	jNE __620
.globl __620
__620:
	movl 4(%esp), %ecx
	movl %ecx, 176(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 180(%esp)
	movl 176(%esp), %ebx
	movl 180(%esp), %ecx
	movl $0, 184(%esp)
	cmpl %ecx, %ebx
	setE 184(%esp)
	cmpl $0, 184(%esp)
	jE __619
	jNE __618
.globl __618
__618:
	jmp __617
.globl __619
__619:
	jmp __617
.globl __621
__621:
	jmp __617
.globl __623
__623:
	jmp __617
.globl __625
__625:
	jmp __617
.globl __627
__627:
	jmp __617
.globl __629
__629:
	jmp __617
.globl __631
__631:
	jmp __617
.globl __633
__633:
	jmp __617
.globl __635
__635:
	jmp __617
.globl __637
__637:
	jmp __617
.globl __639
__639:
	jmp __617
.globl __641
__641:
	jmp __617
.globl __643
__643:
	jmp __617
.globl __645
__645:
	jmp __617
.globl __647
__647:
	jmp __617
.globl __617
__617:
	movl 4(%esp), %ecx
	movl %ecx, 188(%esp)
	movl 188(%esp), %eax
	addl $192, %esp
	popl %ebp
	ret
