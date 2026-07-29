.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Skip__8CScFaderFv
/* 029530 01DD5230 80000324 */  addiu       $3, $0, 0x80
/* 029534 01DD5234 000083AC */  sw          $3, 0x0($4)
/* 029538 01DD5238 0800E003 */  jr          $31
/* 02953C 01DD523C 00000000 */   nop
