.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_362
/* 19A080 00299F80 2E636667 */ .word 0x6766632E
/* 19A084 00299F84 00000000 */ .word 0x00000000
/* 19A088 00299F88 00000000 */ .word 0x00000000
/* 19A08C 00299F8C 00000000 */ .word 0x00000000
