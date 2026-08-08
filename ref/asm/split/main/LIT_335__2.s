.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_335__2
/* 19A038 00299F38 74756D65 */ .word 0x656D7574
/* 19A03C 00299F3C 00000000 */ .word 0x00000000
