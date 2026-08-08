.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_920__2
/* 19BCF8 0029BBF8 30256400 */ .word GlobalDataBuffer + 0x3974B0
/* 19BCFC 0029BBFC 00000000 */ .word 0x00000000
