.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_773
/* 199A30 00299930 4D494449 */ .word 0x4944494D
/* 199A34 00299934 20737461 */ .word 0x61747320
/* 199A38 00299938 72742120 */ .word 0x20217472
/* 199A3C 0029993C 706F7274 */ .word 0x74726F70
/* 199A40 00299940 3D256420 */ .word 0x2064253D
/* 199A44 00299944 0A000000 */ .word 0x0000000A
/* 199A48 00299948 00000000 */ .word 0x00000000
/* 199A4C 0029994C 00000000 */ .word 0x00000000
