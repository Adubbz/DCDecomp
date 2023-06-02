.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _APPEAR_VILLAGER_MOVE__FP12RS_STACKDATAi
/* 8D410 0018D310 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8D414 0018D314 2000BF7F */  sq         $31, 0x20($sp)
/* 8D418 0018D318 1000B17F */  sq         $17, 0x10($sp)
/* 8D41C 0018D31C 0000B07F */  sq         $16, 0x0($sp)
/* 8D420 0018D320 08009124 */  addiu      $17, $4, 0x8
/* 8D424 0018D324 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8D428 0018D328 00000000 */   nop
/* 8D42C 0018D32C 28864070 */  paddub     $16, $2, $0
/* 8D430 0018D330 28262072 */  paddub     $4, $17, $0
/* 8D434 0018D334 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8D438 0018D338 00000000 */   nop
/* 8D43C 0018D33C 28260072 */  paddub     $4, $16, $0
/* 8D440 0018D340 282E4070 */  paddub     $5, $2, $0
/* 8D444 0018D344 01000624 */  addiu      $6, $0, 0x1
/* 8D448 0018D348 C815060C */  jal        EdVillagerAppearMove__Fiii
/* 8D44C 0018D34C 00000000 */   nop
/* 8D450 0018D350 01000224 */  addiu      $2, $0, 0x1
/* 8D454 0018D354 2000BF7B */  lq         $31, 0x20($sp)
/* 8D458 0018D358 1000B17B */  lq         $17, 0x10($sp)
/* 8D45C 0018D35C 0000B07B */  lq         $16, 0x0($sp)
/* 8D460 0018D360 3000BD27 */  addiu      $sp, $sp, 0x30
/* 8D464 0018D364 0800E003 */  jr         $31
/* 8D468 0018D368 00000000 */   nop
/* 8D46C 0018D36C 00000000 */  nop
