	.file	"<stdin>"
	.text
	.globl	oat_init
	.align	16, 0x90
	.type	oat_init,@function
oat_init:                               # @oat_init
.Ltmp0:
# BB#0:                                 # %__fresh143
	ret
.Ltmp1:
	.size	oat_init, .Ltmp1-oat_init
.Ltmp2:

	.globl	program
	.align	16, 0x90
	.type	program,@function
program:                                # @program
.Ltmp4:
# BB#0:                                 # %__fresh142
	subl	$12, %esp
.Ltmp5:
	movl	20(%esp), %eax
	movl	16(%esp), %ecx
	movl	%ecx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	_oat_string1119, %eax
	movl	%eax, (%esp)
	calll	my_length_of_string
	addl	$12, %esp
	ret
.Ltmp6:
	.size	program, .Ltmp6-program
.Ltmp7:

	.globl	my_length_of_string
	.align	16, 0x90
	.type	my_length_of_string,@function
my_length_of_string:                    # @my_length_of_string
.Ltmp9:
# BB#0:                                 # %__fresh141
	subl	$12, %esp
.Ltmp10:
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	calll	array_of_string
	movl	(%eax), %eax
	addl	$12, %esp
	ret
.Ltmp11:
	.size	my_length_of_string, .Ltmp11-my_length_of_string
.Ltmp12:

	.type	.L_oat_string1119.str.,@object # @_oat_string1119.str.
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	4
.L_oat_string1119.str.:
	.asciz	"Hello?"
	.size	.L_oat_string1119.str., 7

	.type	_oat_string1119,@object # @_oat_string1119
	.data
	.globl	_oat_string1119
	.align	4
_oat_string1119:
	.long	.L_oat_string1119.str.
	.size	_oat_string1119, 4


	.section	".note.GNU-stack","",@progbits
	.section	.eh_frame,"a",@progbits
.Ltmp13:
.Ltmp14:
	.long	(.Ltmp15-.Ltmp14)-4     # CIE Length
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
.Ltmp15:
	.long	(.Ltmp17-.Ltmp16)-0     # FDE Length
.Ltmp16:
	.long	(.Ltmp16-.Ltmp14)-0     # FDE CIE Offset
	.long	.Ltmp0                  # FDE initial location
	.long	(.Ltmp2-.Ltmp0)-0       # FDE address range
	.byte	0                       # Augmentation size
	.align	4
.Ltmp17:
	.long	(.Ltmp19-.Ltmp18)-0     # FDE Length
.Ltmp18:
	.long	(.Ltmp18-.Ltmp14)-0     # FDE CIE Offset
	.long	.Ltmp4                  # FDE initial location
	.long	(.Ltmp7-.Ltmp4)-0       # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp5-.Ltmp4
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp19:
	.long	(.Ltmp21-.Ltmp20)-0     # FDE Length
.Ltmp20:
	.long	(.Ltmp20-.Ltmp14)-0     # FDE CIE Offset
	.long	.Ltmp9                  # FDE initial location
	.long	(.Ltmp12-.Ltmp9)-0      # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp10-.Ltmp9
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
	.align	4
.Ltmp21:
