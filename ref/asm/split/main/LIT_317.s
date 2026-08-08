.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_317
/* 199FA8 00299EA8 74726565 */ .word 0x65657274
/* 199FAC 00299EAC 33000000 */ .word 0x00000033
