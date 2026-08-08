.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_478
/* 19A8C8 0029A7C8 7363656E */ .word 0x6E656373
/* 19A8CC 0029A7CC 652E7363 */ .word 0x63732E65
/* 19A8D0 0029A7D0 6E000000 */ .word 0x0000006E
/* 19A8D4 0029A7D4 00000000 */ .word 0x00000000
