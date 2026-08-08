.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_223
/* 19A140 0029A040 69660000 */ .word 0x00006669
/* 19A144 0029A044 00000000 */ .word 0x00000000
