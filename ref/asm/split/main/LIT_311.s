.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_311
/* 199F78 00299E78 79616E65 */ .word 0x656E6179
/* 199F7C 00299E7C 32000000 */ .word 0x00000032
