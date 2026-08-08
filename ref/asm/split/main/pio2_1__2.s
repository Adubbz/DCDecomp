.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel pio2_1__2
/* 198878 00298778 800FC93F */ .word 0x3FC90F80
