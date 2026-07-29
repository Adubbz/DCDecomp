.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdDrawOffAll__Fv
/* 078220 00178120 01000324 */  addiu       $3, $0, 0x1
/* 078224 00178124 6C9083AF */  sw          $3, -0x6F94($28)
/* 078228 00178128 0800E003 */  jr          $31
/* 07822C 0017812C 00000000 */   nop
