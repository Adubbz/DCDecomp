.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SaveMenuKeyCopy__Fv
/* 122360 00222260 01000224 */  addiu      $2, $0, 0x1
/* 122364 00222264 0800E003 */  jr         $31
/* 122368 00222268 00000000 */   nop
/* 12236C 0022226C 00000000 */  nop
