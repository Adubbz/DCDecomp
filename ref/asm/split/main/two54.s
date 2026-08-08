.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel two54
/* 196B98 00296A98 00000000 */ .word 0x00000000
/* 196B9C 00296A9C 00005043 */ .word 0x43500000
