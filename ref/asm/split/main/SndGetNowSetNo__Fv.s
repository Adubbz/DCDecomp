.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndGetNowSetNo__Fv
/* 05A540 0015A440 FC8D828F */  lw          $2, -0x7204($28)
/* 05A544 0015A444 0800E003 */  jr          $31
/* 05A548 0015A448 00000000 */   nop
/* 05A54C 0015A44C 00000000 */  nop
