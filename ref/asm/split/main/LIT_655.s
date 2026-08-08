.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_655
/* 19C318 0029C218 4F464600 */ .word GlobalDataBuffer + 0x1B95CF
/* 19C31C 0029C21C 00000000 */ .word 0x00000000
