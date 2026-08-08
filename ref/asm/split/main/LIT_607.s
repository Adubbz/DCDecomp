.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_607
/* 19A258 0029A158 6C696768 */ .word 0x6867696C
/* 19A25C 0029A15C 746C696E */ .word 0x6E696C74
/* 19A260 0029A160 67000000 */ .word 0x00000067
/* 19A264 0029A164 00000000 */ .word 0x00000000
