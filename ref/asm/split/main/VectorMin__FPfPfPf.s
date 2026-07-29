.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel VectorMin__FPfPfPf
/* 023120 00123020 0000AFD8 */  lqc2        $vf15, 0x0($5)
/* 023124 00123024 0000D0D8 */  lqc2        $vf16, 0x0($6)
/* 023128 00123028 AF7CF04B */  vmini.xyzw  $vf18, $vf15, $vf16
/* 02312C 0012302C 000092F8 */  sqc2        $vf18, 0x0($4)
/* 023130 00123030 0800E003 */  jr          $31
/* 023134 00123034 00000000 */   nop
/* 023138 00123038 00000000 */  nop
/* 02313C 0012303C 00000000 */  nop
