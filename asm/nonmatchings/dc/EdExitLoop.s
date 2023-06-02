.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdExitLoop__Fv
/* 78210 00178110 01000224 */  addiu      $2, $0, 0x1
/* 78214 00178114 8C9082AF */  sw         $2, -0x6F74($gp)
/* 78218 00178118 0800E003 */  jr         $31
/* 7821C 0017811C 00000000 */   nop
