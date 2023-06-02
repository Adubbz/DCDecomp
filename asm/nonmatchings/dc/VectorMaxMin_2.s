.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VectorMaxMin__FPfPfPfPfPf
/* 23190 00123090 0000CFD8 */  lqc2       $vf15, 0x0($6)
/* 23194 00123094 0000F0D8 */  lqc2       $vf16, 0x0($7)
/* 23198 00123098 000011D9 */  lqc2       $vf17, 0x0($8)
/* 2319C 0012309C AB7CF04B */  vmax.xyzw  $vf18, $vf15, $vf16
/* 231A0 001230A0 2F7DF04B */  vmini.xyzw $vf20, $vf15, $vf16
/* 231A4 001230A4 EB94F14B */  vmax.xyzw  $vf19, $vf18, $vf17
/* 231A8 001230A8 6FA5F14B */  vmini.xyzw $vf21, $vf20, $vf17
/* 231AC 001230AC 000093F8 */  sqc2       $vf19, 0x0($4)
/* 231B0 001230B0 0000B5F8 */  sqc2       $vf21, 0x0($5)
/* 231B4 001230B4 0800E003 */  jr         $31
/* 231B8 001230B8 00000000 */   nop
/* 231BC 001230BC 00000000 */  nop
