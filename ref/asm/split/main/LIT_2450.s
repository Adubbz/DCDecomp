.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2450
/* 19B280 0029B180 23204341 */ .word 0x41432023
/* 19B284 0029B184 4D455241 */ .word 0x4152454D
/* 19B288 0029B188 20524546 */ .word 0x46455220
/* 19B28C 0029B18C 0A000000 */ .word 0x0000000A
