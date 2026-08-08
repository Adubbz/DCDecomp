.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_690
/* 19A410 0029A310 746F7000 */ .word GlobalDataBuffer + 0x45BEF4
/* 19A414 0029A314 00000000 */ .word 0x00000000
