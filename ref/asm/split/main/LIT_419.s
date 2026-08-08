.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_419
/* 19B378 0029B278 5F25642E */ .word 0x2E64255F
/* 19B37C 0029B27C 6D657300 */ .word GlobalDataBuffer + 0x48B4ED
