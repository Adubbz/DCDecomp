.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_333__2
/* 19A028 00299F28 6B616D65 */ .word 0x656D616B
/* 19A02C 00299F2C 00000000 */ .word 0x00000000
