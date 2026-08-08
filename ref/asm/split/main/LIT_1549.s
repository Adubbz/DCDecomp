.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1549
/* 19B9F0 0029B8F0 53544F4E */ .word 0x4E4F5453
/* 19B9F4 0029B8F4 45000000 */ .word 0x00000045
