.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _sceFsSemExit
/* 017D10 00117C10 0800E003 */  jr          $31
/* 017D14 00117C14 00000000 */   nop
