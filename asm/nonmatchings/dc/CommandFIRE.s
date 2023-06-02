.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandFIRE__FPPv
/* 76A70 00176970 0800E003 */  jr         $31
/* 76A74 00176974 00000000 */   nop
/* 76A78 00176978 00000000 */  nop
/* 76A7C 0017697C 00000000 */  nop
