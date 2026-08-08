.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_953
/* 19BD60 0029BC60 6F666673 */ .word 0x7366666F
/* 19BD64 0029BC64 65742025 */ .word 0x25207465
/* 19BD68 0029BC68 640A0000 */ .word 0x00000A64
/* 19BD6C 0029BC6C 00000000 */ .word 0x00000000
