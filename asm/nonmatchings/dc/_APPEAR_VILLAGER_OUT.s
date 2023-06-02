.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _APPEAR_VILLAGER_OUT__FP12RS_STACKDATAi
/* 8D390 0018D290 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8D394 0018D294 0000BF7F */  sq         $31, 0x0($sp)
/* 8D398 0018D298 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8D39C 0018D29C 00000000 */   nop
/* 8D3A0 0018D2A0 28264070 */  paddub     $4, $2, $0
/* 8D3A4 0018D2A4 01000524 */  addiu      $5, $0, 0x1
/* 8D3A8 0018D2A8 5815060C */  jal        EdVillagerAppearOut__Fii
/* 8D3AC 0018D2AC 00000000 */   nop
/* 8D3B0 0018D2B0 01000224 */  addiu      $2, $0, 0x1
/* 8D3B4 0018D2B4 0000BF7B */  lq         $31, 0x0($sp)
/* 8D3B8 0018D2B8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8D3BC 0018D2BC 0800E003 */  jr         $31
/* 8D3C0 0018D2C0 00000000 */   nop
/* 8D3C4 0018D2C4 00000000 */  nop
/* 8D3C8 0018D2C8 00000000 */  nop
/* 8D3CC 0018D2CC 00000000 */  nop
