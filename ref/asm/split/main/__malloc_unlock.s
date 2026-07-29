.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __malloc_unlock
/* 003730 00103630 0800E003 */  jr          $31
/* 003734 00103634 00000000 */   nop
