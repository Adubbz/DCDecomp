.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel test__FPPv
/* 742D0 001741D0 0000828C */  lw         $2, 0x0($4)
/* 742D4 001741D4 0000428C */  lw         $2, 0x0($2)
/* 742D8 001741D8 0800E003 */  jr         $31
/* 742DC 001741DC 00000000 */   nop
