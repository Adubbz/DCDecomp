.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel VectorMax__FPfPfPfPfPf
/* 0230F0 00122FF0 0000AFD8 */  lqc2        $vf15, 0x0($5)
/* 0230F4 00122FF4 0000D0D8 */  lqc2        $vf16, 0x0($6)
/* 0230F8 00122FF8 0000F1D8 */  lqc2        $vf17, 0x0($7)
/* 0230FC 00122FFC 000012D9 */  lqc2        $vf18, 0x0($8)
/* 023100 00123000 2B7DF04B */  vmax.xyzw   $vf20, $vf15, $vf16
/* 023104 00123004 2BA5F14B */  vmax.xyzw   $vf20, $vf20, $vf17
/* 023108 00123008 2BA5F24B */  vmax.xyzw   $vf20, $vf20, $vf18
/* 02310C 0012300C 000094F8 */  sqc2        $vf20, 0x0($4)
/* 023110 00123010 0800E003 */  jr          $31
/* 023114 00123014 00000000 */   nop
/* 023118 00123018 00000000 */  nop
/* 02311C 0012301C 00000000 */  nop
