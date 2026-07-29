.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndGetBgmVol__Fv
/* 059EE0 00159DE0 0C8E828F */  lw          $2, -0x71F4($28)
/* 059EE4 00159DE4 0800E003 */  jr          $31
/* 059EE8 00159DE8 00000000 */   nop
/* 059EEC 00159DEC 00000000 */  nop
