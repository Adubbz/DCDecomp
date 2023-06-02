.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Trans_AddCell__FPfPf
/* 60870 00160770 0000B0D8 */  lqc2       $vf16, 0x0($5)
/* 60874 00160774 BC51F04B */  vmulax.xyzw ACC, $vf10, $vf16x
/* 60878 00160778 BD58F04B */  vmadday.xyzw ACC, $vf11, $vf16y
/* 6087C 0016077C BE60F04B */  vmaddaz.xyzw ACC, $vf12, $vf16z
/* 60880 00160780 4B6CF04B */  vmaddw.xyzw $vf17, $vf13, $vf16w
/* 60884 00160784 28844E4B */  vadd.xz    $vf16, $vf16, $vf14
/* 60888 00160788 000091F8 */  sqc2       $vf17, 0x0($4)
/* 6088C 0016078C 0000B0F8 */  sqc2       $vf16, 0x0($5)
/* 60890 00160790 0800E003 */  jr         $31
/* 60894 00160794 00000000 */   nop
/* 60898 00160798 00000000 */  nop
/* 6089C 0016079C 00000000 */  nop
