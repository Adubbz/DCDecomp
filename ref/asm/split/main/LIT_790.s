.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_790
/* 19D2B0 0029D1B0 77657069 */ .word 0x69706577
/* 19D2B4 0029D1B4 636F6E00 */ .word GlobalDataBuffer + 0x43BEE3
