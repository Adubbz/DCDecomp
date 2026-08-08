.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_789__2
/* 19D2A8 0029D1A8 70657262 */ .word 0x62726570
/* 19D2AC 0029D1AC 72640000 */ .word 0x00006472
