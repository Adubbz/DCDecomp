.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetStockItem__9CSaveDataFv
/* 0582F0 001581F0 B0608224 */  addiu       $2, $4, 0x60B0
/* 0582F4 001581F4 F87F4224 */  addiu       $2, $2, 0x7FF8
/* 0582F8 001581F8 0800E003 */  jr          $31
/* 0582FC 001581FC 00000000 */   nop
