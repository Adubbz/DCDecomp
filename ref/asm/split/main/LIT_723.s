.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_723
/* 199000 00298F00 66697820 */ .word 0x20786966
/* 199004 00298F04 74657874 */ .word 0x74786574
/* 199008 00298F08 75726520 */ .word 0x20657275
/* 19900C 00298F0C 6F766572 */ .word 0x7265766F
/* 199010 00298F10 21210A00 */ .word 0x000A2121
/* 199014 00298F14 00000000 */ .word 0x00000000
