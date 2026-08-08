.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_002987F0
/* 1988F0 002987F0 4C555555 */ .word 0x5555554C
/* 1988F4 002987F4 5555A53F */ .word 0x3FA55555
