.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_553
/* 19F220 0029F120 615F6A70 */ .word 0x706A5F61
/* 19F224 0029F124 6E2F0000 */ .word 0x00002F6E
