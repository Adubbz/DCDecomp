.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1400
/* 19B450 0029B350 63666700 */ .word GlobalDataBuffer + 0x3CB5E3
/* 19B454 0029B354 00000000 */ .word 0x00000000
