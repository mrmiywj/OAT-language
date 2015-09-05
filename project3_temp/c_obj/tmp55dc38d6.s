	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-772, %esp
	jmp __679
.globl __679
__679:
	movl $7, %ecx
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
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 16(%esp)
	movl 16(%esp), %ecx
	movl %ecx, 20(%esp)
	movl $0, %ecx
	movl $0, %eax
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
	movl $15, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 40(%esp)
	movl 40(%esp), %ecx
	movl %ecx, 44(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 48(%esp)
	movl 48(%esp), %ecx
	movl %ecx, 52(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 56(%esp)
	movl $-1, %ecx
	movl 56(%esp), %eax
	imull %ecx, %eax
	movl %eax, 60(%esp)
	movl 60(%esp), %ecx
	movl %ecx, 64(%esp)
	jmp __678
.globl __678
__678:
	movl 36(%esp), %ecx
	movl %ecx, 68(%esp)
	movl 44(%esp), %ecx
	movl %ecx, 72(%esp)
	movl $-1, %ecx
	movl 72(%esp), %eax
	xorl %ecx, %eax
	movl %eax, 76(%esp)
	movl 76(%esp), %ecx
	movl 68(%esp), %eax
	andl %ecx, %eax
	movl %eax, 80(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 84(%esp)
	movl 84(%esp), %ecx
	movl 80(%esp), %eax
	addl %ecx, %eax
	movl %eax, 88(%esp)
	movl 88(%esp), %ecx
	movl %ecx, 36(%esp)
	jmp __677
.globl __677
__677:
	movl 36(%esp), %ecx
	movl %ecx, 92(%esp)
	movl 44(%esp), %ecx
	movl %ecx, 96(%esp)
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 100(%esp)
	movl 100(%esp), %ecx
	movl 96(%esp), %eax
	shll %cl, %eax
	movl %eax, 104(%esp)
	movl $-1, %ecx
	movl 104(%esp), %eax
	xorl %ecx, %eax
	movl %eax, 108(%esp)
	movl 108(%esp), %ecx
	movl 92(%esp), %eax
	andl %ecx, %eax
	movl %eax, 112(%esp)
	movl $6, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 116(%esp)
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 120(%esp)
	movl 120(%esp), %ecx
	movl 116(%esp), %eax
	shll %cl, %eax
	movl %eax, 124(%esp)
	movl 124(%esp), %ecx
	movl 112(%esp), %eax
	addl %ecx, %eax
	movl %eax, 128(%esp)
	movl 128(%esp), %ecx
	movl %ecx, 36(%esp)
	jmp __676
.globl __676
__676:
	movl 36(%esp), %ecx
	movl %ecx, 132(%esp)
	movl 44(%esp), %ecx
	movl %ecx, 136(%esp)
	movl $8, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 140(%esp)
	movl 140(%esp), %ecx
	movl 136(%esp), %eax
	shll %cl, %eax
	movl %eax, 144(%esp)
	movl $-1, %ecx
	movl 144(%esp), %eax
	xorl %ecx, %eax
	movl %eax, 148(%esp)
	movl 148(%esp), %ecx
	movl 132(%esp), %eax
	andl %ecx, %eax
	movl %eax, 152(%esp)
	movl $9, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 156(%esp)
	movl $8, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 160(%esp)
	movl 160(%esp), %ecx
	movl 156(%esp), %eax
	shll %cl, %eax
	movl %eax, 164(%esp)
	movl 164(%esp), %ecx
	movl 152(%esp), %eax
	addl %ecx, %eax
	movl %eax, 168(%esp)
	movl 168(%esp), %ecx
	movl %ecx, 36(%esp)
	jmp __675
.globl __675
__675:
	movl 36(%esp), %ecx
	movl %ecx, 172(%esp)
	movl 44(%esp), %ecx
	movl %ecx, 176(%esp)
	movl $12, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 180(%esp)
	movl 180(%esp), %ecx
	movl 176(%esp), %eax
	shll %cl, %eax
	movl %eax, 184(%esp)
	movl $-1, %ecx
	movl 184(%esp), %eax
	xorl %ecx, %eax
	movl %eax, 188(%esp)
	movl 188(%esp), %ecx
	movl 172(%esp), %eax
	andl %ecx, %eax
	movl %eax, 192(%esp)
	movl $7, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 196(%esp)
	movl $12, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 200(%esp)
	movl 200(%esp), %ecx
	movl 196(%esp), %eax
	shll %cl, %eax
	movl %eax, 204(%esp)
	movl 204(%esp), %ecx
	movl 192(%esp), %eax
	addl %ecx, %eax
	movl %eax, 208(%esp)
	movl 208(%esp), %ecx
	movl %ecx, 36(%esp)
	jmp __674
.globl __674
__674:
	movl 36(%esp), %ecx
	movl %ecx, 212(%esp)
	movl 44(%esp), %ecx
	movl %ecx, 216(%esp)
	movl $16, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 220(%esp)
	movl 220(%esp), %ecx
	movl 216(%esp), %eax
	shll %cl, %eax
	movl %eax, 224(%esp)
	movl $-1, %ecx
	movl 224(%esp), %eax
	xorl %ecx, %eax
	movl %eax, 228(%esp)
	movl 228(%esp), %ecx
	movl 212(%esp), %eax
	andl %ecx, %eax
	movl %eax, 232(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 236(%esp)
	movl $16, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 240(%esp)
	movl 240(%esp), %ecx
	movl 236(%esp), %eax
	shll %cl, %eax
	movl %eax, 244(%esp)
	movl 244(%esp), %ecx
	movl 232(%esp), %eax
	addl %ecx, %eax
	movl %eax, 248(%esp)
	movl 248(%esp), %ecx
	movl %ecx, 36(%esp)
	jmp __673
.globl __673
__673:
	movl 36(%esp), %ecx
	movl %ecx, 252(%esp)
	movl 44(%esp), %ecx
	movl %ecx, 256(%esp)
	movl $20, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 260(%esp)
	movl 260(%esp), %ecx
	movl 256(%esp), %eax
	shll %cl, %eax
	movl %eax, 264(%esp)
	movl $-1, %ecx
	movl 264(%esp), %eax
	xorl %ecx, %eax
	movl %eax, 268(%esp)
	movl 268(%esp), %ecx
	movl 252(%esp), %eax
	andl %ecx, %eax
	movl %eax, 272(%esp)
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 276(%esp)
	movl $20, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 280(%esp)
	movl 280(%esp), %ecx
	movl 276(%esp), %eax
	shll %cl, %eax
	movl %eax, 284(%esp)
	movl 284(%esp), %ecx
	movl 272(%esp), %eax
	addl %ecx, %eax
	movl %eax, 288(%esp)
	movl 288(%esp), %ecx
	movl %ecx, 36(%esp)
	jmp __672
.globl __672
__672:
	movl 36(%esp), %ecx
	movl %ecx, 292(%esp)
	movl 44(%esp), %ecx
	movl %ecx, 296(%esp)
	movl $24, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 300(%esp)
	movl 300(%esp), %ecx
	movl 296(%esp), %eax
	shll %cl, %eax
	movl %eax, 304(%esp)
	movl $-1, %ecx
	movl 304(%esp), %eax
	xorl %ecx, %eax
	movl %eax, 308(%esp)
	movl 308(%esp), %ecx
	movl 292(%esp), %eax
	andl %ecx, %eax
	movl %eax, 312(%esp)
	movl $5, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 316(%esp)
	movl $24, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 320(%esp)
	movl 320(%esp), %ecx
	movl 316(%esp), %eax
	shll %cl, %eax
	movl %eax, 324(%esp)
	movl 324(%esp), %ecx
	movl 312(%esp), %eax
	addl %ecx, %eax
	movl %eax, 328(%esp)
	movl 328(%esp), %ecx
	movl %ecx, 36(%esp)
	jmp __660
.globl __660
__660:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 332(%esp)
	movl 332(%esp), %ecx
	movl %ecx, 336(%esp)
	jmp __661
.globl __661
__661:
	movl 336(%esp), %ecx
	movl %ecx, 340(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 344(%esp)
	movl 340(%esp), %ebx
	movl 344(%esp), %ecx
	movl $0, 348(%esp)
	cmpl %ecx, %ebx
	setL 348(%esp)
	cmpl $0, 348(%esp)
	jE __651
	jNE __663
.globl __663
__663:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 352(%esp)
	movl 352(%esp), %ecx
	movl %ecx, 356(%esp)
	jmp __664
.globl __664
__664:
	movl 356(%esp), %ecx
	movl %ecx, 360(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 364(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 368(%esp)
	movl 368(%esp), %ecx
	movl 364(%esp), %eax
	subl %ecx, %eax
	movl %eax, 372(%esp)
	movl 360(%esp), %ebx
	movl 372(%esp), %ecx
	movl $0, 376(%esp)
	cmpl %ecx, %ebx
	setL 376(%esp)
	cmpl $0, 376(%esp)
	jE __662
	jNE __671
.globl __671
__671:
	movl 36(%esp), %ecx
	movl %ecx, 380(%esp)
	movl 44(%esp), %ecx
	movl %ecx, 384(%esp)
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 388(%esp)
	movl 356(%esp), %ecx
	movl %ecx, 392(%esp)
	movl 392(%esp), %ecx
	movl 388(%esp), %eax
	imull %ecx, %eax
	movl %eax, 396(%esp)
	movl 396(%esp), %ecx
	movl 384(%esp), %eax
	shll %cl, %eax
	movl %eax, 400(%esp)
	movl 400(%esp), %ecx
	movl 380(%esp), %eax
	andl %ecx, %eax
	movl %eax, 404(%esp)
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 408(%esp)
	movl 356(%esp), %ecx
	movl %ecx, 412(%esp)
	movl 412(%esp), %ecx
	movl 408(%esp), %eax
	imull %ecx, %eax
	movl %eax, 416(%esp)
	movl 416(%esp), %ecx
	movl 404(%esp), %eax
	sarl %cl, %eax
	movl %eax, 420(%esp)
	movl 420(%esp), %ecx
	movl %ecx, 424(%esp)
	movl 36(%esp), %ecx
	movl %ecx, 428(%esp)
	movl 44(%esp), %ecx
	movl %ecx, 432(%esp)
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 436(%esp)
	movl 356(%esp), %ecx
	movl %ecx, 440(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 444(%esp)
	movl 444(%esp), %ecx
	movl 440(%esp), %eax
	addl %ecx, %eax
	movl %eax, 448(%esp)
	movl 448(%esp), %ecx
	movl 436(%esp), %eax
	imull %ecx, %eax
	movl %eax, 452(%esp)
	movl 452(%esp), %ecx
	movl 432(%esp), %eax
	shll %cl, %eax
	movl %eax, 456(%esp)
	movl 456(%esp), %ecx
	movl 428(%esp), %eax
	andl %ecx, %eax
	movl %eax, 460(%esp)
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 464(%esp)
	movl 356(%esp), %ecx
	movl %ecx, 468(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 472(%esp)
	movl 472(%esp), %ecx
	movl 468(%esp), %eax
	addl %ecx, %eax
	movl %eax, 476(%esp)
	movl 476(%esp), %ecx
	movl 464(%esp), %eax
	imull %ecx, %eax
	movl %eax, 480(%esp)
	movl 480(%esp), %ecx
	movl 460(%esp), %eax
	sarl %cl, %eax
	movl %eax, 484(%esp)
	movl 484(%esp), %ecx
	movl %ecx, 488(%esp)
	jmp __670
.globl __670
__670:
	movl 424(%esp), %ecx
	movl %ecx, 492(%esp)
	movl 488(%esp), %ecx
	movl %ecx, 496(%esp)
	movl 492(%esp), %ebx
	movl 496(%esp), %ecx
	movl $0, 500(%esp)
	cmpl %ecx, %ebx
	setG 500(%esp)
	cmpl $0, 500(%esp)
	jE __669
	jNE __668
.globl __668
__668:
	movl 488(%esp), %ecx
	movl %ecx, 504(%esp)
	movl 504(%esp), %ecx
	movl %ecx, 508(%esp)
	jmp __667
.globl __667
__667:
	movl 36(%esp), %ecx
	movl %ecx, 512(%esp)
	movl 44(%esp), %ecx
	movl %ecx, 516(%esp)
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 520(%esp)
	movl 356(%esp), %ecx
	movl %ecx, 524(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 528(%esp)
	movl 528(%esp), %ecx
	movl 524(%esp), %eax
	addl %ecx, %eax
	movl %eax, 532(%esp)
	movl 532(%esp), %ecx
	movl 520(%esp), %eax
	imull %ecx, %eax
	movl %eax, 536(%esp)
	movl 536(%esp), %ecx
	movl 516(%esp), %eax
	shll %cl, %eax
	movl %eax, 540(%esp)
	movl $-1, %ecx
	movl 540(%esp), %eax
	xorl %ecx, %eax
	movl %eax, 544(%esp)
	movl 544(%esp), %ecx
	movl 512(%esp), %eax
	andl %ecx, %eax
	movl %eax, 548(%esp)
	movl 424(%esp), %ecx
	movl %ecx, 552(%esp)
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 556(%esp)
	movl 356(%esp), %ecx
	movl %ecx, 560(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 564(%esp)
	movl 564(%esp), %ecx
	movl 560(%esp), %eax
	addl %ecx, %eax
	movl %eax, 568(%esp)
	movl 568(%esp), %ecx
	movl 556(%esp), %eax
	imull %ecx, %eax
	movl %eax, 572(%esp)
	movl 572(%esp), %ecx
	movl 552(%esp), %eax
	shll %cl, %eax
	movl %eax, 576(%esp)
	movl 576(%esp), %ecx
	movl 548(%esp), %eax
	addl %ecx, %eax
	movl %eax, 580(%esp)
	movl 580(%esp), %ecx
	movl %ecx, 36(%esp)
	jmp __666
.globl __666
__666:
	movl 36(%esp), %ecx
	movl %ecx, 584(%esp)
	movl 44(%esp), %ecx
	movl %ecx, 588(%esp)
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 592(%esp)
	movl 356(%esp), %ecx
	movl %ecx, 596(%esp)
	movl 596(%esp), %ecx
	movl 592(%esp), %eax
	imull %ecx, %eax
	movl %eax, 600(%esp)
	movl 600(%esp), %ecx
	movl 588(%esp), %eax
	shll %cl, %eax
	movl %eax, 604(%esp)
	movl $-1, %ecx
	movl 604(%esp), %eax
	xorl %ecx, %eax
	movl %eax, 608(%esp)
	movl 608(%esp), %ecx
	movl 584(%esp), %eax
	andl %ecx, %eax
	movl %eax, 612(%esp)
	movl 508(%esp), %ecx
	movl %ecx, 616(%esp)
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 620(%esp)
	movl 356(%esp), %ecx
	movl %ecx, 624(%esp)
	movl 624(%esp), %ecx
	movl 620(%esp), %eax
	imull %ecx, %eax
	movl %eax, 628(%esp)
	movl 628(%esp), %ecx
	movl 616(%esp), %eax
	shll %cl, %eax
	movl %eax, 632(%esp)
	movl 632(%esp), %ecx
	movl 612(%esp), %eax
	addl %ecx, %eax
	movl %eax, 636(%esp)
	movl 636(%esp), %ecx
	movl %ecx, 36(%esp)
	jmp __665
.globl __669
__669:
	jmp __665
.globl __665
__665:
	movl 356(%esp), %ecx
	movl %ecx, 640(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 644(%esp)
	movl 644(%esp), %ecx
	movl 640(%esp), %eax
	addl %ecx, %eax
	movl %eax, 648(%esp)
	movl 648(%esp), %ecx
	movl %ecx, 356(%esp)
	jmp __664
.globl __662
__662:
	movl 336(%esp), %ecx
	movl %ecx, 652(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 656(%esp)
	movl 656(%esp), %ecx
	movl 652(%esp), %eax
	addl %ecx, %eax
	movl %eax, 660(%esp)
	movl 660(%esp), %ecx
	movl %ecx, 336(%esp)
	jmp __661
.globl __651
__651:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 664(%esp)
	movl 664(%esp), %ecx
	movl %ecx, 668(%esp)
	jmp __652
.globl __652
__652:
	movl 668(%esp), %ecx
	movl %ecx, 672(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 676(%esp)
	movl 672(%esp), %ebx
	movl 676(%esp), %ecx
	movl $0, 680(%esp)
	cmpl %ecx, %ebx
	setL 680(%esp)
	cmpl $0, 680(%esp)
	jE __650
	jNE __659
.globl __659
__659:
	movl 36(%esp), %ecx
	movl %ecx, 684(%esp)
	movl 44(%esp), %ecx
	movl %ecx, 688(%esp)
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 692(%esp)
	movl 668(%esp), %ecx
	movl %ecx, 696(%esp)
	movl 696(%esp), %ecx
	movl 692(%esp), %eax
	imull %ecx, %eax
	movl %eax, 700(%esp)
	movl 700(%esp), %ecx
	movl 688(%esp), %eax
	shll %cl, %eax
	movl %eax, 704(%esp)
	movl 704(%esp), %ecx
	movl 684(%esp), %eax
	andl %ecx, %eax
	movl %eax, 708(%esp)
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 712(%esp)
	movl 668(%esp), %ecx
	movl %ecx, 716(%esp)
	movl 716(%esp), %ecx
	movl 712(%esp), %eax
	imull %ecx, %eax
	movl %eax, 720(%esp)
	movl 720(%esp), %ecx
	movl 708(%esp), %eax
	sarl %cl, %eax
	movl %eax, 724(%esp)
	movl 724(%esp), %ecx
	movl %ecx, 728(%esp)
	jmp __658
.globl __658
__658:
	movl 52(%esp), %ecx
	movl %ecx, 732(%esp)
	cmpl $0, 732(%esp)
	jE __657
	jNE __656
.globl __656
__656:
	movl 728(%esp), %ecx
	movl %ecx, 736(%esp)
	movl 64(%esp), %ecx
	movl %ecx, 740(%esp)
	movl 736(%esp), %ebx
	movl 740(%esp), %ecx
	movl $0, 744(%esp)
	cmpl %ecx, %ebx
	setGE 744(%esp)
	cmpl $0, 744(%esp)
	jE __655
	jNE __654
.globl __654
__654:
	movl 728(%esp), %ecx
	movl %ecx, 748(%esp)
	movl 748(%esp), %ecx
	movl %ecx, 64(%esp)
	jmp __653
.globl __655
__655:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 752(%esp)
	movl 752(%esp), %ecx
	movl %ecx, 52(%esp)
	jmp __653
.globl __657
__657:
	jmp __653
.globl __653
__653:
	movl 668(%esp), %ecx
	movl %ecx, 756(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 760(%esp)
	movl 760(%esp), %ecx
	movl 756(%esp), %eax
	addl %ecx, %eax
	movl %eax, 764(%esp)
	movl 764(%esp), %ecx
	movl %ecx, 668(%esp)
	jmp __652
.globl __650
__650:
	movl 52(%esp), %ecx
	movl %ecx, 768(%esp)
	movl 768(%esp), %eax
	addl $772, %esp
	popl %ebp
	ret
