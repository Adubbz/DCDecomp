.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Trans_AddCell__FPfPf
/* 060870 00160770 0000B0D8 */  lqc2        $vf16, 0x0($5)
/* 060874 00160774 BC51F04B */  vmulax.xyzw $ACC, $vf10, $vf16x
/* 060878 00160778 BD58F04B */  vmadday.xyzw $ACC, $vf11, $vf16y
/* 06087C 0016077C BE60F04B */  vmaddaz.xyzw $ACC, $vf12, $vf16z
/* 060880 00160780 4B6CF04B */  vmaddw.xyzw $vf17, $vf13, $vf16w
/* 060884 00160784 28844E4B */  vadd.xz     $vf16, $vf16, $vf14
/* 060888 00160788 000091F8 */  sqc2        $vf17, 0x0($4)
/* 06088C 0016078C 0000B0F8 */  sqc2        $vf16, 0x0($5)
/* 060890 00160790 0800E003 */  jr          $31
/* 060894 00160794 00000000 */   nop
/* 060898 00160798 00000000 */  nop
/* 06089C 0016079C 00000000 */  nop
