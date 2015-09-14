	.file	"<stdin>"
	.text
	.globl	oat_init
	.align	16, 0x90
	.type	oat_init,@function
oat_init:                               # @oat_init
.Ltmp0:
# BB#0:                                 # %__fresh90
	ret
.Ltmp1:
	.size	oat_init, .Ltmp1-oat_init
.Ltmp2:

	.globl	program
	.align	16, 0x90
	.type	program,@function
program:                                # @program
.Ltmp4:
# BB#0:                                 # %__fresh89
	subl	$12, %esp
.Ltmp5:
	movl	20(%esp), %eax
	movl	16(%esp), %ecx
	movl	%ecx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	calll	f1
	addl	$12, %esp
	ret
.Ltmp6:
	.size	program, .Ltmp6-program
.Ltmp7:

	.globl	f9
	.align	16, 0x90
	.type	f9,@function
f9:                                     # @f9
.Ltmp9:
# BB#0:                                 # %__fresh88
	pushl	%eax
.Ltmp10:
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	movl	(%esp), %eax
	popl	%edx
	ret
.Ltmp11:
	.size	f9, .Ltmp11-f9
.Ltmp12:

	.globl	f8
	.align	16, 0x90
	.type	f8,@function
f8:                                     # @f8
.Ltmp14:
# BB#0:                                 # %__fresh87
	subl	$12, %esp
.Ltmp15:
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	calll	f9
	addl	$12, %esp
	ret
.Ltmp16:
	.size	f8, .Ltmp16-f8
.Ltmp17:

	.globl	f7
	.align	16, 0x90
	.type	f7,@function
f7:                                     # @f7
.Ltmp19:
# BB#0:                                 # %__fresh86
	subl	$12, %esp
.Ltmp20:
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	calll	f8
	addl	$12, %esp
	ret
.Ltmp21:
	.size	f7, .Ltmp21-f7
.Ltmp22:

	.globl	f6
	.align	16, 0x90
	.type	f6,@function
f6:                                     # @f6
.Ltmp24:
# BB#0:                                 # %__fresh85
	subl	$12, %esp
.Ltmp25:
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	calll	f7
	addl	$12, %esp
	ret
.Ltmp26:
	.size	f6, .Ltmp26-f6
.Ltmp27:

	.globl	f5
	.align	16, 0x90
	.type	f5,@function
f5:                                     # @f5
.Ltmp29:
# BB#0:                                 # %__fresh84
	subl	$12, %esp
.Ltmp30:
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	calll	f6
	addl	$12, %esp
	ret
.Ltmp31:
	.size	f5, .Ltmp31-f5
.Ltmp32:

	.globl	f4
	.align	16, 0x90
	.type	f4,@function
f4:                                     # @f4
.Ltmp34:
# BB#0:                                 # %__fresh83
	subl	$12, %esp
.Ltmp35:
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	calll	f5
	addl	$12, %esp
	ret
.Ltmp36:
	.size	f4, .Ltmp36-f4
.Ltmp37:

	.globl	f3
	.align	16, 0x90
	.type	f3,@function
f3:                                     # @f3
.Ltmp39:
# BB#0:                                 # %__fresh82
	subl	$12, %esp
.Ltmp40:
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	calll	f4
	addl	$12, %esp
	ret
.Ltmp41:
	.size	f3, .Ltmp41-f3
.Ltmp42:

	.globl	f2
	.align	16, 0x90
	.type	f2,@function
f2:                                     # @f2
.Ltmp44:
# BB#0:                                 # %__fresh81
	subl	$12, %esp
.Ltmp45:
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	calll	f3
	addl	$12, %esp
	ret
.Ltmp46:
	.size	f2, .Ltmp46-f2
.Ltmp47:

	.globl	f1
	.align	16, 0x90
	.type	f1,@function
f1:                                     # @f1
.Ltmp49:
# BB#0:                                 # %__fresh80
	subl	$12, %esp
.Ltmp50:
	movl	16(%esp), %eax
	movl	%eax, 8(%esp)
	movl	8(%esp), %eax
	movl	%eax, (%esp)
	calll	f2
	addl	$12, %esp
	ret
.Ltmp51:
	.size	f1, .Ltmp51-f1
