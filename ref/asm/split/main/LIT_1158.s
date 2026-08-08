.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1158
/* 19C4A0 0029C3A0 4D495353 */ .word 0x5353494D
/* 19C4A4 0029C3A4 20434F4C */ .word 0x4C4F4320
/* 19C4A8 0029C3A8 20444154 */ .word 0x54414420
/* 19C4AC 0029C3AC 41202573 */ .word 0x73252041
/* 19C4B0 0029C3B0 0A000000 */ .word 0x0000000A
/* 19C4B4 0029C3B4 00000000 */ .word 0x00000000
