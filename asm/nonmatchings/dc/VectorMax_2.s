.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VectorMax__FPfPfPfPf
/* 230D0 00122FD0 0000AFD8 */  lqc2       $vf15, 0x0($5)
/* 230D4 00122FD4 0000D0D8 */  lqc2       $vf16, 0x0($6)
/* 230D8 00122FD8 0000F1D8 */  lqc2       $vf17, 0x0($7)
/* 230DC 00122FDC AB7CF04B */  vmax.xyzw  $vf18, $vf15, $vf16
/* 230E0 00122FE0 EB94F14B */  vmax.xyzw  $vf19, $vf18, $vf17
/* 230E4 00122FE4 000093F8 */  sqc2       $vf19, 0x0($4)
/* 230E8 00122FE8 0800E003 */  jr         $31
/* 230EC 00122FEC 00000000 */   nop
