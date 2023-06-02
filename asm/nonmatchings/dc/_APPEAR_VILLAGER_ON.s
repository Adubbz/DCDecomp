.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _APPEAR_VILLAGER_ON__FP12RS_STACKDATAi
/* 8D310 0018D210 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8D314 0018D214 0000BF7F */  sq         $31, 0x0($sp)
/* 8D318 0018D218 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8D31C 0018D21C 00000000 */   nop
/* 8D320 0018D220 28264070 */  paddub     $4, $2, $0
/* 8D324 0018D224 01000524 */  addiu      $5, $0, 0x1
/* 8D328 0018D228 AC15060C */  jal        EdVillagerAppearOn__Fii
/* 8D32C 0018D22C 00000000 */   nop
/* 8D330 0018D230 01000224 */  addiu      $2, $0, 0x1
/* 8D334 0018D234 0000BF7B */  lq         $31, 0x0($sp)
/* 8D338 0018D238 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8D33C 0018D23C 0800E003 */  jr         $31
/* 8D340 0018D240 00000000 */   nop
/* 8D344 0018D244 00000000 */  nop
/* 8D348 0018D248 00000000 */  nop
/* 8D34C 0018D24C 00000000 */  nop
