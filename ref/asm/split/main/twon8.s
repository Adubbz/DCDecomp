.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel twon8
/* 198A20 00298920 0000803B */ .word 0x3B800000
/* 198A24 00298924 00000000 */ .word 0x00000000
