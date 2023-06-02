.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VectorMaxMin__FPfPfPfPf
/* 23170 00123070 0000CFD8 */  lqc2       $vf15, 0x0($6)
/* 23174 00123074 0000F0D8 */  lqc2       $vf16, 0x0($7)
/* 23178 00123078 AB7CF04B */  vmax.xyzw  $vf18, $vf15, $vf16
/* 2317C 0012307C 2F7DF04B */  vmini.xyzw $vf20, $vf15, $vf16
/* 23180 00123080 000092F8 */  sqc2       $vf18, 0x0($4)
/* 23184 00123084 0000B4F8 */  sqc2       $vf20, 0x0($5)
/* 23188 00123088 0800E003 */  jr         $31
/* 2318C 0012308C 00000000 */   nop
