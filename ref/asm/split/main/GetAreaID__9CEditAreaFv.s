.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetAreaID__9CEditAreaFv
/* 070200 00170100 0000828C */  lw          $2, 0x0($4)
/* 070204 00170104 0800E003 */  jr          $31
/* 070208 00170108 00000000 */   nop
/* 07020C 0017010C 00000000 */  nop
