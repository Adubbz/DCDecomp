.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_883
/* 19A9D8 0029A8D8 44454C41 */ .word 0x414C4544
/* 19A9DC 0029A8DC 59000000 */ .word 0x00000059
