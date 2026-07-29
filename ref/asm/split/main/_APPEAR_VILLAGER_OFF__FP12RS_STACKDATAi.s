.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _APPEAR_VILLAGER_OFF__FP12RS_STACKDATAi
/* 08D350 0018D250 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08D354 0018D254 0000BF7F */  sq          $31, 0x0($29)
/* 08D358 0018D258 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08D35C 0018D25C 00000000 */   nop
/* 08D360 0018D260 28264070 */  paddub      $4, $2, $0
/* 08D364 0018D264 01000524 */  addiu       $5, $0, 0x1
/* 08D368 0018D268 9015060C */  jal         EdVillagerAppearOff__Fii
/* 08D36C 0018D26C 00000000 */   nop
/* 08D370 0018D270 01000224 */  addiu       $2, $0, 0x1
/* 08D374 0018D274 0000BF7B */  lq          $31, 0x0($29)
/* 08D378 0018D278 1000BD27 */  addiu       $29, $29, 0x10
/* 08D37C 0018D27C 0800E003 */  jr          $31
/* 08D380 0018D280 00000000 */   nop
/* 08D384 0018D284 00000000 */  nop
/* 08D388 0018D288 00000000 */  nop
/* 08D38C 0018D28C 00000000 */  nop
