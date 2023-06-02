.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetGridFrame__9CEditAreaFv
/* 70220 00170120 2820828C */  lw         $2, 0x2028($4)
/* 70224 00170124 0800E003 */  jr         $31
/* 70228 00170128 00000000 */   nop
/* 7022C 0017012C 00000000 */  nop
