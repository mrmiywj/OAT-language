	.file	"<stdin>"
	.text
	.globl	oat_init
	.align	16, 0x90
	.type	oat_init,@function
oat_init:                               # @oat_init
.Ltmp1:
# BB#0:                                 # %__fresh149
	subl	$12, %esp
.Ltmp2:
	calll	a1147.init
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
# BB#0:                                 # %__fresh148
	subl	$12, %esp
.Ltmp7:
	movl	20(%esp), %eax
	movl	16(%esp), %ecx
	movl	%ecx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	a1147, %eax
	movl	%eax, (%esp)
	calll	string_of_array
	movl	%eax, (%esp)
	calll	print_string
	movl	$0, %eax
	addl	$12, %esp
	ret
.Ltmp8:
	.size	program, .Ltmp8-program
.Ltmp9:

	.globl	a1147.init
	.align	16, 0x90
	.type	a1147.init,@function
a1147.init:                             # @a1147.init
.Ltmp11:
# BB#0:                                 # %__fresh147
	subl	$12, %esp
.Ltmp12:
	movl	$10, %eax
	movl	$10, (%esp)
	movl	%eax, 8(%esp)           # 4-byte Spill
	calll	oat_alloc_array
	movl	$126, 4(%eax)
	movl	$125, 8(%eax)
	movl	$124, 12(%eax)
	movl	$123, 16(%eax)
	movl	$122, 20(%eax)
	movl	$121, 24(%eax)
	movl	$120, 28(%eax)
	movl	$119, 32(%eax)
	movl	$118, 36(%eax)
	movl	$117, 40(%eax)
	movl	%eax, a1147
	addl	$12, %esp
	ret
.Ltmp13:
	.size	a1147.init, .Ltmp13-a1147.init
.Ltmp14:

	.type	a1147,@object           # @a1147
	.bss
	.globl	a1147
	.align	4
a1147:
	.long	0
	.size	a1147, 4


	.section	".note.GNU-stack","",@progbits
	.section	.eh_frame,"a",@progbits
.Ltmp15:
.Ltmp16:
	.long	(.Ltmp17-.Ltmp16)-4     # CIE Length
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
.Ltmp17:
	.long	(.Ltmp19-.Ltmp18)-0     # FDE Length
.Ltmp18:
	.long	(.Ltmp18-.Ltmp16)-0     # FDE CIE Offset
	.long	.Ltmp1                  # FDE initial location
	.long	(.Ltmp4-.Ltmp1)-0       # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp2-.Ltmp1
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp19:
	.long	(.Ltmp21-.Ltmp20)-0     # FDE Length
.Ltmp20:
	.long	(.Ltmp20-.Ltmp16)-0     # FDE CIE Offset
	.long	.Ltmp6                  # FDE initial location
	.long	(.Ltmp9-.Ltmp6)-0       # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp7-.Ltmp6
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp21:
	.long	(.Ltmp23-.Ltmp22)-0     # FDE Length
.Ltmp22:
	.long	(.Ltmp22-.Ltmp16)-0     # FDE CIE Offset
	.long	.Ltmp11                 # FDE initial location
	.long	(.Ltmp14-.Ltmp11)-0     # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp12-.Ltmp11
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
	.align	4
.Ltmp23:
