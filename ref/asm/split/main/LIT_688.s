.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_688
/* 19B158 0029B058 65000000 */ .word 0x00000065
/* 19B15C 0029B05C 00000000 */ .word 0x00000000
