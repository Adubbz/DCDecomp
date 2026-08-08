.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel zero__5
/* 198948 00298848 00000000 */ .word 0x00000000
/* 19894C 0029884C 00000000 */ .word 0x00000000
