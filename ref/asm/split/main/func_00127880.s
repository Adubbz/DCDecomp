.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel func_00127880
/* 027980 00127880 28160070 */  paddub      $2, $0, $0
/* 027984 00127884 0800E003 */  jr          $31
/* 027988 00127888 00000000 */   nop
/* 02798C 0012788C 00000000 */  nop
