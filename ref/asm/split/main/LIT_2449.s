.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2449
/* 19B270 0029B170 21204341 */ .word 0x41432021
/* 19B274 0029B174 4D455241 */ .word 0x4152454D
/* 19B278 0029B178 20504F53 */ .word 0x534F5020
/* 19B27C 0029B17C 0A000000 */ .word 0x0000000A
