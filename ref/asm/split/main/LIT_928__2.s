.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_928__2
/* 19BD10 0029BC10 64756E2F */ .word 0x2F6E7564
/* 19BD14 0029BC14 6974656D */ .word 0x6D657469
/* 19BD18 0029BC18 2F6D6169 */ .word 0x69616D2F
/* 19BD1C 0029BC1C 6E5F6461 */ .word 0x61645F6E
/* 19BD20 0029BC20 74612F00 */ .word GlobalDataBuffer + 0x4B0F4
/* 19BD24 0029BC24 00000000 */ .word 0x00000000
