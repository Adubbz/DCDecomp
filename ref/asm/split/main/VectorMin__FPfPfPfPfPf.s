.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel VectorMin__FPfPfPfPfPf
/* 023140 00123040 0000AFD8 */  lqc2        $vf15, 0x0($5)
/* 023144 00123044 0000D0D8 */  lqc2        $vf16, 0x0($6)
/* 023148 00123048 0000F1D8 */  lqc2        $vf17, 0x0($7)
/* 02314C 0012304C 000012D9 */  lqc2        $vf18, 0x0($8)
/* 023150 00123050 2F7DF04B */  vmini.xyzw  $vf20, $vf15, $vf16
/* 023154 00123054 2FA5F14B */  vmini.xyzw  $vf20, $vf20, $vf17
/* 023158 00123058 2FA5F24B */  vmini.xyzw  $vf20, $vf20, $vf18
/* 02315C 0012305C 000094F8 */  sqc2        $vf20, 0x0($4)
/* 023160 00123060 0800E003 */  jr          $31
/* 023164 00123064 00000000 */   nop
/* 023168 00123068 00000000 */  nop
/* 02316C 0012306C 00000000 */  nop
