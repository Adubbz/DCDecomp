.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_304
/* 199F38 00299E38 3266202D */ .word 0x2D206632
/* 199F3C 00299E3C 32666B75 */ .word 0x756B6632
/* 199F40 00299E40 6D690000 */ .word 0x0000696D
/* 199F44 00299E44 00000000 */ .word 0x00000000
