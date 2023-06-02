.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel ApplyMatrixN__FPA4_fPA4_fPA4_fi
/* 238E0 001237E0 FFFFE720 */  addi       $7, $7, -0x1 # handwritten instruction
/* 238E4 001237E4 0000AAD8 */  lqc2       $vf10, 0x0($5)
/* 238E8 001237E8 1000ABD8 */  lqc2       $vf11, 0x10($5)
/* 238EC 001237EC 2000ACD8 */  lqc2       $vf12, 0x20($5)
/* 238F0 001237F0 3000ADD8 */  lqc2       $vf13, 0x30($5)
/* 238F4 001237F4 0000D0D8 */  lqc2       $vf16, 0x0($6)
/* 238F8 001237F8 FF02004A */  vnop
/* 238FC 001237FC FF02004A */  vnop
/* 23900 00123800 FF02004A */  vnop
.L00123804:
/* 23904 00123804 BC51F04B */  vmulax.xyzw ACC, $vf10, $vf16x
/* 23908 00123808 BD58F04B */  vmadday.xyzw ACC, $vf11, $vf16y
/* 2390C 0012380C BE60F04B */  vmaddaz.xyzw ACC, $vf12, $vf16z
/* 23910 00123810 4B6CF04B */  vmaddw.xyzw $vf17, $vf13, $vf16w
/* 23914 00123814 FFFFE720 */  addi       $7, $7, -0x1 # handwritten instruction
/* 23918 00123818 10008420 */  addi       $4, $4, 0x10 # handwritten instruction
/* 2391C 0012381C 1000C620 */  addi       $6, $6, 0x10 # handwritten instruction
/* 23920 00123820 F0FF91F8 */  sqc2       $vf17, -0x10($4)
/* 23924 00123824 0000D0D8 */  lqc2       $vf16, 0x0($6)
/* 23928 00123828 FF02004A */  vnop
/* 2392C 0012382C F5FFE104 */  bgez       $7, .L00123804
/* 23930 00123830 00000000 */   nop
/* 23934 00123834 00000000 */  nop
/* 23938 00123838 0800E003 */  jr         $31
/* 2393C 0012383C 00000000 */   nop
