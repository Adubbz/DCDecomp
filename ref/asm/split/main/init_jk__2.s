.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel init_jk__2
/* 1989D8 002988D8 04000000 */ .word 0x00000004
/* 1989DC 002988DC 07000000 */ .word 0x00000007
/* 1989E0 002988E0 09000000 */ .word 0x00000009
/* 1989E4 002988E4 00000000 */ .word 0x00000000
