.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_847
/* 19F050 0029EF50 74657820 */ .word 0x20786574
/* 19F054 0029EF54 656E7465 */ .word 0x65746E65
/* 19F058 0029EF58 7220656E */ .word 0x6E652072
/* 19F05C 0029EF5C 64200A00 */ .word 0x000A2064
