.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1109
/* 19E0F0 0029DFF0 57656170 */ .word 0x70616557
/* 19E0F4 0029DFF4 6F6E4275 */ .word 0x75426E6F
/* 19E0F8 0029DFF8 66666572 */ .word 0x72656666
/* 19E0FC 0029DFFC 2053697A */ .word 0x7A695320
/* 19E100 0029E000 65202020 */ .word 0x20202065
/* 19E104 0029E004 20203D20 */ .word 0x203D2020
/* 19E108 0029E008 25640A00 */ .word 0x000A6425
/* 19E10C 0029E00C 00000000 */ .word 0x00000000
