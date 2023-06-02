.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdViewModeOff__Fv
/* 69E80 00169D80 F08E80AF */  sw         $0, -0x7110($gp)
/* 69E84 00169D84 0800E003 */  jr         $31
/* 69E88 00169D88 00000000 */   nop
/* 69E8C 00169D8C 00000000 */  nop
