.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _sceFsDbChk
/* 017D18 00117C18 0800E003 */  jr          $31
/* 017D1C 00117C1C 2D100000 */   daddu      $2, $0, $0
