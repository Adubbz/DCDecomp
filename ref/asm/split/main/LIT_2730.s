.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2730
/* 19EC70 0029EB70 6D63696E */ .word 0x6E69636D
/* 19EC74 0029EB74 666F2069 */ .word 0x69206F66
/* 19EC78 0029EB78 73204E55 */ .word 0x554E2073
/* 19EC7C 0029EB7C 4C4C0A00 */ .word 0x000A4C4C
