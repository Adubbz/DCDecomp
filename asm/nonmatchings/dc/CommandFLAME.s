.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandFLAME__FPPv
/* 76A80 00176980 0800E003 */  jr         $31
/* 76A84 00176984 00000000 */   nop
/* 76A88 00176988 00000000 */  nop
/* 76A8C 0017698C 00000000 */  nop
