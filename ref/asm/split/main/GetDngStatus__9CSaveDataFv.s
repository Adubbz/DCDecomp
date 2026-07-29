.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetDngStatus__9CSaveDataFv
/* 0582E0 001581E0 0C548224 */  addiu       $2, $4, 0x540C
/* 0582E4 001581E4 0800E003 */  jr          $31
/* 0582E8 001581E8 00000000 */   nop
/* 0582EC 001581EC 00000000 */  nop
