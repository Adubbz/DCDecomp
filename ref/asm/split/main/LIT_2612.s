.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2612
/* 19B330 0029B230 20646973 */ .word 0x73696420
/* 19B334 0029B234 74616E63 */ .word 0x636E6174
/* 19B338 0029B238 65203D20 */ .word 0x203D2065
/* 19B33C 0029B23C 25362E32 */ .word 0x322E3625
/* 19B340 0029B240 660A0000 */ .word 0x00000A66
/* 19B344 0029B244 00000000 */ .word 0x00000000
/* 19B348 0029B248 00000000 */ .word 0x00000000
/* 19B34C 0029B24C 00000000 */ .word 0x00000000
