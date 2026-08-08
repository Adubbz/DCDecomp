.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_473
/* 199980 00299880 73000000 */ .word 0x00000073
/* 199984 00299884 00000000 */ .word 0x00000000
