.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ObjAnimeAllStop__Fv
/* 65DE0 00165CE0 01000324 */  addiu      $3, $0, 0x1
/* 65DE4 00165CE4 8C8E83AF */  sw         $3, -0x7174($gp)
/* 65DE8 00165CE8 0800E003 */  jr         $31
/* 65DEC 00165CEC 00000000 */   nop
