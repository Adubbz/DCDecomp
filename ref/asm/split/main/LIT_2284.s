.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2284
/* 19BF70 0029BE70 73616665 */ .word 0x65666173
/* 19BF74 0029BE74 4E756D20 */ .word 0x206D754E
/* 19BF78 0029BE78 3D202564 */ .word 0x6425203D
/* 19BF7C 0029BE7C 2C206573 */ .word 0x7365202C
/* 19BF80 0029BE80 63617065 */ .word 0x65706163
/* 19BF84 0029BE84 436E7420 */ .word 0x20746E43
/* 19BF88 0029BE88 3D202564 */ .word 0x6425203D
/* 19BF8C 0029BE8C 0A000000 */ .word 0x0000000A
