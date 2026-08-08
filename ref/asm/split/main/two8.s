.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel two8
/* 198870 00298770 00008043 */ .word 0x43800000
