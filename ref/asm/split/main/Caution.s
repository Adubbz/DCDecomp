.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel Caution
/* 19A2C0 0029A1C0 00000000 */ .word 0x00000000
/* 19A2C4 0029A1C4 00000000 */ .word 0x00000000
/* 19A2C8 0029A1C8 00000000 */ .word 0x00000000
/* 19A2CC 0029A1CC 00000000 */ .word 0x00000000
