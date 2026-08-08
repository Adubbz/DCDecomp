.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_224
/* 19A148 0029A048 69660A00 */ .word 0x000A6669
/* 19A14C 0029A04C 00000000 */ .word 0x00000000
