.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdDrawOffAll__Fv
/* 78220 00178120 01000324 */  addiu      $3, $0, 0x1
/* 78224 00178124 6C9083AF */  sw         $3, -0x6F94($gp)
/* 78228 00178128 0800E003 */  jr         $31
/* 7822C 0017812C 00000000 */   nop
