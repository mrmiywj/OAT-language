	.align 4
	.data
__const_str608:
	.ascii "6\0"
_c606:
	.long 0
_p604:
	.long 0
__const_str603:
	.ascii "5\0"
__const_str602:
	.ascii "4\0"
__const_str601:
	.ascii "Charmander\0"
__const_str600:
	.ascii "3\0"
__const_str599:
	.ascii "2\0"
__const_str598:
	.ascii "Pikachu\0"
__const_str597:
	.ascii "9\0"
__const_str596:
	.ascii "Pokemon\0"
__const_str595:
	.ascii "Object\0"
__Charmander_vtable594:
	.long __Pokemon_vtable592
	.long __Object_get_name
	.long __Pokemon_gethit
	.long __Charmander_attack
	.long __Charmander_noise

__Pikachu_vtable593:
	.long __Pokemon_vtable592
	.long __Object_get_name
	.long __Pokemon_gethit
	.long __Pikachu_attack
	.long __Pikachu_noise

__Pokemon_vtable592:
	.long __Object_vtable591
	.long __Object_get_name
	.long __Pokemon_gethit

__Object_vtable591:
	.long 0
	.long __Object_get_name

	.text
.globl _oat_init
_oat_init:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh1049:
	call _p604.init605
	addl $0, %esp
	call _c606.init607
	addl $0, %esp
	movl %ebp, %esp
	popl %ebp
	ret
.globl _program
_program:
	pushl %ebp
	movl %esp, %ebp
	subl $232, %esp
