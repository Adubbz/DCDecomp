.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 2
glabel pio4
/* 198A2C 0029892C DA0F493F */ .word 0x3F490FDA
