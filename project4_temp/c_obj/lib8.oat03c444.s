	.file	"<stdin>"
	.text
	.globl	oat_init
	.align	16, 0x90
	.type	oat_init,@function
oat_init:                               # @oat_init
.Ltmp0:
# BB#0:                                 # %__fresh234
	ret
.Ltmp1:
	.size	oat_init, .Ltmp1-oat_init
.Ltmp2:

	.globl	program
	.align	16, 0x90
	.type	program,@function
program:                                # @program
.Ltmp4:
# BB#0:                                 # %__fresh233
	subl	$28, %esp
.Ltmp5:
	movl	36(%esp), %eax
	movl	32(%esp), %ecx
	movl	%ecx, 24(%esp)
	movl	%eax, 20(%esp)
	movl	_oat_string1515, %eax
	movl	%eax, 16(%esp)
	movl	16(%esp), %eax
	movl	%eax, (%esp)
	calll	print_string
	movl	$0, %eax
	addl	$28, %esp
	ret
.Ltmp6:
	.size	program, .Ltmp6-program
.Ltmp7:

	.type	.L_oat_string1515.str.,@object # @_oat_string1515.str.
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	4
.L_oat_string1515.str.:
	.asciz	"Hello world!\n"
	.size	.L_oat_string1515.str., 14

	.type	_oat_string1515,@object # @_oat_string1515
	.data
	.globl	_oat_string1515
	.align	4
_oat_string1515:
	.long	.L_oat_string1515.str.
	.size	_oat_string1515, 4


	.section	".note.GNU-stack","",@progbits
	.section	.eh_frame,"a",@progbits
.Ltmp8:
.Ltmp9:
	.long	(.Ltmp10-.Ltmp9)-4      # CIE Length
	.long	0                       # CIE ID Tag
	.byte	1                       # DW_CIE_VERSION
	.ascii	"zR"                    # CIE Augmentation
	.byte	0
	.byte	1                       # CIE Code Alignment Factor
	.byte	124                     # CIE Data Alignment Factor
	.byte	8                       # CIE Return Address Column
	.byte	1                       # Augmentation Size
	.byte	0                       # FDE Encoding = absptr
	.byte	12                      # DW_CFA_def_cfa
	.byte	4                       # Reg 4
	.byte	4                       # Offset 4
	.byte	136                     # DW_CFA_offset + Reg(8)
	.byte	1                       # Offset 1
	.align	4
.Ltmp10:
	.long	(.Ltmp12-.Ltmp11)-0     # FDE Length
.Ltmp11:
	.long	(.Ltmp11-.Ltmp9)-0      # FDE CIE Offset
	.long	.Ltmp0                  # FDE initial location
	.long	(.Ltmp2-.Ltmp0)-0       # FDE address range
	.byte	0                       # Augmentation size
	.align	4
.Ltmp12:
	.long	(.Ltmp14-.Ltmp13)-0     # FDE Length
.Ltmp13:
	.long	(.Ltmp13-.Ltmp9)-0      # FDE CIE Offset
	.long	.Ltmp4                  # FDE initial location
	.long	(.Ltmp7-.Ltmp4)-0       # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp5-.Ltmp4
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	32                      # Offset 32
	.align	4
	.align	4
.Ltmp14:
