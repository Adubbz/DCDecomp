.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_262
/* 199D80 00299C80 7475626F */ .word 0x6F627574
/* 199D84 00299C84 00000000 */ .word 0x00000000
