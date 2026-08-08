.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_358__2
/* 19A7D0 0029A6D0 54494D45 */ .word 0x454D4954
/* 19A7D4 0029A6D4 5F544142 */ .word 0x4241545F
/* 19A7D8 0029A6D8 4C450000 */ .word 0x0000454C
/* 19A7DC 0029A6DC 00000000 */ .word 0x00000000
