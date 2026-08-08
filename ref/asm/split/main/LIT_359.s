.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_359
/* 19A7E0 0029A6E0 54494D45 */ .word 0x454D4954
/* 19A7E4 0029A6E4 5F53544F */ .word 0x4F54535F
/* 19A7E8 0029A6E8 50000000 */ .word 0x00000050
/* 19A7EC 0029A6EC 00000000 */ .word 0x00000000
