.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_50
/* 19F8F0 0029F7F0 25640000 */ .word 0x00006425
/* 19F8F4 0029F7F4 00000000 */ .word 0x00000000
