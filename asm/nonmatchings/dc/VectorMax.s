.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VectorMax__FPfPfPf
/* 230B0 00122FB0 0000AFD8 */  lqc2       $vf15, 0x0($5)
/* 230B4 00122FB4 0000D0D8 */  lqc2       $vf16, 0x0($6)
/* 230B8 00122FB8 AB7CF04B */  vmax.xyzw  $vf18, $vf15, $vf16
/* 230BC 00122FBC 000092F8 */  sqc2       $vf18, 0x0($4)
/* 230C0 00122FC0 0800E003 */  jr         $31
/* 230C4 00122FC4 00000000 */   nop
/* 230C8 00122FC8 00000000 */  nop
/* 230CC 00122FCC 00000000 */  nop
