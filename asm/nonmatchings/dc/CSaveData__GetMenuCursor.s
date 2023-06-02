.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMenuCursor__9CSaveDataFv
/* 57C40 00157B40 50068224 */  addiu      $2, $4, 0x650
/* 57C44 00157B44 0800E003 */  jr         $31
/* 57C48 00157B48 00000000 */   nop
/* 57C4C 00157B4C 00000000 */  nop
