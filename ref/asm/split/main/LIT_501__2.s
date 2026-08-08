.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_501__2
/* 19A8E0 0029A7E0 25732573 */ .word 0x73257325
/* 19A8E4 0029A7E4 00000000 */ .word 0x00000000
