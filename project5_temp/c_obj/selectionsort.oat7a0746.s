	.align 4
	.data
__const_str633:
	.ascii "get error: out of range\0"
__const_str632:
	.ascii "get error: out of range\0"
__const_str631:
	.ascii "Array\0"
__const_str630:
	.ascii "ArrayItem\0"
__const_str629:
	.ascii "Object\0"
__Array_vtable628:
	.long __Object_vtable626
	.long __Object_get_name
	.long __Array_getElement
	.long __Array_setElement
	.long __Array_addElement
	.long __Array_getLength

__ArrayItem_vtable627:
	.long __Object_vtable626
	.long __Object_get_name
	.long __ArrayItem_set

__Object_vtable626:
	.long 0
	.long __Object_get_name

	.text
.globl _oat_init
_oat_init:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh1165:
	movl %ebp, %esp
	popl %ebp
	ret
.globl _program
_program:
	pushl %ebp
	movl %esp, %ebp
	subl $528, %esp
__fresh1152:
	leal -492(%ebp), %eax
	movl %eax, -80(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -80(%ebp), %eax
	movl %ecx, (%eax)
	leal -488(%ebp), %eax
	movl %eax, -76(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -76(%ebp), %eax
	movl %ecx, (%eax)
	movl $16, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -72(%ebp)
	addl $4, %esp
	movl -72(%ebp), %eax
	movl %eax, -68(%ebp)
	movl -68(%ebp), %eax
	pushl %eax
	call __Array_ctor
	movl %eax, -64(%ebp)
	addl $4, %esp
	leal -484(%ebp), %eax
	movl %eax, -60(%ebp)
	movl -64(%ebp), %eax
	movl %eax, %ecx
	movl -60(%ebp), %eax
	movl %ecx, (%eax)
	leal -480(%ebp), %eax
	movl %eax, -56(%ebp)
	movl $0, %eax
	movl %eax, %ecx
	movl -56(%ebp), %eax
	movl %ecx, (%eax)
	leal -476(%ebp), %eax
	movl %eax, -52(%ebp)
	movl $0, %eax
	movl %eax, %ecx
	movl -52(%ebp), %eax
	movl %ecx, (%eax)
	movl -60(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -48(%ebp)
	movl -48(%ebp), %eax
	addl $0, %eax
	movl %eax, -44(%ebp)
	movl -44(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -40(%ebp)
	movl -40(%ebp), %eax
	addl $16, %eax
	movl %eax, -36(%ebp)
	movl -36(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -32(%ebp)
	movl $79, %eax
	pushl %eax
	movl -48(%ebp), %eax
	pushl %eax
	movl -32(%ebp), %eax
	call *%eax
	addl $8, %esp
	movl -60(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -28(%ebp)
	movl -28(%ebp), %eax
	addl $0, %eax
	movl %eax, -24(%ebp)
	movl -24(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -20(%ebp)
	movl -20(%ebp), %eax
	addl $20, %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -12(%ebp)
	movl -28(%ebp), %eax
	pushl %eax
	movl -12(%ebp), %eax
	call *%eax
	movl %eax, -8(%ebp)
	addl $4, %esp
	movl -8(%ebp), %eax
	movl %eax, %ecx
	movl -56(%ebp), %eax
	movl %ecx, (%eax)
	leal -472(%ebp), %eax
	movl %eax, -4(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	jmp __cond1136
__cond1136:
	movl -4(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -92(%ebp)
	movl -56(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -88(%ebp)
	movl -92(%ebp), %eax
	movl %eax, %ecx
	movl -88(%ebp), %eax
	cmpl %eax, %ecx
	setL -84(%ebp)
	andl $1, -84(%ebp)
	movl -84(%ebp), %eax
	cmpl $0, %eax
	jNE __body1135
	jmp __post1134
__fresh1153:
	jmp __body1135
__body1135:
	movl -4(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -112(%ebp)
	leal -500(%ebp), %eax
	movl %eax, -108(%ebp)
	movl -112(%ebp), %eax
	movl %eax, %ecx
	movl -108(%ebp), %eax
	movl %ecx, (%eax)
	movl -4(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -104(%ebp)
	movl -104(%ebp), %eax
	movl %eax, -100(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -100(%ebp)
	leal -496(%ebp), %eax
	movl %eax, -96(%ebp)
	movl -100(%ebp), %eax
	movl %eax, %ecx
	movl -96(%ebp), %eax
	movl %ecx, (%eax)
	jmp __cond1139
__cond1139:
	movl -96(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -124(%ebp)
	movl -56(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -120(%ebp)
	movl -124(%ebp), %eax
	movl %eax, %ecx
	movl -120(%ebp), %eax
	cmpl %eax, %ecx
	setLE -116(%ebp)
	andl $1, -116(%ebp)
	movl -116(%ebp), %eax
	cmpl $0, %eax
	jNE __body1138
	jmp __post1137
__fresh1154:
	jmp __body1138
__body1138:
	movl -60(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -200(%ebp)
	movl -200(%ebp), %eax
	addl $0, %eax
	movl %eax, -196(%ebp)
	movl -196(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -192(%ebp)
	movl -192(%ebp), %eax
	addl $8, %eax
	movl %eax, -188(%ebp)
	movl -188(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -184(%ebp)
	movl -96(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -180(%ebp)
	movl -180(%ebp), %eax
	pushl %eax
	movl -200(%ebp), %eax
	pushl %eax
	movl -184(%ebp), %eax
	call *%eax
	movl %eax, -176(%ebp)
	addl $8, %esp
	leal -508(%ebp), %eax
	movl %eax, -172(%ebp)
	movl -176(%ebp), %eax
	movl %eax, %ecx
	movl -172(%ebp), %eax
	movl %ecx, (%eax)
	movl -60(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -168(%ebp)
	movl -168(%ebp), %eax
	addl $0, %eax
	movl %eax, -164(%ebp)
	movl -164(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -160(%ebp)
	movl -160(%ebp), %eax
	addl $8, %eax
	movl %eax, -156(%ebp)
	movl -156(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -152(%ebp)
	movl -108(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -148(%ebp)
	movl -148(%ebp), %eax
	pushl %eax
	movl -168(%ebp), %eax
	pushl %eax
	movl -152(%ebp), %eax
	call *%eax
	movl %eax, -144(%ebp)
	addl $8, %esp
	leal -504(%ebp), %eax
	movl %eax, -140(%ebp)
	movl -144(%ebp), %eax
	movl %eax, %ecx
	movl -140(%ebp), %eax
	movl %ecx, (%eax)
	movl -172(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -136(%ebp)
	movl -140(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -132(%ebp)
	movl -136(%ebp), %eax
	movl %eax, %ecx
	movl -132(%ebp), %eax
	cmpl %eax, %ecx
	setL -128(%ebp)
	andl $1, -128(%ebp)
	movl -128(%ebp), %eax
	cmpl $0, %eax
	jNE __then1142
	jmp __else1141
__fresh1155:
	jmp __then1142
__then1142:
	movl -96(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -204(%ebp)
	movl -204(%ebp), %eax
	movl %eax, %ecx
	movl -108(%ebp), %eax
	movl %ecx, (%eax)
	jmp __merge1140
__fresh1156:
	jmp __else1141
__else1141:
	jmp __merge1140
__merge1140:
	movl -96(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -212(%ebp)
	movl -212(%ebp), %eax
	movl %eax, -208(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -208(%ebp)
	movl -208(%ebp), %eax
	movl %eax, %ecx
	movl -96(%ebp), %eax
	movl %ecx, (%eax)
	jmp __cond1139
__fresh1157:
	jmp __post1137
__post1137:
	movl -108(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -224(%ebp)
	movl -4(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -220(%ebp)
	movl -224(%ebp), %eax
	movl %eax, %ecx
	movl -220(%ebp), %eax
	cmpl %eax, %ecx
	setNE -216(%ebp)
	andl $1, -216(%ebp)
	movl -216(%ebp), %eax
	cmpl $0, %eax
	jNE __then1145
	jmp __else1144
__fresh1158:
	jmp __then1145
__then1145:
	movl -60(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -344(%ebp)
	movl -344(%ebp), %eax
	addl $0, %eax
	movl %eax, -340(%ebp)
	movl -340(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -336(%ebp)
	movl -336(%ebp), %eax
	addl $8, %eax
	movl %eax, -332(%ebp)
	movl -332(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -328(%ebp)
	movl -108(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -324(%ebp)
	movl -324(%ebp), %eax
	pushl %eax
	movl -344(%ebp), %eax
	pushl %eax
	movl -328(%ebp), %eax
	call *%eax
	movl %eax, -320(%ebp)
	addl $8, %esp
	leal -516(%ebp), %eax
	movl %eax, -316(%ebp)
	movl -320(%ebp), %eax
	movl %eax, %ecx
	movl -316(%ebp), %eax
	movl %ecx, (%eax)
	movl -60(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -312(%ebp)
	movl -312(%ebp), %eax
	addl $0, %eax
	movl %eax, -308(%ebp)
	movl -308(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -304(%ebp)
	movl -304(%ebp), %eax
	addl $8, %eax
	movl %eax, -300(%ebp)
	movl -300(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -296(%ebp)
	movl -4(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -292(%ebp)
	movl -292(%ebp), %eax
	pushl %eax
	movl -312(%ebp), %eax
	pushl %eax
	movl -296(%ebp), %eax
	call *%eax
	movl %eax, -288(%ebp)
	addl $8, %esp
	leal -512(%ebp), %eax
	movl %eax, -284(%ebp)
	movl -288(%ebp), %eax
	movl %eax, %ecx
	movl -284(%ebp), %eax
	movl %ecx, (%eax)
	movl -60(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -280(%ebp)
	movl -280(%ebp), %eax
	addl $0, %eax
	movl %eax, -276(%ebp)
	movl -276(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -272(%ebp)
	movl -272(%ebp), %eax
	addl $12, %eax
	movl %eax, -268(%ebp)
	movl -268(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -264(%ebp)
	movl -316(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -260(%ebp)
	movl -4(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -256(%ebp)
	movl -260(%ebp), %eax
	pushl %eax
	movl -256(%ebp), %eax
	pushl %eax
	movl -280(%ebp), %eax
	pushl %eax
	movl -264(%ebp), %eax
	call *%eax
	addl $12, %esp
	movl -60(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -252(%ebp)
	movl -252(%ebp), %eax
	addl $0, %eax
	movl %eax, -248(%ebp)
	movl -248(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -244(%ebp)
	movl -244(%ebp), %eax
	addl $12, %eax
	movl %eax, -240(%ebp)
	movl -240(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -236(%ebp)
	movl -284(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -232(%ebp)
	movl -108(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -228(%ebp)
	movl -232(%ebp), %eax
	pushl %eax
	movl -228(%ebp), %eax
	pushl %eax
	movl -252(%ebp), %eax
	pushl %eax
	movl -236(%ebp), %eax
	call *%eax
	addl $12, %esp
	jmp __merge1143
__fresh1159:
	jmp __else1144
__else1144:
	jmp __merge1143
__merge1143:
	movl -4(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -352(%ebp)
	movl -352(%ebp), %eax
	movl %eax, -348(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -348(%ebp)
	movl -348(%ebp), %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	jmp __cond1136
__fresh1160:
	jmp __post1134
__post1134:
	leal -520(%ebp), %eax
	movl %eax, -356(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	movl -356(%ebp), %eax
	movl %ecx, (%eax)
	jmp __cond1148
__cond1148:
	movl -356(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -368(%ebp)
	movl -56(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -364(%ebp)
	movl -368(%ebp), %eax
	movl %eax, %ecx
	movl -364(%ebp), %eax
	cmpl %eax, %ecx
	setL -360(%ebp)
	andl $1, -360(%ebp)
	movl -360(%ebp), %eax
	cmpl $0, %eax
	jNE __body1147
	jmp __post1146
__fresh1161:
	jmp __body1147
__body1147:
	movl -60(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -448(%ebp)
	movl -448(%ebp), %eax
	addl $0, %eax
	movl %eax, -444(%ebp)
	movl -444(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -440(%ebp)
	movl -440(%ebp), %eax
	addl $8, %eax
	movl %eax, -436(%ebp)
	movl -436(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -432(%ebp)
	movl -356(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -428(%ebp)
	movl -428(%ebp), %eax
	pushl %eax
	movl -448(%ebp), %eax
	pushl %eax
	movl -432(%ebp), %eax
	call *%eax
	movl %eax, -424(%ebp)
	addl $8, %esp
	leal -528(%ebp), %eax
	movl %eax, -420(%ebp)
	movl -424(%ebp), %eax
	movl %eax, %ecx
	movl -420(%ebp), %eax
	movl %ecx, (%eax)
	movl -60(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -416(%ebp)
	movl -416(%ebp), %eax
	addl $0, %eax
	movl %eax, -412(%ebp)
	movl -412(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -408(%ebp)
	movl -408(%ebp), %eax
	addl $8, %eax
	movl %eax, -404(%ebp)
	movl -404(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -400(%ebp)
	movl -356(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -396(%ebp)
	movl -396(%ebp), %eax
	movl %eax, -392(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -392(%ebp)
	movl -392(%ebp), %eax
	pushl %eax
	movl -416(%ebp), %eax
	pushl %eax
	movl -400(%ebp), %eax
	call *%eax
	movl %eax, -388(%ebp)
	addl $8, %esp
	leal -524(%ebp), %eax
	movl %eax, -384(%ebp)
	movl -388(%ebp), %eax
	movl %eax, %ecx
	movl -384(%ebp), %eax
	movl %ecx, (%eax)
	movl -420(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -380(%ebp)
	movl -384(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -376(%ebp)
	movl -380(%ebp), %eax
	movl %eax, %ecx
	movl -376(%ebp), %eax
	cmpl %eax, %ecx
	setG -372(%ebp)
	andl $1, -372(%ebp)
	movl -372(%ebp), %eax
	cmpl $0, %eax
	jNE __then1151
	jmp __else1150
__fresh1162:
	jmp __then1151
__then1151:
	movl -52(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -456(%ebp)
	movl -456(%ebp), %eax
	movl %eax, -452(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -452(%ebp)
	movl -452(%ebp), %eax
	movl %eax, %ecx
	movl -52(%ebp), %eax
	movl %ecx, (%eax)
	jmp __merge1149
__fresh1163:
	jmp __else1150
__else1150:
	jmp __merge1149
__merge1149:
	movl -356(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -464(%ebp)
	movl -464(%ebp), %eax
	movl %eax, -460(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -460(%ebp)
	movl -460(%ebp), %eax
	movl %eax, %ecx
	movl -356(%ebp), %eax
	movl %ecx, (%eax)
	jmp __cond1148
__fresh1164:
	jmp __post1146
__post1146:
	movl -52(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -468(%ebp)
	movl -468(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Array_getLength
__Array_getLength:
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
__fresh1133:
	movl 8(%ebp), %eax
	addl $8, %eax
	movl %eax, -8(%ebp)
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Array_addElement
__Array_addElement:
	pushl %ebp
	movl %esp, %ebp
	subl $160, %esp
__fresh1124:
	leal -148(%ebp), %eax
	movl %eax, -16(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -16(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $8, %eax
	movl %eax, -12(%ebp)
	movl -12(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -8(%ebp)
	movl -8(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setE -4(%ebp)
	andl $1, -4(%ebp)
	movl -4(%ebp), %eax
	cmpl $0, %eax
	jNE __then1123
	jmp __else1122
__fresh1125:
	jmp __then1123
__then1123:
	movl 8(%ebp), %eax
	addl $12, %eax
	movl %eax, -36(%ebp)
	movl -16(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -32(%ebp)
	movl $16, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -28(%ebp)
	addl $4, %esp
	movl -28(%ebp), %eax
	movl %eax, -24(%ebp)
	movl -32(%ebp), %eax
	pushl %eax
	movl -24(%ebp), %eax
	pushl %eax
	call __ArrayItem_ctor
	movl %eax, -20(%ebp)
	addl $8, %esp
	movl -20(%ebp), %eax
	movl %eax, %ecx
	movl -36(%ebp), %eax
	movl %ecx, (%eax)
	jmp __merge1121
__fresh1126:
	jmp __else1122
__else1122:
	movl 8(%ebp), %eax
	addl $12, %eax
	movl %eax, -52(%ebp)
	movl -52(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -48(%ebp)
	leal -152(%ebp), %eax
	movl %eax, -44(%ebp)
	movl -48(%ebp), %eax
	movl %eax, %ecx
	movl -44(%ebp), %eax
	movl %ecx, (%eax)
	movl -48(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setNE -40(%ebp)
	andl $1, -40(%ebp)
	movl -40(%ebp), %eax
	cmpl $0, %eax
	jNE __then1120
	jmp __else1119
__fresh1127:
	jmp __then1120
__then1120:
	leal -156(%ebp), %eax
	movl %eax, -56(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	movl -56(%ebp), %eax
	movl %ecx, (%eax)
	jmp __cond1114
__cond1114:
	movl -56(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -72(%ebp)
	movl 8(%ebp), %eax
	addl $8, %eax
	movl %eax, -68(%ebp)
	movl -68(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -64(%ebp)
	movl -72(%ebp), %eax
	movl %eax, %ecx
	movl -64(%ebp), %eax
	cmpl %eax, %ecx
	setNE -60(%ebp)
	andl $1, -60(%ebp)
	movl -60(%ebp), %eax
	cmpl $0, %eax
	jNE __body1113
	jmp __post1112
__fresh1128:
	jmp __body1113
__body1113:
	movl -44(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -92(%ebp)
	movl -92(%ebp), %eax
	addl $12, %eax
	movl %eax, -88(%ebp)
	movl -88(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -84(%ebp)
	leal -160(%ebp), %eax
	movl %eax, -80(%ebp)
	movl -84(%ebp), %eax
	movl %eax, %ecx
	movl -80(%ebp), %eax
	movl %ecx, (%eax)
	movl -84(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setNE -76(%ebp)
	andl $1, -76(%ebp)
	movl -76(%ebp), %eax
	cmpl $0, %eax
	jNE __then1117
	jmp __else1116
__fresh1129:
	jmp __then1117
__then1117:
	movl -80(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -96(%ebp)
	movl -96(%ebp), %eax
	movl %eax, %ecx
	movl -44(%ebp), %eax
	movl %ecx, (%eax)
	jmp __merge1115
__fresh1130:
	jmp __else1116
__else1116:
	jmp __merge1115
__merge1115:
	movl -56(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -104(%ebp)
	movl -104(%ebp), %eax
	movl %eax, -100(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -100(%ebp)
	movl -100(%ebp), %eax
	movl %eax, %ecx
	movl -56(%ebp), %eax
	movl %ecx, (%eax)
	jmp __cond1114
__fresh1131:
	jmp __post1112
__post1112:
	movl -44(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -128(%ebp)
	movl -128(%ebp), %eax
	addl $12, %eax
	movl %eax, -124(%ebp)
	movl -16(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -120(%ebp)
	movl $16, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -116(%ebp)
	addl $4, %esp
	movl -116(%ebp), %eax
	movl %eax, -112(%ebp)
	movl -120(%ebp), %eax
	pushl %eax
	movl -112(%ebp), %eax
	pushl %eax
	call __ArrayItem_ctor
	movl %eax, -108(%ebp)
	addl $8, %esp
	movl -108(%ebp), %eax
	movl %eax, %ecx
	movl -124(%ebp), %eax
	movl %ecx, (%eax)
	jmp __merge1118
__fresh1132:
	jmp __else1119
__else1119:
	jmp __merge1118
__merge1118:
	jmp __merge1121
__merge1121:
	movl 8(%ebp), %eax
	addl $8, %eax
	movl %eax, -144(%ebp)
	movl 8(%ebp), %eax
	addl $8, %eax
	movl %eax, -140(%ebp)
	movl -140(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -136(%ebp)
	movl -136(%ebp), %eax
	movl %eax, -132(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -132(%ebp)
	movl -132(%ebp), %eax
	movl %eax, %ecx
	movl -144(%ebp), %eax
	movl %ecx, (%eax)
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Array_setElement
__Array_setElement:
	pushl %ebp
	movl %esp, %ebp
	subl $104, %esp
__fresh1105:
	leal -96(%ebp), %eax
	movl %eax, -24(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -24(%ebp), %eax
	movl %ecx, (%eax)
	leal -92(%ebp), %eax
	movl %eax, -20(%ebp)
	movl 16(%ebp), %eax
	movl %eax, %ecx
	movl -20(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $12, %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -12(%ebp)
	leal -88(%ebp), %eax
	movl %eax, -8(%ebp)
	movl -12(%ebp), %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl -12(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setNE -4(%ebp)
	andl $1, -4(%ebp)
	movl -4(%ebp), %eax
	cmpl $0, %eax
	jNE __then1104
	jmp __else1103
__fresh1106:
	jmp __then1104
__then1104:
	leal -100(%ebp), %eax
	movl %eax, -28(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	jmp __cond1098
__cond1098:
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -40(%ebp)
	movl -24(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -36(%ebp)
	movl -40(%ebp), %eax
	movl %eax, %ecx
	movl -36(%ebp), %eax
	cmpl %eax, %ecx
	setNE -32(%ebp)
	andl $1, -32(%ebp)
	movl -32(%ebp), %eax
	cmpl $0, %eax
	jNE __body1097
	jmp __post1096
__fresh1107:
	jmp __body1097
__body1097:
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -60(%ebp)
	movl -60(%ebp), %eax
	addl $12, %eax
	movl %eax, -56(%ebp)
	movl -56(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -52(%ebp)
	leal -104(%ebp), %eax
	movl %eax, -48(%ebp)
	movl -52(%ebp), %eax
	movl %eax, %ecx
	movl -48(%ebp), %eax
	movl %ecx, (%eax)
	movl -52(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setNE -44(%ebp)
	andl $1, -44(%ebp)
	movl -44(%ebp), %eax
	cmpl $0, %eax
	jNE __then1101
	jmp __else1100
__fresh1108:
	jmp __then1101
__then1101:
	movl -48(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -64(%ebp)
	movl -64(%ebp), %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	jmp __merge1099
__fresh1109:
	jmp __else1100
__else1100:
	jmp __merge1099
__merge1099:
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -72(%ebp)
	movl -72(%ebp), %eax
	movl %eax, -68(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -68(%ebp)
	movl -68(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	jmp __cond1098
__fresh1110:
	jmp __post1096
__post1096:
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -84(%ebp)
	movl -84(%ebp), %eax
	addl $8, %eax
	movl %eax, -80(%ebp)
	movl -20(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -76(%ebp)
	movl -76(%ebp), %eax
	movl %eax, %ecx
	movl -80(%ebp), %eax
	movl %ecx, (%eax)
	jmp __merge1102
__fresh1111:
	jmp __else1103
__else1103:
	movl $__const_str633, %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl $-1, %eax
	pushl %eax
	call _oat_abort
	addl $4, %esp
	jmp __merge1102
__merge1102:
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Array_getElement
__Array_getElement:
	pushl %ebp
	movl %esp, %ebp
	subl $108, %esp
__fresh1089:
	leal -100(%ebp), %eax
	movl %eax, -24(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -24(%ebp), %eax
	movl %ecx, (%eax)
	leal -96(%ebp), %eax
	movl %eax, -20(%ebp)
	movl $0, %eax
	movl %eax, %ecx
	movl -20(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $12, %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -12(%ebp)
	leal -92(%ebp), %eax
	movl %eax, -8(%ebp)
	movl -12(%ebp), %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl -12(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setNE -4(%ebp)
	andl $1, -4(%ebp)
	movl -4(%ebp), %eax
	cmpl $0, %eax
	jNE __then1088
	jmp __else1087
__fresh1090:
	jmp __then1088
__then1088:
	leal -104(%ebp), %eax
	movl %eax, -28(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	jmp __cond1082
__cond1082:
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -40(%ebp)
	movl -24(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -36(%ebp)
	movl -40(%ebp), %eax
	movl %eax, %ecx
	movl -36(%ebp), %eax
	cmpl %eax, %ecx
	setNE -32(%ebp)
	andl $1, -32(%ebp)
	movl -32(%ebp), %eax
	cmpl $0, %eax
	jNE __body1081
	jmp __post1080
__fresh1091:
	jmp __body1081
__body1081:
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -60(%ebp)
	movl -60(%ebp), %eax
	addl $12, %eax
	movl %eax, -56(%ebp)
	movl -56(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -52(%ebp)
	leal -108(%ebp), %eax
	movl %eax, -48(%ebp)
	movl -52(%ebp), %eax
	movl %eax, %ecx
	movl -48(%ebp), %eax
	movl %ecx, (%eax)
	movl -52(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setNE -44(%ebp)
	andl $1, -44(%ebp)
	movl -44(%ebp), %eax
	cmpl $0, %eax
	jNE __then1085
	jmp __else1084
__fresh1092:
	jmp __then1085
__then1085:
	movl -48(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -64(%ebp)
	movl -64(%ebp), %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	jmp __merge1083
__fresh1093:
	jmp __else1084
__else1084:
	jmp __merge1083
__merge1083:
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -72(%ebp)
	movl -72(%ebp), %eax
	movl %eax, -68(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -68(%ebp)
	movl -68(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	jmp __cond1082
__fresh1094:
	jmp __post1080
__post1080:
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -84(%ebp)
	movl -84(%ebp), %eax
	addl $8, %eax
	movl %eax, -80(%ebp)
	movl -80(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -76(%ebp)
	movl -76(%ebp), %eax
	movl %eax, %ecx
	movl -20(%ebp), %eax
	movl %ecx, (%eax)
	jmp __merge1086
__fresh1095:
	jmp __else1087
__else1087:
	movl $__const_str632, %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl $-1, %eax
	pushl %eax
	call _oat_abort
	addl $4, %esp
	jmp __merge1086
__merge1086:
	movl -20(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -88(%ebp)
	movl -88(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Array_ctor
__Array_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $20, %esp
__fresh1079:
	movl 8(%ebp), %eax
	movl %eax, -20(%ebp)
	movl -20(%ebp), %eax
	pushl %eax
	call __Object_ctor
	movl %eax, -16(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -12(%ebp)
	movl $__const_str631, %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -8(%ebp)
	movl $__Array_vtable628, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $8, %eax
	movl %eax, -4(%ebp)
	movl $0, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __ArrayItem_set
__ArrayItem_set:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh1078:
	leal -16(%ebp), %eax
	movl %eax, -12(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $8, %eax
	movl %eax, -8(%ebp)
	movl -12(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl %ebp, %esp
	popl %ebp
	ret
.globl __ArrayItem_ctor
__ArrayItem_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $40, %esp
__fresh1077:
	leal -40(%ebp), %eax
	movl %eax, -36(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -36(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %eax, -32(%ebp)
	movl -32(%ebp), %eax
	pushl %eax
	call __Object_ctor
	movl %eax, -28(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -24(%ebp)
	movl $__const_str630, %eax
	movl %eax, %ecx
	movl -24(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -20(%ebp)
	movl $__ArrayItem_vtable627, %eax
	movl %eax, %ecx
	movl -20(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $8, %eax
	movl %eax, -16(%ebp)
	movl -36(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -12(%ebp)
	movl -12(%ebp), %eax
	movl %eax, %ecx
	movl -16(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $12, %eax
	movl %eax, -8(%ebp)
	movl $0, %eax
	movl %eax, -4(%ebp)
	movl -4(%ebp), %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
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
__fresh1076:
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
__fresh1075:
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str629, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__Object_vtable626, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
