.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1411
/* 19EB18 0029EA18 736F7A61 */ .word 0x617A6F73
/* 19EB1C 0029EA1C 69000000 */ .word 0x00000069
