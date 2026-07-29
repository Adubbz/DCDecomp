.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _EB_INTRO_START__FP12RS_STACKDATAi
/* 0968E0 001967E0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0968E4 001967E4 0000BF7F */  sq          $31, 0x0($29)
/* 0968E8 001967E8 80A0050C */  jal         EBInitIntro__Fv
/* 0968EC 001967EC 00000000 */   nop
/* 0968F0 001967F0 01000224 */  addiu       $2, $0, 0x1
/* 0968F4 001967F4 0000BF7B */  lq          $31, 0x0($29)
/* 0968F8 001967F8 1000BD27 */  addiu       $29, $29, 0x10
/* 0968FC 001967FC 0800E003 */  jr          $31
/* 096900 00196800 00000000 */   nop
/* 096904 00196804 00000000 */  nop
/* 096908 00196808 00000000 */  nop
/* 09690C 0019680C 00000000 */  nop
