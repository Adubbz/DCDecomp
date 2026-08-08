.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_768
/* 19C390 0029C290 23626C65 */ .word 0x656C6223
/* 19C394 0029C294 6E646572 */ .word 0x7265646E
/* 19C398 0029C298 23363430 */ .word 0x30343623
/* 19C39C 0029C29C 23323234 */ .word 0x34323223
/* 19C3A0 0029C2A0 23340000 */ .word 0x00003423
/* 19C3A4 0029C2A4 00000000 */ .word 0x00000000
