.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_865
/* 19BC48 0029BB48 2E6D6F74 */ .word 0x746F6D2E
/* 19BC4C 0029BB4C 00000000 */ .word 0x00000000
