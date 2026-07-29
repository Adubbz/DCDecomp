.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetNowTestNo__Fv
/* 10D2C0 0020D1C0 E888828F */  lw          $2, -0x7718($28)
/* 10D2C4 0020D1C4 0800E003 */  jr          $31
/* 10D2C8 0020D1C8 00000000 */   nop
/* 10D2CC 0020D1CC 00000000 */  nop
