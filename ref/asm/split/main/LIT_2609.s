.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2609
/* 19B2F8 0029B1F8 20726566 */ .word 0x66657220
/* 19B2FC 0029B1FC 203D2000 */ .word 0x00203D20
