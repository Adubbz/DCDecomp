.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Initialize__7CVisualFv
/* 034C50 00134B50 000080AC */  sw          $0, 0x0($4)
/* 034C54 00134B54 040080AC */  sw          $0, 0x4($4)
/* 034C58 00134B58 0800E003 */  jr          $31
/* 034C5C 00134B5C 00000000 */   nop
