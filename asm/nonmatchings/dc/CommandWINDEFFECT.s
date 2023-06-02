.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandWINDEFFECT__FPPv
/* 3FE00 0013FD00 0000838C */  lw         $3, 0x0($4)
/* 3FE04 0013FD04 000060C4 */  lwc1       $f0, 0x0($3)
/* 3FE08 0013FD08 0C8D838F */  lw         $3, -0x72F4($gp)
/* 3FE0C 0013FD0C 540060E4 */  swc1       $f0, 0x54($3)
/* 3FE10 0013FD10 0800E003 */  jr         $31
/* 3FE14 0013FD14 00000000 */   nop
/* 3FE18 0013FD18 00000000 */  nop
/* 3FE1C 0013FD1C 00000000 */  nop
