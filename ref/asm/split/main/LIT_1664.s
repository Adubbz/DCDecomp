.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1664
/* 19EB80 0029EA80 23667261 */ .word 0x61726623
/* 19EB84 0029EA84 6D655F69 */ .word 0x695F656D
/* 19EB88 0029EA88 6D616765 */ .word 0x6567616D
/* 19EB8C 0029EA8C 33233634 */ .word 0x34362333
/* 19EB90 0029EA90 30233434 */ .word 0x34342330
/* 19EB94 0029EA94 38233400 */ .word GlobalDataBuffer + 0x972B8
/* 19EB98 0029EA98 00000000 */ .word 0x00000000
/* 19EB9C 0029EA9C 00000000 */ .word 0x00000000
