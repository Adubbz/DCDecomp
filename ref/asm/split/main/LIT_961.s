.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_961
/* 19DF28 0029DE28 6B67656F */ .word 0x6F65676B
/* 19DF2C 0029DE2C 7A750000 */ .word 0x0000757A
