.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BattleManualDraw__Fv
/* 10B290 0020B190 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 10B294 0020B194 0000BF7F */  sq         $31, 0x0($sp)
/* 10B298 0020B198 34D3080C */  jal        MenuManualDraw__Fv
/* 10B29C 0020B19C 00000000 */   nop
/* 10B2A0 0020B1A0 0000BF7B */  lq         $31, 0x0($sp)
/* 10B2A4 0020B1A4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 10B2A8 0020B1A8 0800E003 */  jr         $31
/* 10B2AC 0020B1AC 00000000 */   nop
