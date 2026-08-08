.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_345__2
/* 19A1B8 0029A0B8 776F726B */ .word 0x6B726F77
/* 19A1BC 0029A0BC 00000000 */ .word 0x00000000
