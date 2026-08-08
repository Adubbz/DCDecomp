.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_718
/* 19AA68 0029A968 67656469 */ .word 0x69646567
/* 19AA6C 0029A96C 742F0000 */ .word 0x00002F74
