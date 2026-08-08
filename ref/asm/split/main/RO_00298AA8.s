.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00298AA8
/* 198BA8 00298AA8 61636F73 */ .word 0x736F6361
/* 198BAC 00298AAC 66000000 */ .word 0x00000066
