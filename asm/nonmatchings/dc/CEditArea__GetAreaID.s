.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetAreaID__9CEditAreaFv
/* 70200 00170100 0000828C */  lw         $2, 0x0($4)
/* 70204 00170104 0800E003 */  jr         $31
/* 70208 00170108 00000000 */   nop
/* 7020C 0017010C 00000000 */  nop
