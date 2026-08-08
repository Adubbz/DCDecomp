.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_298__3
/* 19A1D8 0029A0D8 6C696768 */ .word 0x6867696C
/* 19A1DC 0029A0DC 746C696E */ .word 0x6E696C74
/* 19A1E0 0029A0E0 67000000 */ .word 0x00000067
/* 19A1E4 0029A0E4 00000000 */ .word 0x00000000
