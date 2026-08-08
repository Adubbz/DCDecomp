.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_002968D8
/* 1969D8 002968D8 30000000 */ .word 0x00000030
/* 1969DC 002968DC 00000000 */ .word 0x00000000
