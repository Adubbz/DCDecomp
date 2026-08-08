.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_315
/* 199F98 00299E98 74726565 */ .word 0x65657274
/* 199F9C 00299E9C 31000000 */ .word 0x00000031
