.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel ApplyMatrixN__FPA4_fPA4_fPA4_fi
/* 0238E0 001237E0 FFFFE720 */  addi        $7, $7, -0x1 /* handwritten instruction */
/* 0238E4 001237E4 0000AAD8 */  lqc2        $vf10, 0x0($5)
/* 0238E8 001237E8 1000ABD8 */  lqc2        $vf11, 0x10($5)
/* 0238EC 001237EC 2000ACD8 */  lqc2        $vf12, 0x20($5)
/* 0238F0 001237F0 3000ADD8 */  lqc2        $vf13, 0x30($5)
/* 0238F4 001237F4 0000D0D8 */  lqc2        $vf16, 0x0($6)
/* 0238F8 001237F8 FF02004A */  vnop
/* 0238FC 001237FC FF02004A */  vnop
/* 023900 00123800 FF02004A */  vnop
.L00123804:
/* 023904 00123804 BC51F04B */  vmulax.xyzw $ACC, $vf10, $vf16x
/* 023908 00123808 BD58F04B */  vmadday.xyzw $ACC, $vf11, $vf16y
/* 02390C 0012380C BE60F04B */  vmaddaz.xyzw $ACC, $vf12, $vf16z
/* 023910 00123810 4B6CF04B */  vmaddw.xyzw $vf17, $vf13, $vf16w
/* 023914 00123814 FFFFE720 */  addi        $7, $7, -0x1 /* handwritten instruction */
/* 023918 00123818 10008420 */  addi        $4, $4, 0x10 /* handwritten instruction */
/* 02391C 0012381C 1000C620 */  addi        $6, $6, 0x10 /* handwritten instruction */
/* 023920 00123820 F0FF91F8 */  sqc2        $vf17, -0x10($4)
/* 023924 00123824 0000D0D8 */  lqc2        $vf16, 0x0($6)
/* 023928 00123828 FF02004A */  vnop
/* 02392C 0012382C F5FFE104 */  bgez        $7, .L00123804
/* 023930 00123830 00000000 */   nop
/* 023934 00123834 00000000 */  nop
/* 023938 00123838 0800E003 */  jr          $31
/* 02393C 0012383C 00000000 */   nop
