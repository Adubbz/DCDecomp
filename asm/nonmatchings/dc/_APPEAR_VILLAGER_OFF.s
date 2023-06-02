.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _APPEAR_VILLAGER_OFF__FP12RS_STACKDATAi
/* 8D350 0018D250 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8D354 0018D254 0000BF7F */  sq         $31, 0x0($sp)
/* 8D358 0018D258 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8D35C 0018D25C 00000000 */   nop
/* 8D360 0018D260 28264070 */  paddub     $4, $2, $0
/* 8D364 0018D264 01000524 */  addiu      $5, $0, 0x1
/* 8D368 0018D268 9015060C */  jal        EdVillagerAppearOff__Fii
/* 8D36C 0018D26C 00000000 */   nop
/* 8D370 0018D270 01000224 */  addiu      $2, $0, 0x1
/* 8D374 0018D274 0000BF7B */  lq         $31, 0x0($sp)
/* 8D378 0018D278 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8D37C 0018D27C 0800E003 */  jr         $31
/* 8D380 0018D280 00000000 */   nop
/* 8D384 0018D284 00000000 */  nop
/* 8D388 0018D288 00000000 */  nop
/* 8D38C 0018D28C 00000000 */  nop
