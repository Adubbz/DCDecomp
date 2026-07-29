.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __malloc_lock
/* 003728 00103628 0800E003 */  jr          $31
/* 00372C 0010362C 00000000 */   nop
