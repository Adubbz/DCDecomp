.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1301
/* 19F070 0029EF70 23667261 */ .word 0x61726623
/* 19F074 0029EF74 6D655F69 */ .word 0x695F656D
/* 19F078 0029EF78 6D616765 */ .word 0x6567616D
/* 19F07C 0029EF7C 23363430 */ .word 0x30343623
/* 19F080 0029EF80 23343438 */ .word 0x38343423
/* 19F084 0029EF84 23340000 */ .word 0x00003423
