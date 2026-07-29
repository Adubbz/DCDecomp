.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _sceFsSigSema
/* 017D20 00117C20 0800E003 */  jr          $31
/* 017D24 00117C24 00000000 */   nop