__fresh1048:
	leal -232(%ebp), %eax
	movl %eax, -224(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -224(%ebp), %eax
	movl %ecx, (%eax)
	leal -228(%ebp), %eax
	movl %eax, -220(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -220(%ebp), %eax
	movl %ecx, (%eax)
	movl $_c606, %eax
	movl (%eax), %ecx
	movl %ecx, -216(%ebp)
	movl -216(%ebp), %eax
	addl $0, %eax
	movl %eax, -212(%ebp)
	movl -212(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -208(%ebp)
	movl -208(%ebp), %eax
	addl $12, %eax
	movl %eax, -204(%ebp)
	movl -204(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -200(%ebp)
	movl $_p604, %eax
	movl (%eax), %ecx
	movl %ecx, -196(%ebp)
	movl -196(%ebp), %eax
	pushl %eax
	movl -216(%ebp), %eax
	pushl %eax
	movl -200(%ebp), %eax
	call *%eax
	addl $8, %esp
	movl $_p604, %eax
	movl (%eax), %ecx
	movl %ecx, -192(%ebp)
	movl -192(%ebp), %eax
	addl $0, %eax
	movl %eax, -188(%ebp)
	movl -188(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -184(%ebp)
	movl -184(%ebp), %eax
	addl $12, %eax
	movl %eax, -180(%ebp)
	movl -180(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -176(%ebp)
	movl $_c606, %eax
	movl (%eax), %ecx
	movl %ecx, -172(%ebp)
	movl -172(%ebp), %eax
	pushl %eax
	movl -192(%ebp), %eax
	pushl %eax
	movl -176(%ebp), %eax
	call *%eax
	addl $8, %esp
	movl $_c606, %eax
	movl (%eax), %ecx
	movl %ecx, -168(%ebp)
	movl -168(%ebp), %eax
	addl $0, %eax
	movl %eax, -164(%ebp)
	movl -164(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -160(%ebp)
	movl -160(%ebp), %eax
	addl $12, %eax
	movl %eax, -156(%ebp)
	movl -156(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -152(%ebp)
	movl $_p604, %eax
	movl (%eax), %ecx
	movl %ecx, -148(%ebp)
	movl -148(%ebp), %eax
	pushl %eax
	movl -168(%ebp), %eax
	pushl %eax
	movl -152(%ebp), %eax
	call *%eax
	addl $8, %esp
	movl $_p604, %eax
	movl (%eax), %ecx
	movl %ecx, -144(%ebp)
	movl -144(%ebp), %eax
	addl $0, %eax
	movl %eax, -140(%ebp)
	movl -140(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -136(%ebp)
	movl -136(%ebp), %eax
	addl $12, %eax
	movl %eax, -132(%ebp)
	movl -132(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -128(%ebp)
	movl $_c606, %eax
	movl (%eax), %ecx
	movl %ecx, -124(%ebp)
	movl -124(%ebp), %eax
	pushl %eax
	movl -144(%ebp), %eax
	pushl %eax
	movl -128(%ebp), %eax
	call *%eax
	addl $8, %esp
	movl $_c606, %eax
	movl (%eax), %ecx
	movl %ecx, -120(%ebp)
	movl -120(%ebp), %eax
	addl $0, %eax
	movl %eax, -116(%ebp)
	movl -116(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -112(%ebp)
	movl -112(%ebp), %eax
	addl $12, %eax
	movl %eax, -108(%ebp)
	movl -108(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -104(%ebp)
	movl $_p604, %eax
	movl (%eax), %ecx
	movl %ecx, -100(%ebp)
	movl -100(%ebp), %eax
	pushl %eax
	movl -120(%ebp), %eax
	pushl %eax
	movl -104(%ebp), %eax
	call *%eax
	addl $8, %esp
	movl $_p604, %eax
	movl (%eax), %ecx
	movl %ecx, -96(%ebp)
	movl -96(%ebp), %eax
	addl $0, %eax
	movl %eax, -92(%ebp)
	movl -92(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -88(%ebp)
	movl -88(%ebp), %eax
	addl $12, %eax
	movl %eax, -84(%ebp)
	movl -84(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -80(%ebp)
	movl $_c606, %eax
	movl (%eax), %ecx
	movl %ecx, -76(%ebp)
	movl -76(%ebp), %eax
	pushl %eax
	movl -96(%ebp), %eax
	pushl %eax
	movl -80(%ebp), %eax
	call *%eax
	addl $8, %esp
	movl $_c606, %eax
	movl (%eax), %ecx
	movl %ecx, -72(%ebp)
	movl -72(%ebp), %eax
	addl $0, %eax
	movl %eax, -68(%ebp)
	movl -68(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -64(%ebp)
	movl -64(%ebp), %eax
	addl $12, %eax
	movl %eax, -60(%ebp)
	movl -60(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -56(%ebp)
	movl $_p604, %eax
	movl (%eax), %ecx
	movl %ecx, -52(%ebp)
	movl -52(%ebp), %eax
	pushl %eax
	movl -72(%ebp), %eax
	pushl %eax
	movl -56(%ebp), %eax
	call *%eax
	addl $8, %esp
	movl $_p604, %eax
	movl (%eax), %ecx
	movl %ecx, -48(%ebp)
	movl -48(%ebp), %eax
	addl $0, %eax
	movl %eax, -44(%ebp)
	movl -44(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -40(%ebp)
	movl -40(%ebp), %eax
	addl $12, %eax
	movl %eax, -36(%ebp)
	movl -36(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -32(%ebp)
	movl $_c606, %eax
	movl (%eax), %ecx
	movl %ecx, -28(%ebp)
	movl -28(%ebp), %eax
	pushl %eax
	movl -48(%ebp), %eax
	pushl %eax
	movl -32(%ebp), %eax
	call *%eax
	addl $8, %esp
	movl $_c606, %eax
	movl (%eax), %ecx
	movl %ecx, -24(%ebp)
	movl -24(%ebp), %eax
	addl $0, %eax
	movl %eax, -20(%ebp)
	movl -20(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -16(%ebp)
	movl -16(%ebp), %eax
	addl $12, %eax
	movl %eax, -12(%ebp)
	movl -12(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -8(%ebp)
	movl $_p604, %eax
	movl (%eax), %ecx
	movl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	pushl %eax
	movl -24(%ebp), %eax
	pushl %eax
	movl -8(%ebp), %eax
	call *%eax
	addl $8, %esp
	movl $__const_str608, %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl _c606.init607
_c606.init607:
	pushl %ebp
	movl %esp, %ebp
	subl $12, %esp
__fresh1047:
	movl $20, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl -12(%ebp), %eax
	movl %eax, -8(%ebp)
	movl -8(%ebp), %eax
	pushl %eax
	call __Charmander_ctor
	movl %eax, -4(%ebp)
	addl $4, %esp
	movl -4(%ebp), %eax
	movl %eax, _c606
	movl %ebp, %esp
	popl %ebp
	ret
.globl _p604.init605
_p604.init605:
	pushl %ebp
	movl %esp, %ebp
	subl $12, %esp
__fresh1046:
	movl $20, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl -12(%ebp), %eax
	movl %eax, -8(%ebp)
	movl -8(%ebp), %eax
	pushl %eax
	call __Pikachu_ctor
	movl %eax, -4(%ebp)
	addl $4, %esp
	movl -4(%ebp), %eax
	movl %eax, _p604
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Charmander_noise
__Charmander_noise:
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
__fresh1045:
	movl 8(%ebp), %eax
	addl $12, %eax
	movl %eax, -8(%ebp)
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Charmander_attack
__Charmander_attack:
	pushl %ebp
	movl %esp, %ebp
	subl $48, %esp
__fresh1044:
	leal -48(%ebp), %eax
	movl %eax, -44(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -44(%ebp), %eax
	movl %ecx, (%eax)
	movl $__const_str603, %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $12, %eax
	movl %eax, -40(%ebp)
	movl -40(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -36(%ebp)
	movl -36(%ebp), %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl -44(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -32(%ebp)
	movl -32(%ebp), %eax
	addl $0, %eax
	movl %eax, -28(%ebp)
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -24(%ebp)
	movl -24(%ebp), %eax
	addl $8, %eax
	movl %eax, -20(%ebp)
	movl -20(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -16(%ebp)
	movl 8(%ebp), %eax
	addl $16, %eax
	movl %eax, -12(%ebp)
	movl -12(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -8(%ebp)
	movl -32(%ebp), %eax
	movl %eax, -4(%ebp)
	movl -8(%ebp), %eax
	pushl %eax
	movl -4(%ebp), %eax
	pushl %eax
	movl -16(%ebp), %eax
	call *%eax
	addl $8, %esp
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Charmander_ctor
__Charmander_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $24, %esp
__fresh1043:
	movl 8(%ebp), %eax
	movl %eax, -24(%ebp)
	movl -24(%ebp), %eax
	pushl %eax
	call __Pokemon_ctor
	movl %eax, -20(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -16(%ebp)
	movl $__const_str601, %eax
	movl %eax, %ecx
	movl -16(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $12, %eax
	movl %eax, -12(%ebp)
	movl $__const_str602, %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -8(%ebp)
	movl $__Charmander_vtable594, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $16, %eax
	movl %eax, -4(%ebp)
	movl $16, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Pikachu_noise
__Pikachu_noise:
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
__fresh1042:
	movl 8(%ebp), %eax
	addl $12, %eax
	movl %eax, -8(%ebp)
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Pikachu_attack
__Pikachu_attack:
	pushl %ebp
	movl %esp, %ebp
	subl $48, %esp
__fresh1041:
	leal -48(%ebp), %eax
	movl %eax, -44(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -44(%ebp), %eax
	movl %ecx, (%eax)
	movl $__const_str600, %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $12, %eax
	movl %eax, -40(%ebp)
	movl -40(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -36(%ebp)
	movl -36(%ebp), %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl -44(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -32(%ebp)
	movl -32(%ebp), %eax
	addl $0, %eax
	movl %eax, -28(%ebp)
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -24(%ebp)
	movl -24(%ebp), %eax
	addl $8, %eax
	movl %eax, -20(%ebp)
	movl -20(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -16(%ebp)
	movl 8(%ebp), %eax
	addl $16, %eax
	movl %eax, -12(%ebp)
	movl -12(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -8(%ebp)
	movl -32(%ebp), %eax
	movl %eax, -4(%ebp)
	movl -8(%ebp), %eax
	pushl %eax
	movl -4(%ebp), %eax
	pushl %eax
	movl -16(%ebp), %eax
	call *%eax
	addl $8, %esp
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Pikachu_ctor
__Pikachu_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $24, %esp
__fresh1040:
	movl 8(%ebp), %eax
	movl %eax, -24(%ebp)
	movl -24(%ebp), %eax
	pushl %eax
	call __Pokemon_ctor
	movl %eax, -20(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -16(%ebp)
	movl $__const_str598, %eax
	movl %eax, %ecx
	movl -16(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -12(%ebp)
	movl $__Pikachu_vtable593, %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $16, %eax
	movl %eax, -8(%ebp)
	movl $25, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $12, %eax
	movl %eax, -4(%ebp)
	movl $__const_str599, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Pokemon_gethit
__Pokemon_gethit:
	pushl %ebp
	movl %esp, %ebp
	subl $36, %esp
__fresh1039:
	leal -36(%ebp), %eax
	movl %eax, -32(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -32(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $8, %eax
	movl %eax, -28(%ebp)
	movl 8(%ebp), %eax
	addl $8, %eax
	movl %eax, -24(%ebp)
	movl -24(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -20(%ebp)
	movl -32(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -16(%ebp)
	movl -20(%ebp), %eax
	movl %eax, -12(%ebp)
	movl -16(%ebp), %eax
	movl %eax, %ecx
	subl %ecx, -12(%ebp)
	movl -12(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $12, %eax
	movl %eax, -8(%ebp)
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Pokemon_ctor
__Pokemon_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $24, %esp
__fresh1038:
	movl 8(%ebp), %eax
	movl %eax, -24(%ebp)
	movl -24(%ebp), %eax
	pushl %eax
	call __Object_ctor
	movl %eax, -20(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -16(%ebp)
	movl $__const_str596, %eax
	movl %eax, %ecx
	movl -16(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $12, %eax
	movl %eax, -12(%ebp)
	movl $__const_str597, %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -8(%ebp)
	movl $__Pokemon_vtable592, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $8, %eax
	movl %eax, -4(%ebp)
	movl $100, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Object_get_name
__Object_get_name:
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
__fresh1037:
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Object_ctor
__Object_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
__fresh1036:
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str595, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__Object_vtable591, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
