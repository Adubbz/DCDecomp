.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_489__2
/* 19F3E0 0029F2E0 23667261 */ .word 0x61726623
/* 19F3E4 0029F2E4 6D655F69 */ .word 0x695F656D
/* 19F3E8 0029F2E8 6D616765 */ .word 0x6567616D
/* 19F3EC 0029F2EC 31233634 */ .word 0x34362331
/* 19F3F0 0029F2F0 30233434 */ .word 0x34342330
/* 19F3F4 0029F2F4 38233400 */ .word GlobalDataBuffer + 0x972B8
