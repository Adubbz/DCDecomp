.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel vu_maxmin3__FPfPfPfPfPf
/* 024DF0 00124CF0 0000CFD8 */  lqc2        $vf15, 0x0($6)
/* 024DF4 00124CF4 0000F0D8 */  lqc2        $vf16, 0x0($7)
/* 024DF8 00124CF8 000011D9 */  lqc2        $vf17, 0x0($8)
/* 024DFC 00124CFC AB7CF04B */  vmax.xyzw   $vf18, $vf15, $vf16
/* 024E00 00124D00 2F7DF04B */  vmini.xyzw  $vf20, $vf15, $vf16
/* 024E04 00124D04 EB94F14B */  vmax.xyzw   $vf19, $vf18, $vf17
/* 024E08 00124D08 6FA5F14B */  vmini.xyzw  $vf21, $vf20, $vf17
/* 024E0C 00124D0C 000093F8 */  sqc2        $vf19, 0x0($4)
/* 024E10 00124D10 0000B5F8 */  sqc2        $vf21, 0x0($5)
/* 024E14 00124D14 0800E003 */  jr          $31
/* 024E18 00124D18 00000000 */   nop
/* 024E1C 00124D1C 00000000 */  nop
