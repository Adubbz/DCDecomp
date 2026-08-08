.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_295
/* 199ED0 00299DD0 6D61726B */ .word 0x6B72616D
/* 199ED4 00299DD4 00000000 */ .word 0x00000000
