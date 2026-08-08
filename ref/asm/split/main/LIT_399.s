.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_399
/* 19A380 0029A280 25732025 */ .word 0x25207325
/* 19A384 0029A284 372E3266 */ .word 0x66322E37
/* 19A388 0029A288 2C25372E */ .word 0x2E37252C
/* 19A38C 0029A28C 32662C25 */ .word 0x252C6632
/* 19A390 0029A290 372E3266 */ .word 0x66322E37
/* 19A394 0029A294 0A000000 */ .word 0x0000000A
