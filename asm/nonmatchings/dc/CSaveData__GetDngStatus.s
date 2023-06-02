.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetDngStatus__9CSaveDataFv
/* 582E0 001581E0 0C548224 */  addiu      $2, $4, 0x540C
/* 582E4 001581E4 0800E003 */  jr         $31
/* 582E8 001581E8 00000000 */   nop
/* 582EC 001581EC 00000000 */  nop
