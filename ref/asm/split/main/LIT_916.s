.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_916
/* 19D050 0029CF50 494E4954 */ .word 0x54494E49
/* 19D054 0029CF54 20424545 */ .word 0x45454220
/* 19D058 0029CF58 20454E44 */ .word 0x444E4520
/* 19D05C 0029CF5C 21210A00 */ .word 0x000A2121
