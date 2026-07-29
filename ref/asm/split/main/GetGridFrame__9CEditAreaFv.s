.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetGridFrame__9CEditAreaFv
/* 070220 00170120 2820828C */  lw          $2, 0x2028($4)
/* 070224 00170124 0800E003 */  jr          $31
/* 070228 00170128 00000000 */   nop
/* 07022C 0017012C 00000000 */  nop
