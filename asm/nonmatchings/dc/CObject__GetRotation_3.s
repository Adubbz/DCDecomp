.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetRotation__7CObjectFv
/* 57080 00156F80 60008224 */  addiu      $2, $4, 0x60
/* 57084 00156F84 0800E003 */  jr         $31
/* 57088 00156F88 00000000 */   nop
/* 5708C 00156F8C 00000000 */  nop
