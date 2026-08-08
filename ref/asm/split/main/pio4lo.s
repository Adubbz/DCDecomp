.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel pio4lo
/* 198A30 00298930 68212233 */ .word 0x33222168
/* 198A34 00298934 00000000 */ .word 0x00000000
