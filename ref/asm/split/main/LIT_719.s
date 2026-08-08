.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_719
/* 19AA70 0029A970 2F000000 */ .word 0x0000002F
/* 19AA74 0029A974 00000000 */ .word 0x00000000
