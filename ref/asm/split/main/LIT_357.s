.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_357
/* 19A7C0 0029A6C0 54494D45 */ .word 0x454D4954
/* 19A7C4 0029A6C4 5F544142 */ .word 0x4241545F
/* 19A7C8 0029A6C8 4C455F4E */ .word 0x4E5F454C
/* 19A7CC 0029A6CC 4F000000 */ .word 0x0000004F
