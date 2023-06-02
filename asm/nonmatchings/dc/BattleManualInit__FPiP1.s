.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BattleManualInit__FPiP1
/* 10B170 0020B070 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 10B174 0020B074 0000BF7F */  sq         $31, 0x0($sp)
/* 10B178 0020B078 74CF080C */  jal        InitMenuManual__FPiP1
/* 10B17C 0020B07C 00000000 */   nop
/* 10B180 0020B080 0000BF7B */  lq         $31, 0x0($sp)
/* 10B184 0020B084 1000BD27 */  addiu      $sp, $sp, 0x10
/* 10B188 0020B088 0800E003 */  jr         $31
/* 10B18C 0020B08C 00000000 */   nop
