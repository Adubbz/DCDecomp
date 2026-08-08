.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_308
/* 198FA0 00298EA0 54657874 */ .word 0x74786554
/* 198FA4 00298EA4 75726520 */ .word 0x20657275
/* 198FA8 00298EA8 4F766572 */ .word 0x7265764F
/* 198FAC 00298EAC 21210A00 */ .word 0x000A2121
