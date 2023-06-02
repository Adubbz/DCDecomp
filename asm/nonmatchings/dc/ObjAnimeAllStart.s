.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ObjAnimeAllStart__Fv
/* 65DF0 00165CF0 8C8E80AF */  sw         $0, -0x7174($gp)
/* 65DF4 00165CF4 0800E003 */  jr         $31
/* 65DF8 00165CF8 00000000 */   nop
/* 65DFC 00165CFC 00000000 */  nop
