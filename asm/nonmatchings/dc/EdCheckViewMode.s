.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdCheckViewMode__Fv
/* 6A220 0016A120 F08E828F */  lw         $2, -0x7110($gp)
/* 6A224 0016A124 0800E003 */  jr         $31
/* 6A228 0016A128 00000000 */   nop
/* 6A22C 0016A12C 00000000 */  nop
