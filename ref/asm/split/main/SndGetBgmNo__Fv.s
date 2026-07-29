.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndGetBgmNo__Fv
/* 059E10 00159D10 048E828F */  lw          $2, -0x71FC($28)
/* 059E14 00159D14 0800E003 */  jr          $31
/* 059E18 00159D18 00000000 */   nop
/* 059E1C 00159D1C 00000000 */  nop
