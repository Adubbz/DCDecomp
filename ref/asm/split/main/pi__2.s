.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel pi__2
/* 1984C0 002983C0 DA0F4940 */ .word 0x40490FDA
