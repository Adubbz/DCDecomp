.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel half
/* 1983F0 002982F0 00000000 */ .word 0x00000000
/* 1983F4 002982F4 0000E03F */ .word 0x3FE00000
