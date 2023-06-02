.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetStockItem__9CSaveDataFv
/* 582F0 001581F0 B0608224 */  addiu      $2, $4, 0x60B0
/* 582F4 001581F4 F87F4224 */  addiu      $2, $2, 0x7FF8
/* 582F8 001581F8 0800E003 */  jr         $31
/* 582FC 001581FC 00000000 */   nop
