.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_810
/* 19C3B8 0029C2B8 25730A00 */ .word 0x000A7325
/* 19C3BC 0029C2BC 00000000 */ .word 0x00000000
