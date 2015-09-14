	.file	"<stdin>"
	.text
	.globl	oat_init
	.align	16, 0x90
	.type	oat_init,@function
oat_init:                               # @oat_init
.Ltmp0:
# BB#0:                                 # %__fresh19
	ret
.Ltmp1:
	.size	oat_init, .Ltmp1-oat_init
.Ltmp2:

	.globl	program
	.align	16, 0x90
	.type	program,@function
program:                                # @program
.Ltmp5:
# BB#0:                                 # %__fresh18
	pushl	%esi
.Ltmp6:
	subl	$24, %esp
.Ltmp7:
.Ltmp8:
	movl	36(%esp), %eax
	movl	32(%esp), %ecx
	movl	$1, %edx
	movl	$2, %esi
	movl	%ecx, 20(%esp)
	movl	%eax, 16(%esp)
	movl	$1, (%esp)
	movl	$2, 4(%esp)
	movl	%edx, 12(%esp)          # 4-byte Spill
	movl	%esi, 8(%esp)           # 4-byte Spill
	calll	f
	addl	$24, %esp
	popl	%esi
	ret
.Ltmp9:
	.size	program, .Ltmp9-program
.Ltmp10:

	.globl	f
	.align	16, 0x90
	.type	f,@function
f:                                      # @f
.Ltmp12:
# BB#0:                                 # %__fresh17
	subl	$8, %esp
.Ltmp13:
	movl	16(%esp), %eax
	movl	12(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	4(%esp), %eax
	addl	$8, %esp
	ret
.Ltmp14:
	.size	f, .Ltmp14-f
.Ltmp15:


	.section	".note.GNU-stack","",@progbits
	.section	.eh_frame,"a",@progbits
.Ltmp16:
.Ltmp17:
	.long	(.Ltmp18-.Ltmp17)-4     # CIE Length
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
.Ltmp18:
	.long	(.Ltmp20-.Ltmp19)-0     # FDE Length
.Ltmp19:
	.long	(.Ltmp19-.Ltmp17)-0     # FDE CIE Offset
	.long	.Ltmp0                  # FDE initial location
	.long	(.Ltmp2-.Ltmp0)-0       # FDE address range
	.byte	0                       # Augmentation size
	.align	4
.Ltmp20:
	.long	(.Ltmp22-.Ltmp21)-0     # FDE Length
.Ltmp21:
	.long	(.Ltmp21-.Ltmp17)-0     # FDE CIE Offset
	.long	.Ltmp5                  # FDE initial location
	.long	(.Ltmp10-.Ltmp5)-0      # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp6-.Ltmp5
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	8                       # Offset 8
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp7-.Ltmp6
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	32                      # Offset 32
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp8-.Ltmp7
	.byte	134                     # DW_CFA_offset + Reg(6)
	.byte	2                       # Offset 2
	.align	4
.Ltmp22:
	.long	(.Ltmp24-.Ltmp23)-0     # FDE Length
.Ltmp23:
	.long	(.Ltmp23-.Ltmp17)-0     # FDE CIE Offset
	.long	.Ltmp12                 # FDE initial location
	.long	(.Ltmp15-.Ltmp12)-0     # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp13-.Ltmp12
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	12                      # Offset 12
	.align	4
	.align	4
.Ltmp24:
