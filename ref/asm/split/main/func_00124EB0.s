.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel func_00124EB0
/* 024FB0 00124EB0 28160070 */  paddub      $2, $0, $0
/* 024FB4 00124EB4 0800E003 */  jr          $31
/* 024FB8 00124EB8 00000000 */   nop
/* 024FBC 00124EBC 00000000 */  nop
