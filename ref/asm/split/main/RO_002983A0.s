.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_002983A0
/* 1984A0 002983A0 0000002E */ .word 0x2E000000
/* 1984A4 002983A4 8A19A33B */ .word 0x3BA3198A
