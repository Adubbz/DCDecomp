.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel twon24
/* 198960 00298860 00000000 */ .word 0x00000000
/* 198964 00298864 0000703E */ .word 0x3E700000
