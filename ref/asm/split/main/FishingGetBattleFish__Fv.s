.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FishingGetBattleFish__Fv
/* 0A98A0 001A97A0 7093828F */  lw          $2, -0x6C90($28)
/* 0A98A4 001A97A4 0800E003 */  jr          $31
/* 0A98A8 001A97A8 00000000 */   nop
/* 0A98AC 001A97AC 00000000 */  nop
