.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_329
/* 19A008 00299F08 6F6F6275 */ .word 0x75626F6F
/* 19A00C 00299F0C 00000000 */ .word 0x00000000
