.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndGetNowSetNo__Fv
/* 5A540 0015A440 FC8D828F */  lw         $2, -0x7204($gp)
/* 5A544 0015A444 0800E003 */  jr         $31
/* 5A548 0015A448 00000000 */   nop
/* 5A54C 0015A44C 00000000 */  nop
