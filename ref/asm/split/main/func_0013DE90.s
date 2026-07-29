.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel func_0013DE90
/* 03DF90 0013DE90 30010224 */  addiu       $2, $0, 0x130
/* 03DF94 0013DE94 0800E003 */  jr          $31
/* 03DF98 0013DE98 00000000 */   nop
/* 03DF9C 0013DE9C 00000000 */  nop
