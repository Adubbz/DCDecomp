.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _STOP_BATTLE_BGM__FP12RS_STACKDATAi
/* BD5F0 001BD4F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BD5F4 001BD4F4 0000BF7F */  sq         $31, 0x0($sp)
/* BD5F8 001BD4F8 90DD060C */  jal        BtBattleMusic_Stop__Fv
/* BD5FC 001BD4FC 00000000 */   nop
/* BD600 001BD500 01000224 */  addiu      $2, $0, 0x1
/* BD604 001BD504 0000BF7B */  lq         $31, 0x0($sp)
/* BD608 001BD508 1000BD27 */  addiu      $sp, $sp, 0x10
/* BD60C 001BD50C 0800E003 */  jr         $31
/* BD610 001BD510 00000000 */   nop
/* BD614 001BD514 00000000 */  nop
/* BD618 001BD518 00000000 */  nop
/* BD61C 001BD51C 00000000 */  nop
