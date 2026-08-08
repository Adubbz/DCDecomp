.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel S4
/* 198988 00298888 7DFEB157 */ .word 0x57B1FE7D
/* 19898C 0029888C E31DC73E */ .word 0x3EC71DE3
