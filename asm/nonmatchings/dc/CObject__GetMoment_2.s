.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMoment__7CObjectFv
/* 57070 00156F70 50008224 */  addiu      $2, $4, 0x50
/* 57074 00156F74 0800E003 */  jr         $31
/* 57078 00156F78 00000000 */   nop
/* 5707C 00156F7C 00000000 */  nop
