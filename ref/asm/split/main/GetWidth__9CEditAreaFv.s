.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetWidth__9CEditAreaFv
/* 070270 00170170 0800828C */  lw          $2, 0x8($4)
/* 070274 00170174 0800E003 */  jr          $31
/* 070278 00170178 00000000 */   nop
/* 07027C 0017017C 00000000 */  nop
