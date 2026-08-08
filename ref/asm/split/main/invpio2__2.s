.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 2
glabel invpio2__2
/* 198874 00298774 84F9223F */ .word 0x3F22F984
