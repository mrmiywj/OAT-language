	.align 4
	.data
__const_str305:
	.ascii "C\0"
__const_str304:
	.ascii "C\0"
__const_str303:
	.ascii "B\0"
__const_str302:
	.ascii "B\0"
__const_str301:
	.ascii "A\0"
__const_str300:
	.ascii "A\0"
__const_str299:
	.ascii "Object\0"
__C_vtable298:
	.long __Object_vtable295
	.long __Object_get_name
	.long __C_print

__B_vtable297:
	.long __A_vtable296
	.long __Object_get_name
	.long __B_f
	.long __B_print

__A_vtable296:
	.long __Object_vtable295
	.long __Object_get_name
	.long __A_f
	.long __A_print

__Object_vtable295:
	.long 0
	.long __Object_get_name

	.text
.globl _oat_init
_oat_init:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh532:
	movl %ebp, %esp
	popl %ebp
	ret
.globl _program
_program:
	pushl %ebp
	movl %esp, %ebp
	subl $176, %esp
__fresh531:
	leal -176(%ebp), %eax
	movl %eax, -156(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -156(%ebp), %eax
	movl %ecx, (%eax)
	leal -172(%ebp), %eax
	movl %eax, -152(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -152(%ebp), %eax
	movl %ecx, (%eax)
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -148(%ebp)
	addl $4, %esp
	movl -148(%ebp), %eax
	movl %eax, -144(%ebp)
	movl -144(%ebp), %eax
	pushl %eax
	call __A_ctor
	movl %eax, -140(%ebp)
	addl $4, %esp
	leal -168(%ebp), %eax
	movl %eax, -136(%ebp)
	movl -140(%ebp), %eax
	movl %eax, %ecx
	movl -136(%ebp), %eax
	movl %ecx, (%eax)
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -132(%ebp)
	addl $4, %esp
	movl -132(%ebp), %eax
	movl %eax, -128(%ebp)
	movl -128(%ebp), %eax
	pushl %eax
	call __B_ctor
	movl %eax, -124(%ebp)
	addl $4, %esp
	leal -164(%ebp), %eax
	movl %eax, -120(%ebp)
	movl -124(%ebp), %eax
	movl %eax, %ecx
	movl -120(%ebp), %eax
	movl %ecx, (%eax)
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -116(%ebp)
	addl $4, %esp
	movl -116(%ebp), %eax
	movl %eax, -112(%ebp)
	movl -112(%ebp), %eax
	pushl %eax
	call __C_ctor
	movl %eax, -108(%ebp)
	addl $4, %esp
	leal -160(%ebp), %eax
	movl %eax, -104(%ebp)
	movl -108(%ebp), %eax
	movl %eax, %ecx
	movl -104(%ebp), %eax
	movl %ecx, (%eax)
	movl -136(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -100(%ebp)
	movl -100(%ebp), %eax
	addl $0, %eax
	movl %eax, -96(%ebp)
	movl -96(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -92(%ebp)
	movl -92(%ebp), %eax
	addl $12, %eax
	movl %eax, -88(%ebp)
	movl -88(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -84(%ebp)
	movl -100(%ebp), %eax
	pushl %eax
	movl -84(%ebp), %eax
	call *%eax
	addl $4, %esp
	movl -120(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -80(%ebp)
	movl -80(%ebp), %eax
	addl $0, %eax
	movl %eax, -76(%ebp)
	movl -76(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -72(%ebp)
	movl -72(%ebp), %eax
	addl $12, %eax
	movl %eax, -68(%ebp)
	movl -68(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -64(%ebp)
	movl -80(%ebp), %eax
	pushl %eax
	movl -64(%ebp), %eax
	call *%eax
	addl $4, %esp
	movl -120(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -60(%ebp)
	movl -60(%ebp), %eax
	addl $0, %eax
	movl %eax, -56(%ebp)
	movl -56(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -52(%ebp)
	movl -52(%ebp), %eax
	addl $8, %eax
	movl %eax, -48(%ebp)
	movl -48(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -44(%ebp)
	movl -60(%ebp), %eax
	pushl %eax
	movl -44(%ebp), %eax
	call *%eax
	movl %eax, -40(%ebp)
	addl $4, %esp
	movl -40(%ebp), %eax
	addl $0, %eax
	movl %eax, -36(%ebp)
	movl -36(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -32(%ebp)
	movl -32(%ebp), %eax
	addl $8, %eax
	movl %eax, -28(%ebp)
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -24(%ebp)
	movl -40(%ebp), %eax
	pushl %eax
	movl -24(%ebp), %eax
	call *%eax
	addl $4, %esp
	movl -104(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -20(%ebp)
	movl -20(%ebp), %eax
	addl $0, %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -12(%ebp)
	movl -12(%ebp), %eax
	addl $8, %eax
	movl %eax, -8(%ebp)
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -4(%ebp)
	movl -20(%ebp), %eax
	pushl %eax
	movl -4(%ebp), %eax
	call *%eax
	addl $4, %esp
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __C_print
__C_print:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh530:
	movl $__const_str305, %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl %ebp, %esp
	popl %ebp
	ret
.globl __C_ctor
__C_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh529:
	movl 8(%ebp), %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	pushl %eax
	call __Object_ctor
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str304, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__C_vtable298, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __B_print
__B_print:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh528:
	movl $__const_str303, %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl %ebp, %esp
	popl %ebp
	ret
.globl __B_f
__B_f:
	pushl %ebp
	movl %esp, %ebp
	subl $12, %esp
__fresh527:
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl -12(%ebp), %eax
	movl %eax, -8(%ebp)
	movl -8(%ebp), %eax
	pushl %eax
	call __C_ctor
	movl %eax, -4(%ebp)
	addl $4, %esp
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __B_ctor
__B_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh526:
	movl 8(%ebp), %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	pushl %eax
	call __A_ctor
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str302, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__B_vtable297, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __A_print
__A_print:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh525:
	movl $__const_str301, %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl %ebp, %esp
	popl %ebp
	ret
.globl __A_f
__A_f:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh524:
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -16(%ebp)
	addl $4, %esp
	movl -16(%ebp), %eax
	movl %eax, -12(%ebp)
	movl -12(%ebp), %eax
	pushl %eax
	call __B_ctor
	movl %eax, -8(%ebp)
	addl $4, %esp
	movl -8(%ebp), %eax
	movl %eax, -4(%ebp)
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __A_ctor
__A_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh523:
	movl 8(%ebp), %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	pushl %eax
	call __Object_ctor
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str300, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__A_vtable296, %eax
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
__fresh522:
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
__fresh521:
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str299, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__Object_vtable295, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
