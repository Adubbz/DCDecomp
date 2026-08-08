.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1091
/* 19E948 0029E848 6E6F7420 */ .word 0x20746F6E
/* 19E94C 0029E84C 6C6F6164 */ .word 0x64616F6C
/* 19E950 0029E850 0A000000 */ .word 0x0000000A
/* 19E954 0029E854 00000000 */ .word 0x00000000
