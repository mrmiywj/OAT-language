	.file	"<stdin>"
	.text
	.globl	oat_init
	.align	16, 0x90
	.type	oat_init,@function
oat_init:                               # @oat_init
.Ltmp0:
# BB#0:                                 # %__fresh23
	ret
.Ltmp1:
	.size	oat_init, .Ltmp1-oat_init
.Ltmp2:

	.globl	program
	.align	16, 0x90
	.type	program,@function
program:                                # @program
.Ltmp4:
# BB#0:                                 # %__fresh22
	subl	$12, %esp
.Ltmp5:
	movl	20(%esp), %eax
	movl	16(%esp), %ecx
	movl	%ecx, 8(%esp)
	movl	%eax, 4(%esp)
	calll	f
	movl	%eax, (%esp)            # 4-byte Spill
	calll	g
	movl	(%esp), %ecx            # 4-byte Reload
	addl	%eax, %ecx
	addl	i62, %ecx
	movl	%ecx, %eax
	addl	$12, %esp
	ret
.Ltmp6:
	.size	program, .Ltmp6-program
.Ltmp7:

	.globl	g
	.align	16, 0x90
	.type	g,@function
g:                                      # @g
.Ltmp9:
# BB#0:                                 # %__fresh21
	subl	$12, %esp
.Ltmp10:
	movl	$1, 8(%esp)
	movl	8(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$10, (%esp)
	movl	i62, %eax
	addl	$12, %esp
	ret
.Ltmp11:
	.size	g, .Ltmp11-g
.Ltmp12:

	.globl	f
	.align	16, 0x90
	.type	f,@function
f:                                      # @f
.Ltmp14:
# BB#0:                                 # %__fresh20
	pushl	%eax
.Ltmp15:
	movl	$12, (%esp)
	movl	(%esp), %eax
	popl	%edx
	ret
.Ltmp16:
	.size	f, .Ltmp16-f
.Ltmp17:

	.type	i62,@object             # @i62
	.data
	.globl	i62
	.align	4
i62:
	.long	11                      # 0xb
	.size	i62, 4


	.section	".note.GNU-stack","",@progbits
	.section	.eh_frame,"a",@progbits
.Ltmp18:
.Ltmp19:
	.long	(.Ltmp20-.Ltmp19)-4     # CIE Length
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
.Ltmp20:
	.long	(.Ltmp22-.Ltmp21)-0     # FDE Length
.Ltmp21:
	.long	(.Ltmp21-.Ltmp19)-0     # FDE CIE Offset
	.long	.Ltmp0                  # FDE initial location
	.long	(.Ltmp2-.Ltmp0)-0       # FDE address range
	.byte	0                       # Augmentation size
	.align	4
.Ltmp22:
	.long	(.Ltmp24-.Ltmp23)-0     # FDE Length
.Ltmp23:
	.long	(.Ltmp23-.Ltmp19)-0     # FDE CIE Offset
	.long	.Ltmp4                  # FDE initial location
	.long	(.Ltmp7-.Ltmp4)-0       # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp5-.Ltmp4
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp24:
	.long	(.Ltmp26-.Ltmp25)-0     # FDE Length
.Ltmp25:
	.long	(.Ltmp25-.Ltmp19)-0     # FDE CIE Offset
	.long	.Ltmp9                  # FDE initial location
	.long	(.Ltmp12-.Ltmp9)-0      # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp10-.Ltmp9
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp26:
	.long	(.Ltmp28-.Ltmp27)-0     # FDE Length
.Ltmp27:
	.long	(.Ltmp27-.Ltmp19)-0     # FDE CIE Offset
	.long	.Ltmp14                 # FDE initial location
	.long	(.Ltmp17-.Ltmp14)-0     # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp15-.Ltmp14
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	8                       # Offset 8
	.align	4
	.align	4
.Ltmp28:
