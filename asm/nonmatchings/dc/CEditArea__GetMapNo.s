.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMapNo__9CEditAreaFv
/* 701F0 001700F0 0400828C */  lw         $2, 0x4($4)
/* 701F4 001700F4 0800E003 */  jr         $31
/* 701F8 001700F8 00000000 */   nop
/* 701FC 001700FC 00000000 */  nop
