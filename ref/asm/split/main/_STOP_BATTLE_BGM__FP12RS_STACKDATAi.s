.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _STOP_BATTLE_BGM__FP12RS_STACKDATAi
/* 0BD5F0 001BD4F0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BD5F4 001BD4F4 0000BF7F */  sq          $31, 0x0($29)
/* 0BD5F8 001BD4F8 90DD060C */  jal         BtBattleMusic_Stop__Fv
/* 0BD5FC 001BD4FC 00000000 */   nop
/* 0BD600 001BD500 01000224 */  addiu       $2, $0, 0x1
/* 0BD604 001BD504 0000BF7B */  lq          $31, 0x0($29)
/* 0BD608 001BD508 1000BD27 */  addiu       $29, $29, 0x10
/* 0BD60C 001BD50C 0800E003 */  jr          $31
/* 0BD610 001BD510 00000000 */   nop
/* 0BD614 001BD514 00000000 */  nop
/* 0BD618 001BD518 00000000 */  nop
/* 0BD61C 001BD51C 00000000 */  nop
