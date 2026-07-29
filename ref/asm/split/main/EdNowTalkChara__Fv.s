.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdNowTalkChara__Fv
/* 099170 00199070 7492828F */  lw          $2, -0x6D8C($28)
/* 099174 00199074 0800E003 */  jr          $31
/* 099178 00199078 00000000 */   nop
/* 09917C 0019907C 00000000 */  nop
