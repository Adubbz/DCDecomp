.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1594
/* 19B490 0029B390 464F4700 */ .word GlobalDataBuffer + 0x1C9EC6
/* 19B494 0029B394 00000000 */ .word 0x00000000
