.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel zero__4
/* 198868 00298768 00000000 */ .word 0x00000000
