.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VectorMin__FPfPfPf
/* 23120 00123020 0000AFD8 */  lqc2       $vf15, 0x0($5)
/* 23124 00123024 0000D0D8 */  lqc2       $vf16, 0x0($6)
/* 23128 00123028 AF7CF04B */  vmini.xyzw $vf18, $vf15, $vf16
/* 2312C 0012302C 000092F8 */  sqc2       $vf18, 0x0($4)
/* 23130 00123030 0800E003 */  jr         $31
/* 23134 00123034 00000000 */   nop
/* 23138 00123038 00000000 */  nop
/* 2313C 0012303C 00000000 */  nop
