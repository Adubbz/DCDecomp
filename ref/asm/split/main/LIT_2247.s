.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2247
/* 19D960 0029D860 6B616765 */ .word 0x6567616B
/* 19D964 0029D864 72756279 */ .word 0x79627572
/* 19D968 0029D868 00000000 */ .word 0x00000000
/* 19D96C 0029D86C 00000000 */ .word 0x00000000
