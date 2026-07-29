.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetHeight__9CEditAreaFv
/* 070280 00170180 0C00828C */  lw          $2, 0xC($4)
/* 070284 00170184 0800E003 */  jr          $31
/* 070288 00170188 00000000 */   nop
/* 07028C 0017018C 00000000 */  nop
