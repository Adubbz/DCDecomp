.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel clear_now_loading_vsync_end__Fv
/* 054050 00153F50 E88D80AF */  sw          $0, -0x7218($28)
/* 054054 00153F54 0800E003 */  jr          $31
/* 054058 00153F58 00000000 */   nop
/* 05405C 00153F5C 00000000 */  nop
