.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1034__2
/* 19E000 0029DF00 77256400 */ .word GlobalDataBuffer + 0x3974F7
/* 19E004 0029DF04 00000000 */ .word 0x00000000
