.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel now_loading_off__Fv
/* 540B0 00153FB0 01000324 */  addiu      $3, $0, 0x1
/* 540B4 00153FB4 E48D83AF */  sw         $3, -0x721C($gp)
/* 540B8 00153FB8 0800E003 */  jr         $31
/* 540BC 00153FBC 00000000 */   nop
