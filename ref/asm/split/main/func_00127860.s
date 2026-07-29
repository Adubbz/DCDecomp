.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel func_00127860
/* 027960 00127860 28160070 */  paddub      $2, $0, $0
/* 027964 00127864 0800E003 */  jr          $31
/* 027968 00127868 00000000 */   nop
/* 02796C 0012786C 00000000 */  nop
