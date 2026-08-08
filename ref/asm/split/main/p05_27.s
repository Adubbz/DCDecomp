.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel p05_27
/* 196A68 00296968 05000000 */ .word 0x00000005
/* 196A6C 0029696C 19000000 */ .word 0x00000019
/* 196A70 00296970 7D000000 */ .word 0x0000007D
/* 196A74 00296974 00000000 */ .word 0x00000000
