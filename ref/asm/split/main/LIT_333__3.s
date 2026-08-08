.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_333__3
/* 19A178 0029A078 2E6D6573 */ .word 0x73656D2E
/* 19A17C 0029A07C 00000000 */ .word 0x00000000
