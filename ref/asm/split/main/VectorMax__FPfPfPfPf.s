.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel VectorMax__FPfPfPfPf
/* 0230D0 00122FD0 0000AFD8 */  lqc2        $vf15, 0x0($5)
/* 0230D4 00122FD4 0000D0D8 */  lqc2        $vf16, 0x0($6)
/* 0230D8 00122FD8 0000F1D8 */  lqc2        $vf17, 0x0($7)
/* 0230DC 00122FDC AB7CF04B */  vmax.xyzw   $vf18, $vf15, $vf16
/* 0230E0 00122FE0 EB94F14B */  vmax.xyzw   $vf19, $vf18, $vf17
/* 0230E4 00122FE4 000093F8 */  sqc2        $vf19, 0x0($4)
/* 0230E8 00122FE8 0800E003 */  jr          $31
/* 0230EC 00122FEC 00000000 */   nop
