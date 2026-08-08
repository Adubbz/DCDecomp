.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_989
/* 19DF88 0029DE88 6B616765 */ .word 0x6567616B
/* 19DF8C 0029DE8C 756E6761 */ .word 0x61676E75
/* 19DF90 0029DE90 00000000 */ .word 0x00000000
/* 19DF94 0029DE94 00000000 */ .word 0x00000000
