.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandBRIGHT__FPPv
/* 76A90 00176990 0800E003 */  jr         $31
/* 76A94 00176994 00000000 */   nop
/* 76A98 00176998 00000000 */  nop
/* 76A9C 0017699C 00000000 */  nop
