.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceSifGetDataTable
/* 016650 00116550 2A00023C */  lui         $2, %hi(_data_table)
/* 016654 00116554 0800E003 */  jr          $31
/* 016658 00116558 18594224 */   addiu      $2, $2, %lo(_data_table)
/* 01665C 0011655C 00000000 */  nop
