.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_316
/* 199FA0 00299EA0 74726565 */ .word 0x65657274
/* 199FA4 00299EA4 32000000 */ .word 0x00000032
