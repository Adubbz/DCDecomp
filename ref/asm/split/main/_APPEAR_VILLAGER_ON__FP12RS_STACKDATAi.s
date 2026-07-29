.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _APPEAR_VILLAGER_ON__FP12RS_STACKDATAi
/* 08D310 0018D210 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08D314 0018D214 0000BF7F */  sq          $31, 0x0($29)
/* 08D318 0018D218 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08D31C 0018D21C 00000000 */   nop
/* 08D320 0018D220 28264070 */  paddub      $4, $2, $0
/* 08D324 0018D224 01000524 */  addiu       $5, $0, 0x1
/* 08D328 0018D228 AC15060C */  jal         EdVillagerAppearOn__Fii
/* 08D32C 0018D22C 00000000 */   nop
/* 08D330 0018D230 01000224 */  addiu       $2, $0, 0x1
/* 08D334 0018D234 0000BF7B */  lq          $31, 0x0($29)
/* 08D338 0018D238 1000BD27 */  addiu       $29, $29, 0x10
/* 08D33C 0018D23C 0800E003 */  jr          $31
/* 08D340 0018D240 00000000 */   nop
/* 08D344 0018D244 00000000 */  nop
/* 08D348 0018D248 00000000 */  nop
/* 08D34C 0018D24C 00000000 */  nop
