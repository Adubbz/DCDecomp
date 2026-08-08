.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1180
/* 19D330 0029D230 63686172 */ .word 0x72616863
/* 19D334 0029D234 67652076 */ .word 0x76206567
/* 19D338 0029D238 6F6C203D */ .word 0x3D206C6F
/* 19D33C 0029D23C 2025640A */ .word 0x0A642520
/* 19D340 0029D240 00000000 */ .word 0x00000000
/* 19D344 0029D244 00000000 */ .word 0x00000000
