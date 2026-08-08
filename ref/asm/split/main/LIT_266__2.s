.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_266__2
/* 199DA0 00299CA0 72616D70 */ .word 0x706D6172
/* 199DA4 00299CA4 75000000 */ .word 0x00000075
