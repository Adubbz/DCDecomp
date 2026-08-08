.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_435
/* 19A3A0 0029A2A0 73686164 */ .word 0x64616873
/* 19A3A4 0029A2A4 6F775F62 */ .word 0x625F776F
/* 19A3A8 0029A2A8 75666600 */ .word GlobalDataBuffer + 0x3BB5F5
/* 19A3AC 0029A2AC 00000000 */ .word 0x00000000
