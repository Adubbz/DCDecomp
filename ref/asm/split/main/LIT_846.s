.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_846
/* 19F038 0029EF38 64756E6C */ .word 0x6C6E7564
/* 19F03C 0029EF3C 6F672E62 */ .word 0x622E676F
/* 19F040 0029EF40 696E0000 */ .word 0x00006E69
/* 19F044 0029EF44 00000000 */ .word 0x00000000
/* 19F048 0029EF48 00000000 */ .word 0x00000000
/* 19F04C 0029EF4C 00000000 */ .word 0x00000000
