.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetUnitSize__9CEditAreaFv
/* 70300 00170200 200080C4 */  lwc1       $f0, 0x20($4)
/* 70304 00170204 0800E003 */  jr         $31
/* 70308 00170208 00000000 */   nop
/* 7030C 0017020C 00000000 */  nop
