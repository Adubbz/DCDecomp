.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdViewModeOff__Fv
/* 069E80 00169D80 F08E80AF */  sw          $0, -0x7110($28)
/* 069E84 00169D84 0800E003 */  jr          $31
/* 069E88 00169D88 00000000 */   nop
/* 069E8C 00169D8C 00000000 */  nop
