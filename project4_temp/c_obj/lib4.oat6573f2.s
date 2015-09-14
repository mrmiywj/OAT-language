	.file	"<stdin>"
	.text
	.globl	oat_init
	.align	16, 0x90
	.type	oat_init,@function
oat_init:                               # @oat_init
.Ltmp1:
# BB#0:                                 # %__fresh202
	subl	$12, %esp
.Ltmp2:
	calll	str1555.init
	addl	$12, %esp
	ret
.Ltmp3:
	.size	oat_init, .Ltmp3-oat_init
.Ltmp4:

	.globl	program
	.align	16, 0x90
	.type	program,@function
program:                                # @program
.Ltmp6:
# BB#0:                                 # %__fresh199
	subl	$44, %esp
.Ltmp7:
	movl	52(%esp), %eax
	movl	48(%esp), %ecx
	movl	%ecx, 40(%esp)
	movl	%eax, 32(%esp)
	movl	str1555, %eax
	movl	%esp, %ecx
	movl	%eax, (%ecx)
	calll	array_of_string
	movl	%eax, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
.LBB1_1:                                # %__cond198
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$5, 16(%esp)
	jge	.LBB1_3
# BB#2:                                 # %__body197
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	20(%esp), %eax
	movl	16(%esp), %ecx
	movl	24(%esp), %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 12(%esp)          # 4-byte Spill
	movl	%ecx, 8(%esp)           # 4-byte Spill
	calll	oat_array_bounds_check
	movl	12(%esp), %eax          # 4-byte Reload
	movl	8(%esp), %ecx           # 4-byte Reload
	addl	28(%esp,%ecx,4), %eax
	movl	%eax, 20(%esp)
	movl	16(%esp), %eax
	addl	$1, %eax
	movl	%eax, 16(%esp)
	jmp	.LBB1_1
.LBB1_3:                                # %__post196
	movl	20(%esp), %eax
	addl	$44, %esp
	ret
.Ltmp8:
	.size	program, .Ltmp8-program
.Ltmp9:

	.globl	str1555.init
	.align	16, 0x90
	.type	str1555.init,@function
str1555.init:                           # @str1555.init
.Ltmp10:
# BB#0:                                 # %__fresh195
	movl	_oat_string1553, %eax
	movl	%eax, str1555
	ret
.Ltmp11:
	.size	str1555.init, .Ltmp11-str1555.init
.Ltmp12:

	.type	str1555,@object         # @str1555
	.bss
	.globl	str1555
	.align	4
str1555:
	.long	0
	.size	str1555, 4

	.type	.L_oat_string1553.str.,@object # @_oat_string1553.str.
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	4
.L_oat_string1553.str.:
	.asciz	"hello"
	.size	.L_oat_string1553.str., 6

	.type	_oat_string1553,@object # @_oat_string1553
	.data
	.globl	_oat_string1553
	.align	4
_oat_string1553:
	.long	.L_oat_string1553.str.
	.size	_oat_string1553, 4


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
	.long	.Ltmp1                  # FDE initial location
	.long	(.Ltmp4-.Ltmp1)-0       # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp2-.Ltmp1
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp17:
	.long	(.Ltmp19-.Ltmp18)-0     # FDE Length
.Ltmp18:
	.long	(.Ltmp18-.Ltmp14)-0     # FDE CIE Offset
	.long	.Ltmp6                  # FDE initial location
	.long	(.Ltmp9-.Ltmp6)-0       # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp7-.Ltmp6
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	48                      # Offset 48
	.align	4
.Ltmp19:
	.long	(.Ltmp21-.Ltmp20)-0     # FDE Length
.Ltmp20:
	.long	(.Ltmp20-.Ltmp14)-0     # FDE CIE Offset
	.long	.Ltmp10                 # FDE initial location
	.long	(.Ltmp12-.Ltmp10)-0     # FDE address range
	.byte	0                       # Augmentation size
	.align	4
	.align	4
.Ltmp21:
