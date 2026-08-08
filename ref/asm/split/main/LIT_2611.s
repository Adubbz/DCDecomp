.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2611
/* 19B310 0029B210 20686569 */ .word 0x69656820
/* 19B314 0029B214 67687420 */ .word 0x20746867
/* 19B318 0029B218 3D202536 */ .word 0x3625203D
/* 19B31C 0029B21C 2E32660A */ .word 0x0A66322E
/* 19B320 0029B220 00000000 */ .word 0x00000000
/* 19B324 0029B224 00000000 */ .word 0x00000000
/* 19B328 0029B228 00000000 */ .word 0x00000000
/* 19B32C 0029B22C 00000000 */ .word 0x00000000
