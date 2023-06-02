.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VectorMax__FPfPfPfPfPf
/* 230F0 00122FF0 0000AFD8 */  lqc2       $vf15, 0x0($5)
/* 230F4 00122FF4 0000D0D8 */  lqc2       $vf16, 0x0($6)
/* 230F8 00122FF8 0000F1D8 */  lqc2       $vf17, 0x0($7)
/* 230FC 00122FFC 000012D9 */  lqc2       $vf18, 0x0($8)
/* 23100 00123000 2B7DF04B */  vmax.xyzw  $vf20, $vf15, $vf16
/* 23104 00123004 2BA5F14B */  vmax.xyzw  $vf20, $vf20, $vf17
/* 23108 00123008 2BA5F24B */  vmax.xyzw  $vf20, $vf20, $vf18
/* 2310C 0012300C 000094F8 */  sqc2       $vf20, 0x0($4)
/* 23110 00123010 0800E003 */  jr         $31
/* 23114 00123014 00000000 */   nop
/* 23118 00123018 00000000 */  nop
/* 2311C 0012301C 00000000 */  nop
