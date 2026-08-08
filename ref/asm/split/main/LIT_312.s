.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_312
/* 199F80 00299E80 746F7474 */ .word 0x74746F74
/* 199F84 00299E84 65000000 */ .word 0x00000065
