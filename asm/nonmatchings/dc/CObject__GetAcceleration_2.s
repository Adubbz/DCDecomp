.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetAcceleration__7CObjectFv
/* 57050 00156F50 30008224 */  addiu      $2, $4, 0x30
/* 57054 00156F54 0800E003 */  jr         $31
/* 57058 00156F58 00000000 */   nop
/* 5705C 00156F5C 00000000 */  nop
