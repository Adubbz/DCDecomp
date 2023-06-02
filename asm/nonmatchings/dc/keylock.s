.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel keylock__Fv
/* 69AE0 001699E0 F48E828F */  lw         $2, -0x710C($gp)
/* 69AE4 001699E4 03004230 */  andi       $2, $2, 0x3
/* 69AE8 001699E8 0800E003 */  jr         $31
/* 69AEC 001699EC 00000000 */   nop
