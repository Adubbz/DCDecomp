.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_674
/* 19CC78 0029CB78 6E696E7A */ .word 0x7A6E696E
/* 19CC7C 0029CB7C 696E0000 */ .word 0x00006E69
