.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ObjAnimeAllStart__Fv
/* 065DF0 00165CF0 8C8E80AF */  sw          $0, -0x7174($28)
/* 065DF4 00165CF4 0800E003 */  jr          $31
/* 065DF8 00165CF8 00000000 */   nop
/* 065DFC 00165CFC 00000000 */  nop