.Ltmp52:


	.section	".note.GNU-stack","",@progbits
	.section	.eh_frame,"a",@progbits
.Ltmp53:
.Ltmp54:
	.long	(.Ltmp55-.Ltmp54)-4     # CIE Length
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
.Ltmp55:
	.long	(.Ltmp57-.Ltmp56)-0     # FDE Length
.Ltmp56:
	.long	(.Ltmp56-.Ltmp54)-0     # FDE CIE Offset
	.long	.Ltmp0                  # FDE initial location
	.long	(.Ltmp2-.Ltmp0)-0       # FDE address range
	.byte	0                       # Augmentation size
	.align	4
.Ltmp57:
	.long	(.Ltmp59-.Ltmp58)-0     # FDE Length
.Ltmp58:
	.long	(.Ltmp58-.Ltmp54)-0     # FDE CIE Offset
	.long	.Ltmp4                  # FDE initial location
	.long	(.Ltmp7-.Ltmp4)-0       # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp5-.Ltmp4
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp59:
	.long	(.Ltmp61-.Ltmp60)-0     # FDE Length
.Ltmp60:
	.long	(.Ltmp60-.Ltmp54)-0     # FDE CIE Offset
	.long	.Ltmp9                  # FDE initial location
	.long	(.Ltmp12-.Ltmp9)-0      # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp10-.Ltmp9
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	8                       # Offset 8
	.align	4
.Ltmp61:
	.long	(.Ltmp63-.Ltmp62)-0     # FDE Length
.Ltmp62:
	.long	(.Ltmp62-.Ltmp54)-0     # FDE CIE Offset
	.long	.Ltmp14                 # FDE initial location
	.long	(.Ltmp17-.Ltmp14)-0     # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp15-.Ltmp14
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp63:
	.long	(.Ltmp65-.Ltmp64)-0     # FDE Length
.Ltmp64:
	.long	(.Ltmp64-.Ltmp54)-0     # FDE CIE Offset
	.long	.Ltmp19                 # FDE initial location
	.long	(.Ltmp22-.Ltmp19)-0     # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp20-.Ltmp19
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp65:
	.long	(.Ltmp67-.Ltmp66)-0     # FDE Length
.Ltmp66:
	.long	(.Ltmp66-.Ltmp54)-0     # FDE CIE Offset
	.long	.Ltmp24                 # FDE initial location
	.long	(.Ltmp27-.Ltmp24)-0     # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp25-.Ltmp24
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp67:
	.long	(.Ltmp69-.Ltmp68)-0     # FDE Length
.Ltmp68:
	.long	(.Ltmp68-.Ltmp54)-0     # FDE CIE Offset
	.long	.Ltmp29                 # FDE initial location
	.long	(.Ltmp32-.Ltmp29)-0     # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp30-.Ltmp29
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp69:
	.long	(.Ltmp71-.Ltmp70)-0     # FDE Length
.Ltmp70:
	.long	(.Ltmp70-.Ltmp54)-0     # FDE CIE Offset
	.long	.Ltmp34                 # FDE initial location
	.long	(.Ltmp37-.Ltmp34)-0     # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp35-.Ltmp34
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp71:
	.long	(.Ltmp73-.Ltmp72)-0     # FDE Length
.Ltmp72:
	.long	(.Ltmp72-.Ltmp54)-0     # FDE CIE Offset
	.long	.Ltmp39                 # FDE initial location
	.long	(.Ltmp42-.Ltmp39)-0     # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp40-.Ltmp39
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp73:
	.long	(.Ltmp75-.Ltmp74)-0     # FDE Length
.Ltmp74:
	.long	(.Ltmp74-.Ltmp54)-0     # FDE CIE Offset
	.long	.Ltmp44                 # FDE initial location
	.long	(.Ltmp47-.Ltmp44)-0     # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp45-.Ltmp44
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp75:
	.long	(.Ltmp77-.Ltmp76)-0     # FDE Length
.Ltmp76:
	.long	(.Ltmp76-.Ltmp54)-0     # FDE CIE Offset
	.long	.Ltmp49                 # FDE initial location
	.long	(.Ltmp52-.Ltmp49)-0     # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp50-.Ltmp49
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
	.align	4
.Ltmp77:
