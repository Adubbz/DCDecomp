.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel func_00127840
/* 027940 00127840 28160070 */  paddub      $2, $0, $0
/* 027944 00127844 0800E003 */  jr          $31
/* 027948 00127848 00000000 */   nop
/* 02794C 0012784C 00000000 */  nop
