.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdSetKeyMode__Fi
/* 698F0 001697F0 248784AF */  sw         $4, -0x78DC($gp)
/* 698F4 001697F4 28168070 */  paddub     $2, $4, $0
/* 698F8 001697F8 0800E003 */  jr         $31
/* 698FC 001697FC 00000000 */   nop
