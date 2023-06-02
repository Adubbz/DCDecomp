.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VectorMaxMin__FPfPfPfPfPfPf
/* 231C0 001230C0 0000CFD8 */  lqc2       $vf15, 0x0($6)
/* 231C4 001230C4 0000F0D8 */  lqc2       $vf16, 0x0($7)
/* 231C8 001230C8 000011D9 */  lqc2       $vf17, 0x0($8)
/* 231CC 001230CC 000032D9 */  lqc2       $vf18, 0x0($9)
/* 231D0 001230D0 2B7DF04B */  vmax.xyzw  $vf20, $vf15, $vf16
/* 231D4 001230D4 6F7DF04B */  vmini.xyzw $vf21, $vf15, $vf16
/* 231D8 001230D8 2BA5F14B */  vmax.xyzw  $vf20, $vf20, $vf17
/* 231DC 001230DC 6FADF14B */  vmini.xyzw $vf21, $vf21, $vf17
/* 231E0 001230E0 2BA5F24B */  vmax.xyzw  $vf20, $vf20, $vf18
/* 231E4 001230E4 6FADF24B */  vmini.xyzw $vf21, $vf21, $vf18
/* 231E8 001230E8 000094F8 */  sqc2       $vf20, 0x0($4)
/* 231EC 001230EC 0000B5F8 */  sqc2       $vf21, 0x0($5)
/* 231F0 001230F0 0800E003 */  jr         $31
/* 231F4 001230F4 00000000 */   nop
/* 231F8 001230F8 00000000 */  nop
/* 231FC 001230FC 00000000 */  nop
