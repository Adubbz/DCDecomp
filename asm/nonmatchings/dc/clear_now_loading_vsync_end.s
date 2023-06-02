.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel clear_now_loading_vsync_end__Fv
/* 54050 00153F50 E88D80AF */  sw         $0, -0x7218($gp)
/* 54054 00153F54 0800E003 */  jr         $31
/* 54058 00153F58 00000000 */   nop
/* 5405C 00153F5C 00000000 */  nop
