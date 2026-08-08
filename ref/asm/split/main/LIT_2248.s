.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2248
/* 19D970 0029D870 6B616765 */ .word 0x6567616B
/* 19D974 0029D874 756E6761 */ .word 0x61676E75
/* 19D978 0029D878 00000000 */ .word 0x00000000
/* 19D97C 0029D87C 00000000 */ .word 0x00000000
