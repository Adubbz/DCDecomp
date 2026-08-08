.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_648
/* 199018 00298F18 25642A2A */ .word 0x2A2A6425
/* 19901C 00298F1C 2A2A2A2A */ .word 0x2A2A2A2A
/* 199020 00298F20 2A0A0000 */ .word 0x00000A2A
/* 199024 00298F24 00000000 */ .word 0x00000000
