.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_187
/* 199280 00299180 53495A45 */ .word 0x455A4953
/* 199284 00299184 00000000 */ .word 0x00000000
