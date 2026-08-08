.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_325__3
/* 19A638 0029A538 534B595F */ .word 0x5F594B53
/* 19A63C 0029A53C 494D4700 */ .word GlobalDataBuffer + 0x1C9CC9
