.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_418
/* 198F88 00298E88 46524545 */ .word 0x45455246
/* 198F8C 00298E8C 2025342E */ .word 0x2E342520
/* 198F90 00298E90 31662525 */ .word 0x25256631
/* 198F94 00298E94 0A000000 */ .word 0x0000000A
