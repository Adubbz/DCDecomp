.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel __infinity
/* 196B90 00296A90 00000000 */ .word 0x00000000
/* 196B94 00296A94 0000F07F */ .word 0x7FF00000
