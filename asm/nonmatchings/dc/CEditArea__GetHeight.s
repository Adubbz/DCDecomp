.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetHeight__9CEditAreaFv
/* 70280 00170180 0C00828C */  lw         $2, 0xC($4)
/* 70284 00170184 0800E003 */  jr         $31
/* 70288 00170188 00000000 */   nop
/* 7028C 0017018C 00000000 */  nop
