.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1559
/* 19BF48 0029BE48 6C696768 */ .word 0x6867696C
/* 19BF4C 0029BE4C 746C696E */ .word 0x6E696C74
/* 19BF50 0029BE50 67000000 */ .word 0x00000067
/* 19BF54 0029BE54 00000000 */ .word 0x00000000
