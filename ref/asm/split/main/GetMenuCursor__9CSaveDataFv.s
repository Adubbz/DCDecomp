.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetMenuCursor__9CSaveDataFv
/* 057C40 00157B40 50068224 */  addiu       $2, $4, 0x650
/* 057C44 00157B44 0800E003 */  jr          $31
/* 057C48 00157B48 00000000 */   nop
/* 057C4C 00157B4C 00000000 */  nop
