.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _sceFsIntrSigSema
/* 017D28 00117C28 0800E003 */  jr          $31
/* 017D2C 00117C2C 00000000 */   nop
