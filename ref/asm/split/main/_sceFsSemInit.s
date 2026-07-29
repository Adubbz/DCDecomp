.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _sceFsSemInit
/* 017D08 00117C08 0800E003 */  jr          $31
/* 017D0C 00117C0C 00000000 */   nop
