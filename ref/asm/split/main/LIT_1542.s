.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1542
/* 19B9C8 0029B8C8 4F464600 */ .word GlobalDataBuffer + 0x1B95CF
/* 19B9CC 0029B8CC 00000000 */ .word 0x00000000
