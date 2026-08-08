.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1032
/* 19DFF0 0029DEF0 77657069 */ .word 0x69706577
/* 19DFF4 0029DEF4 636F6E00 */ .word GlobalDataBuffer + 0x43BEE3
