.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandPEOPLE__FPPv_2
/* 9FFC0 0019FEC0 0800E003 */  jr         $31
/* 9FFC4 0019FEC4 00000000 */   nop
/* 9FFC8 0019FEC8 00000000 */  nop
/* 9FFCC 0019FECC 00000000 */  nop
