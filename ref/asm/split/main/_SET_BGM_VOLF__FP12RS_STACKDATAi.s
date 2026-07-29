.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_BGM_VOLF__FP12RS_STACKDATAi
/* 095E80 00195D80 F0FFBD27 */  addiu       $29, $29, -0x10
/* 095E84 00195D84 0000BF7F */  sq          $31, 0x0($29)
/* 095E88 00195D88 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 095E8C 00195D8C 00000000 */   nop
/* 095E90 00195D90 06030046 */  mov.s       $f12, $f0
/* 095E94 00195D94 6467050C */  jal         SndSetBgmVolf__Ff
/* 095E98 00195D98 00000000 */   nop
/* 095E9C 00195D9C 01000224 */  addiu       $2, $0, 0x1
/* 095EA0 00195DA0 0000BF7B */  lq          $31, 0x0($29)
/* 095EA4 00195DA4 1000BD27 */  addiu       $29, $29, 0x10
/* 095EA8 00195DA8 0800E003 */  jr          $31
/* 095EAC 00195DAC 00000000 */   nop
